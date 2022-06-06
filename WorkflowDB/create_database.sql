USE [master]
GO
/****** Object:  Database [WorkflowDB]    Script Date: 31.10.2021 14:46:49 ******/
CREATE DATABASE [WorkflowDB] ON  PRIMARY 
( NAME = N'WorkflowDB', FILENAME = N'E:\MSSQL\MSSQL13.MSSQLSERVER\MSSQL\DATA\WorkflowDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WorkflowDB_log', FILENAME = N'E:\MSSQL\MSSQL13.MSSQLSERVER\MSSQL\DATA\WorkflowDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WorkflowDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WorkflowDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WorkflowDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WorkflowDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WorkflowDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WorkflowDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WorkflowDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WorkflowDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WorkflowDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WorkflowDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WorkflowDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WorkflowDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WorkflowDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WorkflowDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WorkflowDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WorkflowDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WorkflowDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WorkflowDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WorkflowDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WorkflowDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WorkflowDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WorkflowDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WorkflowDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WorkflowDB] SET RECOVERY FULL 
GO
ALTER DATABASE [WorkflowDB] SET  MULTI_USER 
GO
ALTER DATABASE [WorkflowDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WorkflowDB] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WorkflowDB', N'ON'
GO
USE [WorkflowDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [WorkflowDB]
GO
/****** Object:  User [debug]    Script Date: 31.10.2021 14:46:49 ******/
CREATE USER [debug] FOR LOGIN [debug] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'debug'
GO
/****** Object:  UserDefinedFunction [dbo].[CHECK_IsEmpty_fn]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CHECK EMPTY VALUE
--   0 -- source value is not empty value
--   1 -- EMPTY
--
-- x-parser, v 0.3.5, 2010-10-01, ichar
--
CREATE function [dbo].[CHECK_IsEmpty_fn](@pSource varchar(1000))
returns int
as
BEGIN
    if @pSource is NULL or LEN(@pSource) = 0
        return 1 -- 0
    if RTRIM(LTRIM(@pSource)) <> ''
        return 0
    return 1
END



GO
/****** Object:  UserDefinedFunction [dbo].[CHECK_IsEqual_fn]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CHECK EQUAL STRING VALUE
--   0 -- source value is not equal value
--   1 -- EQUAL
--
-- v 0.0.1, 2021-03-12, ichar
--
CREATE function [dbo].[CHECK_IsEqual_fn](@s1 varchar(2000), @s2 varchar(2000))
returns int
as
BEGIN
    if @s1 is NULL and @s2 is NULL
        return 1
    if RTRIM(LTRIM(ISNULL(@s1, ''))) != RTRIM(LTRIM(ISNULL(@s2, '')))
        return 0
    return 1
END



GO
/****** Object:  UserDefinedFunction [dbo].[CHECK_IsFloatEqual_fn]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CHECK EQUAL STRING VALUE
--   0 -- source value is not equal value
--   1 -- EQUAL
--
-- v 0.0.1, 2021-03-12, ichar
--
CREATE function [dbo].[CHECK_IsFloatEqual_fn](@s1 float, @s2 float)
returns int
as
BEGIN
    if @s1 is NULL and @s2 is NULL
        return 1
    if RTRIM(LTRIM(ISNULL(@s1, ''))) != RTRIM(LTRIM(ISNULL(@s2, '')))
        return 0
    return 1
END



GO
/****** Object:  UserDefinedFunction [dbo].[CHECK_IsInReviewers_fn]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CHECK IF LOGIN IS IN REVIEWERS LIST
--
CREATE function [dbo].[CHECK_IsInReviewers_fn](@p_OrderID int, @p_Login varchar(50))
returns bit
as
BEGIN
    declare @x bit = 0
    select @x=1 from [WorkflowDB].[dbo].[Reviewers_tb] where OrderID=@p_OrderID and Login=@p_Login
    return @x
END



GO
/****** Object:  UserDefinedFunction [dbo].[CHECK_IsInReviews_fn]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CHECK IF GIVEN STATUSES IS IN REVIEWS
--   @pReviews  -- source value
--   @pStatuses -- statuses: '1,2,3,4'
--
CREATE FUNCTION [dbo].[CHECK_IsInReviews_fn](
    @pReviews   varchar(MAX), 
    @pStatuses  varchar(50)    
)
returns bit
AS
BEGIN
    DECLARE
        @exists  bit

    select top 1 @exists=1 from [dbo].[GET_SplittedStrings_fn](@pReviews, ':') where 
        item in (select item from [dbo].[GET_SplittedStrings_fn](@pStatuses, ','))
    if @exists IS NULL
        return 0
    return 1
END


GO
/****** Object:  UserDefinedFunction [dbo].[CHECK_IsNumeric_fn]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CHECK VALID NUMERIC
--   0 -- source value is not a valid number
--   1 -- OK
--
-- x-parser, v 0.3.5, 2010-10-01, ichar
--
CREATE function [dbo].[CHECK_IsNumeric_fn](@pSource varchar(2000))
returns int
as
BEGIN
    if @pSource is NULL or LEN(@pSource) = 0 or ISNUMERIC(@pSource) = 0
        return 0
    return 1
END



GO
/****** Object:  UserDefinedFunction [dbo].[CONVERT_Money_fn]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CONVERT MONEY(FLOAT) AS VARCHAR
--
CREATE function [dbo].[CONVERT_Money_fn](@x float)
returns varchar(50)
as
BEGIN
    return replace(replace(convert(varchar, convert(money, @x), 1), ',', ' '), '.', ',')
END



GO
/****** Object:  UserDefinedFunction [dbo].[DATE_GetDateTime_fn]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- RETURNS CURRENT DATETIME WITH SPECIAL FORMATING
--
-- x-parser, v 0.3.5, 2010-10-01, ichar
--
CREATE function [dbo].[DATE_GetDateTime_fn](@datevalue datetime, @datetype varchar(10))
returns varchar(10)
as
BEGIN
    DECLARE @s varchar(50), @y char(2), @yy char(4), @m char(2), @d char(2), @mode varchar(10)
    set @s  = convert( varchar, cast(@datevalue as datetime), 121 )
    set @y  = substring(@s, 3, 2)
    set @yy = substring(@s, 1, 4)
    set @m  = substring(@s, 6, 2)
    set @d  = substring(@s, 9, 2)

    set @mode = lower(@datetype)

    if @mode = 'yymmdd' return @y+@m+@d
    if @mode = 'yyyymmdd' return @yy+@m+@d
    if @mode = 'ddmmyy' return @d+@m+@y
    if @mode = 'ddmmyyyy' return @d+@m+@yy
    if @mode = 'mm/yy' return @m+'/'+@y
    if @mode = 'mm/yyyy' return @m+'/'+@yy
    if @mode = 'dd/mm/yy' return @d+'/'+@m+'/'+@y
    if @mode = 'dd/mm/yyyy' return @d+'/'+@m+'/'+@yy
    if @mode = 'dd.mm.yy' return @d+'.'+@m+'.'+@y
    if @mode = 'dd.mm.yyyy' return @d+'.'+@m+'.'+@yy
    return @s
END



GO
/****** Object:  UserDefinedFunction [dbo].[GET_Reviewers_fn]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- RETURNS REVIEWER LIST AS STRING
--
CREATE function [dbo].[GET_Reviewers_fn](@p_OrderID int)
returns varchar(1000)
as
BEGIN
    DECLARE 
        @s varchar(1000) = '', 
        @v varchar(1000)
    DECLARE x CURSOR READ_ONLY FOR SELECT [Login] FROM [WorkflowDB].[dbo].[Reviewers_tb] WHERE OrderID=@p_OrderID
    OPEN x
    while (1=1) begin
        FETCH NEXT FROM x INTO @v
        if @@fetch_status = -1
            break
        set @s = @s + @v + ':'
    end
    CLOSE x
    DEALLOCATE x
    return @s
END



GO
/****** Object:  UserDefinedFunction [dbo].[GET_ReviewStatuses_fn]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- RETURNS REVIEW STATUSES FOR GIVEN ORDER ID
--
CREATE function [dbo].[GET_ReviewStatuses_fn](@p_OrderID int)
returns varchar(500)
as
BEGIN
    declare @x varchar(500) = ''
    select @x = @x + cast(Status as varchar) + ':' from dbo.Reviews_tb where OrderID=@p_OrderID
    return @x
END



GO
/****** Object:  UserDefinedFunction [dbo].[GET_RowsNodeCount_fn]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE function [dbo].[GET_RowsNodeCount_fn](@pCode varchar(100))
returns int
as
BEGIN
    DECLARE 
        @rows int = 0
    select 
        @rows=count(*) from [dbo].[DIC_StockList_tb] where NodeCode like @pCode+'.%'
    return @rows
END



GO
/****** Object:  UserDefinedFunction [dbo].[GET_SplittedIDs_fn]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- GET SPLITTED IDs VALUE TABLE
--   @pSource   -- source value
--   @pSplitter -- splitted by keyword
--
CREATE FUNCTION [dbo].[GET_SplittedIDs_fn](
    @pSource    varchar(MAX), 
    @pSplitter  varchar(10)
)
returns @data TABLE(n int IDENTITY(0,1), item int)
AS
BEGIN
    DECLARE @p int
    DECLARE @value int

    WHILE LEN(@pSource) > 0
    BEGIN
        select @p = CHARINDEX(@pSplitter, @pSource)
        if @p = 0
            select @p = LEN(@pSource) + 1
        set @value = cast(LEFT(@pSource, @p-1) as int)
        insert into @data select @value
        set @pSource = SUBSTRING(@pSource, @p+1, LEN(@pSource))
    END
    return
END



GO
/****** Object:  UserDefinedFunction [dbo].[GET_SplittedItem_fn]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- GET SPLITTED STRING VALUE ITEM
--   @pSource   -- source value
--   @pSplitter -- splitted by keyword
--   @pNum      -- item index (int: 0,1,2...)
--
CREATE function [dbo].[GET_SplittedItem_fn](@pSource varchar(MAX), @pSplitter varchar(10), @pNum int)
returns varchar(MAX)
as
BEGIN
    if @pSource is NULL or LEN(@pSource) = 0
        return ''
    DECLARE @data TABLE(n int IDENTITY(0,1), item varchar(MAX))
    DECLARE @v varchar(2000)
    DECLARE @p int
    set @v = ''

    WHILE LEN(@pSource) > 0
    BEGIN
        select @p  = CHARINDEX(@pSplitter, @pSource)
        if @p = 0
            select @p = LEN(@pSource)+1
        insert into @data select LEFT(@pSource, @p-1)
        set @pSource = SUBSTRING(@pSource, @p+1, LEN(@pSource))
    END

    if @pNum + 1 <= (select count(*) from @data)
        SELECT @v = item FROM @data WHERE n = @pNum
    return @v
END



GO
/****** Object:  UserDefinedFunction [dbo].[GET_SplittedStrings_fn]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- GET SPLITTED STRINGs VALUE TABLE
--   @pSource   -- source value
--   @pSplitter -- splitted by keyword
--
CREATE FUNCTION [dbo].[GET_SplittedStrings_fn](
    @pSource    varchar(MAX), 
    @pSplitter  varchar(10)
)
returns @data TABLE(n int IDENTITY(0,1), item varchar(1000))
AS
BEGIN
    DECLARE 
        @p int,
        @l int,
        @value varchar(1000)

    set @l = LEN(@pSplitter)

    WHILE LEN(@pSource) > 0
    BEGIN
        select @p = CHARINDEX(@pSplitter, @pSource)
        if @p = 0
            select @p = LEN(@pSource) + @l
        set @value = LEFT(@pSource, @p-1)
        insert into @data select @value
        set @pSource = SUBSTRING(@pSource, @p+@l, LEN(@pSource))
    END
    return
END


GO
/****** Object:  UserDefinedFunction [dbo].[GET_UnreadByLogin_fn]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- RETURNS UNREAD LOGIN FOR GIVEN ORDER ID
--
CREATE function [dbo].[GET_UnreadByLogin_fn](@p_OrderID int)
returns varchar(500)
as
BEGIN
    declare @x varchar(500) = ''
    select @x = @x + Login + ':' from dbo.Unreads_tb where OrderID=@p_OrderID
    return @x
END




GO
/****** Object:  UserDefinedFunction [dbo].[Strip_fn]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  FUNCTION [dbo].[Strip_fn](@v varchar(max))
returns varchar(max)
as
begin
  return LTRIM(RTRIM(ISNULL(@v, '')))
end


GO
/****** Object:  Table [dbo].[Comments_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[CommentID] [int] NULL,
	[Login] [varchar](50) NOT NULL,
	[Note] [varchar](1000) NULL,
	[RD] [datetime] NULL,
 CONSTRAINT [PK_Comments_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Decrees_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Decrees_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[ReviewID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Status] [int] NULL,
	[DueDate] [datetime] NULL,
	[RD] [datetime] NULL,
	[ReportID] [int] NULL,
	[EditedBy] [varchar](50) NULL,
	[OrderID] [int] NULL,
	[MD] [int] NULL,
 CONSTRAINT [PK_Decrees_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DIC_Activities_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIC_Activities_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](10) NULL,
 CONSTRAINT [PK_Activities] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DIC_Categories_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIC_Categories_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[MD] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DIC_Comments_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIC_Comments_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DIC_Conditions_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIC_Conditions_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](10) NULL,
 CONSTRAINT [PK_Conditions] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DIC_Equipments_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIC_Equipments_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[SubdivisionID] [int] NOT NULL,
	[Name] [varchar](1000) NULL,
	[Title] [varchar](1000) NULL,
 CONSTRAINT [PK_Equipments] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DIC_Params_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIC_Params_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](10) NULL,
	[MD] [int] NULL,
 CONSTRAINT [PK_Params] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DIC_Payments_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIC_Payments_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DIC_Refers_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIC_Refers_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[MD] [int] NULL,
 CONSTRAINT [PK_Refers] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DIC_Sectors_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIC_Sectors_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Manager] [varchar](100) NULL,
	[Code] [char](10) NULL,
 CONSTRAINT [PK_Sectors] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DIC_Sellers_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIC_Sellers_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Title] [varchar](250) NULL,
	[Address] [varchar](1000) NULL,
	[Code] [varchar](20) NULL,
	[Type] [int] NULL,
	[Contact] [varchar](200) NULL,
	[URL] [varchar](200) NULL,
	[Phone] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[EditedBy] [varchar](50) NULL,
	[RD] [datetime] NULL,
	[MD] [int] NULL,
 CONSTRAINT [PK_Sellers] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DIC_StockList_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIC_StockList_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Title] [varchar](250) NULL,
	[ShortName] [varchar](100) NULL,
	[NodeLevel] [int] NULL,
	[NodeCode] [varchar](100) NOT NULL,
	[RefCode1C] [varchar](20) NULL,
	[Comment] [varchar](1000) NOT NULL,
	[EditedBy] [varchar](50) NULL,
	[RD] [datetime] NULL,
	[Children] [int] NULL,
	[Params] [varchar](200) NULL,
 CONSTRAINT [PK_DIC_StockList_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DIC_Subdivisions_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIC_Subdivisions_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Manager] [varchar](100) NULL,
	[Code] [char](4) NULL,
 CONSTRAINT [PK_Subdivisions] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DIC_Vendors_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIC_Vendors_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
 CONSTRAINT [PK_Vendors] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Items_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Login] [varchar](50) NULL,
	[Name] [varchar](250) NULL,
	[Qty] [int] NULL,
	[Units] [varchar](20) NULL,
	[Total] [money] NULL,
	[Tax] [money] NULL,
	[RD] [datetime] NULL,
	[Account] [varchar](100) NULL,
	[Currency] [varchar](10) NULL,
	[VendorID] [int] NULL,
 CONSTRAINT [PK_Items_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderChanges_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderChanges_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Name] [varchar](500) NULL,
	[Value] [varchar](2000) NULL,
	[RD] [datetime] NULL,
 CONSTRAINT [PK_OrderChanges_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDates_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDates_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Created] [datetime] NULL,
	[Approved] [datetime] NULL,
	[Paid] [datetime] NULL,
	[Delivered] [datetime] NULL,
	[ReviewDueDate] [datetime] NULL,
	[WithMail] [bit] NULL,
	[FinishDueDate] [datetime] NULL,
	[AuditDate] [datetime] NULL,
	[Validated] [datetime] NULL,
 CONSTRAINT [PK_OrderDates_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderRefers_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderRefers_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ReferID] [int] NOT NULL,
	[OrderReferID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Note] [varchar](1000) NULL,
	[RD] [datetime] NULL,
 CONSTRAINT [PK_OrderRefers_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders_Log_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_Log_tb](
	[LID] [int] IDENTITY(1,1) NOT NULL,
	[TID] [int] NOT NULL,
	[Status] [int] NULL,
	[EditedBy] [varchar](50) NULL,
	[RD] [datetime] NULL,
	[Oper] [char](1) NOT NULL,
 CONSTRAINT [PK_Orders_Log_LID] PRIMARY KEY CLUSTERED 
(
	[LID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[SubdivisionID] [int] NULL,
	[EquipmentID] [int] NULL,
	[ConditionID] [int] NULL,
	[CategoryID] [int] NULL,
	[SellerID] [int] NULL,
	[StockListID] [int] NULL,
	[Login] [varchar](50) NULL,
	[Article] [varchar](500) NULL,
	[Qty] [int] NULL,
	[Purpose] [varchar](2000) NULL,
	[Price] [float] NULL,
	[Currency] [varchar](10) NULL,
	[Total] [money] NULL,
	[Tax] [money] NULL,
	[Status] [int] NULL,
	[Account] [varchar](500) NULL,
	[URL] [varchar](200) NULL,
	[EditedBy] [varchar](50) NULL,
	[RowSpan] [int] NULL,
	[MD] [int] NULL,
	[RD] [datetime] NULL,
	[SectorID] [int] NULL,
	[ActivityID] [int] NULL,
 CONSTRAINT [PK_Orders_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Params_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Params_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ParamID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Value] [varchar](500) NULL,
	[RD] [datetime] NULL,
 CONSTRAINT [PK_Params_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentChanges_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentChanges_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Status] [int] NULL,
	[RD] [datetime] NULL,
 CONSTRAINT [PK_PaymentChanges_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payments_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[PaymentID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[Total] [money] NULL,
	[Tax] [money] NULL,
	[Status] [int] NULL,
	[RD] [datetime] NULL,
	[Currency] [varchar](10) NULL,
	[Rate] [float] NULL,
	[Comment] [varchar](1000) NULL,
 CONSTRAINT [PK_Payments_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reviewers_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviewers_tb](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Reviewers_TID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reviews_Log_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews_Log_tb](
	[LID] [int] IDENTITY(1,1) NOT NULL,
	[TID] [int] NOT NULL,
	[Status] [int] NULL,
	[EditedBy] [varchar](50) NULL,
	[RD] [datetime] NULL,
	[Oper] [char](1) NOT NULL,
 CONSTRAINT [PK_Reviews_Log_LID] PRIMARY KEY CLUSTERED 
(
	[LID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reviews_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Reviewer] [varchar](50) NULL,
	[Status] [int] NULL,
	[Note] [varchar](1000) NULL,
	[RD] [datetime] NULL,
 CONSTRAINT [PK_Reviews_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Unreads_tb]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unreads_tb](
	[OrderID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[WEB_Companies_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_Companies_vw]
AS
SELECT DISTINCT p.OrderID, p.Value AS Name
FROM         dbo.Params_tb AS p INNER JOIN
                      dbo.DIC_Params_tb AS d ON d.TID = p.ParamID
WHERE     (d.Name LIKE 'Компания%')


GO
/****** Object:  View [dbo].[WEB_Orders_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_Orders_vw]
AS
SELECT        o.TID, o.ActivityID, o.SubdivisionID, o.EquipmentID, o.CategoryID, o.StockListID, o.Login AS Author, o.Account, o.Article, o.Purpose,
                             (SELECT        TOP (1) Name
                               FROM            dbo.WEB_Companies_vw
                               WHERE        (OrderID = o.TID)) AS Company, a.Name AS Activity, p.Name AS Subdivision, e.Title AS Equipment, g.Name AS Category, o.Status,
                             (SELECT        TOP (1) Status
                               FROM            dbo.Reviews_tb AS r
                               WHERE        (OrderID = o.TID)
                               ORDER BY TID DESC) AS ReviewStatus, dbo.GET_ReviewStatuses_fn(o.TID) AS ReviewStatuses, p.Code AS SubdivisionCode, l.NodeCode AS StockListNodeCode, dbo.GET_UnreadByLogin_fn(o.TID) 
                         AS UnreadByLogin, o.EditedBy, d.Created, d.Approved, d.ReviewDueDate, d.FinishDueDate, o.MD, o.RD
FROM            dbo.Orders_tb AS o LEFT OUTER JOIN
                         dbo.DIC_Activities_tb AS a ON a.TID = o.ActivityID LEFT OUTER JOIN
                         dbo.DIC_Subdivisions_tb AS p ON p.TID = o.SubdivisionID LEFT OUTER JOIN
                         dbo.DIC_Equipments_tb AS e ON e.TID = o.EquipmentID LEFT OUTER JOIN
                         dbo.DIC_Categories_tb AS g ON g.TID = o.CategoryID LEFT OUTER JOIN
                         dbo.DIC_StockList_tb AS l ON l.TID = o.StockListID LEFT OUTER JOIN
                         dbo.OrderDates_tb AS d ON d.OrderID = o.TID

GO
/****** Object:  View [dbo].[WEB_Schedule_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_Schedule_vw]
AS
SELECT        o.TID AS OrderID, o.Author, o.Status AS OrderStatus, o.RD AS RegistryDate, r.TID AS ReviewID, r.Login AS Reviewer, r.Status AS ReviewStatus, d.Created, d.Approved, d.ReviewDueDate, o.CategoryID, 
                         o.SubdivisionID, o.SubdivisionCode, o.MD, r.RD AS StatusDate
FROM            dbo.Reviews_tb AS r RIGHT OUTER JOIN
                         dbo.WEB_Orders_vw AS o ON o.TID = r.OrderID LEFT OUTER JOIN
                         dbo.OrderDates_tb AS d ON o.TID = d.OrderID

GO
/****** Object:  View [dbo].[WEB_ReviewerOrders_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_ReviewerOrders_vw]
AS
SELECT        o.TID, o.ActivityID, o.SubdivisionID, o.EquipmentID, o.CategoryID, o.StockListID, o.Author, o.Account, o.Article, o.Purpose, o.Company, o.Activity, o.Subdivision, o.Equipment, o.Category, o.Status, o.ReviewStatus, 
                         o.ReviewStatuses, o.SubdivisionCode, o.StockListNodeCode, o.UnreadByLogin, o.EditedBy, o.Created, o.Approved, o.ReviewDueDate, o.FinishDueDate, o.MD, o.RD, r.Login AS Reviewer
FROM            dbo.WEB_Orders_vw AS o LEFT OUTER JOIN
                         dbo.Reviewers_tb AS r ON r.OrderID = o.TID

GO
/****** Object:  View [dbo].[WEB_OrderItems_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_OrderItems_vw]
AS
SELECT s.TID, s.OrderID, v.TID AS VendorID, s.Login, s.Name, s.Qty, s.Units, s.Total, s.Tax, s.Currency, s.Account, v.Name AS Vendor, s.RD
FROM     dbo.Items_tb AS s LEFT OUTER JOIN
                  dbo.DIC_Vendors_tb AS v ON v.TID = s.VendorID


GO
/****** Object:  View [dbo].[WEB_OrderVendors_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_OrderVendors_vw]
AS
SELECT DISTINCT VendorID AS TID, OrderID, Vendor AS Name
FROM     dbo.WEB_OrderItems_vw AS s
WHERE  (dbo.CHECK_IsEmpty_fn(Vendor) = 0)


GO
/****** Object:  View [dbo].[BATCH_Sellers_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BATCH_Sellers_vw]
AS
SELECT DISTINCT s.TID, COUNT(o.SellerID) AS Orders, s.Name, s.Title, s.Address
FROM     dbo.DIC_Sellers_tb AS s LEFT OUTER JOIN
                  dbo.Orders_tb AS o ON s.TID = o.SellerID
GROUP BY s.TID, s.Name, s.Title, s.Address


GO
/****** Object:  View [dbo].[WEB_Activities_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_Activities_vw]
AS
SELECT        TID, Name, Code
FROM            dbo.DIC_Activities_tb AS s

GO
/****** Object:  View [dbo].[WEB_Authors_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_Authors_vw]
AS
SELECT DISTINCT TOP (100) PERCENT Login AS Author
FROM            dbo.Orders_tb AS o



GO
/****** Object:  View [dbo].[WEB_Categories_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_Categories_vw]
AS
SELECT TID, Name, MD
FROM     dbo.DIC_Categories_tb AS s


GO
/****** Object:  View [dbo].[WEB_Comments_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_Comments_vw]
AS
SELECT     TID, Name
FROM         dbo.DIC_Comments_tb AS s



GO
/****** Object:  View [dbo].[WEB_Conditions_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_Conditions_vw]
AS
SELECT        TID, Name, Code
FROM            dbo.DIC_Conditions_tb AS s


GO
/****** Object:  View [dbo].[WEB_CostOrders_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_CostOrders_vw]
AS
SELECT        o.TID, o.Login AS Author, o.Article, o.Qty, o.Price, o.Currency, o.Total, o.Tax, p.Name AS Subdivision, u.Name AS Sector, s.Name AS Seller, o.Account, o.Status, p.TID AS SubdivisionID, u.TID AS SectorID, e.TID AS EquipmentID, 
                         s.TID AS SellerID, c.TID AS ConditionID, o.CategoryID, o.StockListID, l.NodeCode AS StockListNodeCode, c.Code AS ConditionCode, o.EditedBy, d.Created, d.Approved, d.Paid, d.Delivered, o.MD, o.RD
FROM            dbo.Orders_tb AS o LEFT OUTER JOIN
                         dbo.DIC_Subdivisions_tb AS p ON p.TID = o.SubdivisionID LEFT OUTER JOIN
                         dbo.DIC_Sectors_tb AS u ON u.TID = o.SectorID LEFT OUTER JOIN
                         dbo.DIC_Equipments_tb AS e ON e.TID = o.EquipmentID LEFT OUTER JOIN
                         dbo.DIC_Conditions_tb AS c ON c.TID = o.ConditionID LEFT OUTER JOIN
                         dbo.DIC_Sellers_tb AS s ON s.TID = o.SellerID LEFT OUTER JOIN
                         dbo.DIC_Categories_tb AS g ON g.TID = o.CategoryID LEFT OUTER JOIN
                         dbo.DIC_StockList_tb AS l ON l.TID = o.StockListID LEFT OUTER JOIN
                         dbo.OrderDates_tb AS d ON d.OrderID = o.TID



GO
/****** Object:  View [dbo].[WEB_Decrees_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_Decrees_vw]
AS
SELECT        d.TID, d.Login AS Executor, d.Status AS DecreeStatus, d.DueDate, d.ReportID, d.EditedBy, r.TID AS ReviewID, r.OrderID, r.Login AS Author, r.Reviewer, r.Note, r.Status AS ReviewStatus, r.RD AS ReviewDate, 
                         d.MD, d.RD
FROM            dbo.Decrees_tb AS d INNER JOIN
                         dbo.Reviews_tb AS r ON r.TID = d.ReviewID

GO
/****** Object:  View [dbo].[WEB_Equipments_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_Equipments_vw]
AS
SELECT     s.TID, d.Name AS Subdivision, s.Title, s.Name, s.SubdivisionID
FROM         dbo.DIC_Equipments_tb AS s INNER JOIN
                      dbo.DIC_Subdivisions_tb AS d ON d.TID = s.SubdivisionID



GO
/****** Object:  View [dbo].[WEB_OrderChanges_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_OrderChanges_vw]
AS
SELECT        TID, OrderID, Login, Name, Value, RD
FROM            dbo.OrderChanges_tb AS c


GO
/****** Object:  View [dbo].[WEB_OrderComments_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_OrderComments_vw]
AS
SELECT     s.TID, s.OrderID, s.CommentID, s.Login, p.Name AS Author, s.Note, s.RD
FROM         dbo.Comments_tb AS s INNER JOIN
                      dbo.DIC_Comments_tb AS p ON p.TID = s.CommentID



GO
/****** Object:  View [dbo].[WEB_OrderParams_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_OrderParams_vw]
AS
SELECT     s.TID, s.OrderID, s.ParamID, s.Login, p.Name, p.Code, s.Value, p.MD, s.RD
FROM         dbo.Params_tb AS s INNER JOIN
                      dbo.DIC_Params_tb AS p ON p.TID = s.ParamID


GO
/****** Object:  View [dbo].[WEB_OrderPayments_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_OrderPayments_vw]
AS
SELECT s.TID, s.OrderID, s.PaymentID, s.Login, p.Name AS Purpose, s.PaymentDate, s.Total, s.Tax, s.Status, s.Currency, s.Comment, s.Rate, s.RD
FROM     dbo.Payments_tb AS s INNER JOIN
                  dbo.DIC_Payments_tb AS p ON p.TID = s.PaymentID


GO
/****** Object:  View [dbo].[WEB_OrderRefers_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_OrderRefers_vw]
AS
SELECT        r.TID, r.OrderID, r.ReferID, r.OrderReferID, r.Login, p.Name AS ReferType, o.Article AS Name, o.Qty, o.Currency, o.Total, r.Note, o.RD AS RegistryDate, r.RD AS ReferDate
FROM            dbo.OrderRefers_tb AS r INNER JOIN
                         dbo.DIC_Refers_tb AS p ON p.TID = r.ReferID INNER JOIN
                         dbo.Orders_tb AS o ON o.TID = r.OrderReferID



GO
/****** Object:  View [dbo].[WEB_Params_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_Params_vw]
AS
SELECT TID, Name, MD
FROM     dbo.DIC_Params_tb AS s


GO
/****** Object:  View [dbo].[WEB_ParamValues_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_ParamValues_vw]
AS
SELECT DISTINCT ParamID, Value
FROM            dbo.Params_tb AS p


GO
/****** Object:  View [dbo].[WEB_Payments_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_Payments_vw]
AS
SELECT TID, Name
FROM     dbo.DIC_Payments_tb AS s


GO
/****** Object:  View [dbo].[WEB_Refers_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_Refers_vw]
AS
SELECT        TID, Name, MD
FROM            dbo.DIC_Refers_tb AS s



GO
/****** Object:  View [dbo].[WEB_ReviewPayments_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_ReviewPayments_vw]
AS
SELECT s.TID, s.OrderID, o.SubdivisionID, o.Login AS Author, d.Name AS Subdivision, o.Article, o.Currency AS OrderCurrency, o.Total AS OrderTotal, s.PaymentID, s.Login, p.Name AS Purpose, c.Name AS Seller, s.PaymentDate, 
                  s.Total, s.Total * s.Rate AS TotalRub, s.Tax, s.Status, s.Currency, s.Rate, s.Comment, o.MD, s.RD
FROM     dbo.Payments_tb AS s INNER JOIN
                  dbo.Orders_tb AS o ON o.TID = s.OrderID INNER JOIN
                  dbo.DIC_Payments_tb AS p ON p.TID = s.PaymentID LEFT OUTER JOIN
                  dbo.DIC_Subdivisions_tb AS d ON d.TID = o.SubdivisionID LEFT OUTER JOIN
                  dbo.DIC_Sellers_tb AS c ON c.TID = o.SellerID


GO
/****** Object:  View [dbo].[WEB_Reviews_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_Reviews_vw]
AS
SELECT        r.TID, o.TID AS OrderID, r.Login, r.Reviewer, r.Status, d.Status AS DecreeStatus, r.Note, d.DueDate, o.MD, o.RD AS RegistryDate, r.RD AS StatusDate
FROM            dbo.Reviews_tb AS r INNER JOIN
                         dbo.Orders_tb AS o ON o.TID = r.OrderID LEFT OUTER JOIN
                         dbo.Decrees_tb AS d ON d.ReviewID = r.TID

GO
/****** Object:  View [dbo].[WEB_Sectors_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_Sectors_vw]
AS
SELECT        TID, Name, Code, Manager, Name + ' (' + Manager + ')' AS FullName
FROM            dbo.DIC_Sectors_tb AS s



GO
/****** Object:  View [dbo].[WEB_Sellers_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_Sellers_vw]
AS
SELECT TID, Name, Title, Address, Code, Type, Contact, URL, Phone, Email, EditedBy, MD, RD
FROM     dbo.DIC_Sellers_tb AS s


GO
/****** Object:  View [dbo].[WEB_Stocks_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_Stocks_vw]
AS
SELECT        TID, Name, Title, ShortName, NodeLevel, NodeCode, RefCode1C, Params, Comment, EditedBy, RD, Children,
                             (SELECT        COUNT(*) AS Expr1
                               FROM            dbo.Orders_tb AS o
                               WHERE        (StockListID = s.TID)) AS Orders
FROM            dbo.DIC_StockList_tb AS s


GO
/****** Object:  View [dbo].[WEB_StocksChildren_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_StocksChildren_vw]
AS
SELECT     TID, Name, Title, ShortName, NodeLevel, NodeCode, RefCode1C, Comment, EditedBy, RD, Children,
                          (SELECT     COUNT(*) AS Expr1
                            FROM          dbo.Orders_tb AS o
                            WHERE      (StockListID IN
                                                       (SELECT     TID
                                                         FROM          dbo.DIC_StockList_tb
                                                         WHERE      (NodeCode LIKE s.NodeCode + '%')))) AS Orders
FROM         dbo.DIC_StockList_tb AS s


GO
/****** Object:  View [dbo].[WEB_Subdivisions_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_Subdivisions_vw]
AS
SELECT     TID, Name, Code, Manager, Name + ' (' + Manager + ')' AS FullName
FROM         dbo.DIC_Subdivisions_tb AS s


GO
/****** Object:  View [dbo].[WEB_Vendors_vw]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_Vendors_vw]
AS
SELECT TID, Name
FROM     dbo.DIC_Vendors_tb AS s


GO
/****** Object:  Index [WX_Comments_CommentID]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [WX_Comments_CommentID] ON [dbo].[Comments_tb]
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Comments_OrderID]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [WX_Comments_OrderID] ON [dbo].[Comments_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Decrees_ReviewID]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [WX_Decrees_ReviewID] ON [dbo].[Decrees_tb]
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_Activities_Name]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_Activities_Name] ON [dbo].[DIC_Activities_tb]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_Categories_Name]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_Categories_Name] ON [dbo].[DIC_Categories_tb]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_Comments_Name]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_Comments_Name] ON [dbo].[DIC_Comments_tb]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_Conditions_Name]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_Conditions_Name] ON [dbo].[DIC_Conditions_tb]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_Equipments_Title]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_Equipments_Title] ON [dbo].[DIC_Equipments_tb]
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_Params_Name]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_Params_Name] ON [dbo].[DIC_Params_tb]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_Payments_Name]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_Payments_Name] ON [dbo].[DIC_Payments_tb]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_Refers_Name]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_Refers_Name] ON [dbo].[DIC_Refers_tb]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_Sectors_Name]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_Sectors_Name] ON [dbo].[DIC_Sectors_tb]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_Sellers_Name]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_Sellers_Name] ON [dbo].[DIC_Sellers_tb]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_StockList_Name]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_StockList_Name] ON [dbo].[DIC_StockList_tb]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_StockList_NodeCode]    Script Date: 31.10.2021 14:46:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DIC_StockList_NodeCode] ON [dbo].[DIC_StockList_tb]
(
	[NodeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DIC_StockList_NodeLevel]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_StockList_NodeLevel] ON [dbo].[DIC_StockList_tb]
(
	[NodeLevel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_StockList_ShortName]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_StockList_ShortName] ON [dbo].[DIC_StockList_tb]
(
	[ShortName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_Subdivisions_Name]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_Subdivisions_Name] ON [dbo].[DIC_Subdivisions_tb]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_Vendors_Name]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_Vendors_Name] ON [dbo].[DIC_Vendors_tb]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Items_OrderID]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [WX_Items_OrderID] ON [dbo].[Items_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_OrderChanges_OrderID]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [WX_OrderChanges_OrderID] ON [dbo].[OrderChanges_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_OrderDates_OrderID]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [WX_OrderDates_OrderID] ON [dbo].[OrderDates_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_OrderRefers_OrderID]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [WX_OrderRefers_OrderID] ON [dbo].[OrderRefers_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_OrderRefers_ReferID]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [WX_OrderRefers_ReferID] ON [dbo].[OrderRefers_tb]
(
	[ReferID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Orders_Article]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_Article] ON [dbo].[Orders_tb]
(
	[Article] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Orders_Login]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_Login] ON [dbo].[Orders_tb]
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_MD]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_MD] ON [dbo].[Orders_tb]
(
	[MD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Orders_CategoryID]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [WX_Orders_CategoryID] ON [dbo].[Orders_tb]
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Orders_ConditionID]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [WX_Orders_ConditionID] ON [dbo].[Orders_tb]
(
	[ConditionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Orders_EquipmentID]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [WX_Orders_EquipmentID] ON [dbo].[Orders_tb]
(
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Orders_SellerID]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [WX_Orders_SellerID] ON [dbo].[Orders_tb]
(
	[SellerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Orders_StockListID]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [WX_Orders_StockListID] ON [dbo].[Orders_tb]
(
	[StockListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Orders_SubdivisionID]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [WX_Orders_SubdivisionID] ON [dbo].[Orders_tb]
(
	[SubdivisionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Params_OrderID]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [WX_Params_OrderID] ON [dbo].[Params_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Params_ParamID]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [WX_Params_ParamID] ON [dbo].[Params_tb]
(
	[ParamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_PaymentChanges_OrderID]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [WX_PaymentChanges_OrderID] ON [dbo].[PaymentChanges_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_PaymentChanges_PaymentID]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [WX_PaymentChanges_PaymentID] ON [dbo].[PaymentChanges_tb]
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Payments_OrderID]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [WX_Payments_OrderID] ON [dbo].[Payments_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Payments_PaymentID]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [WX_Payments_PaymentID] ON [dbo].[Payments_tb]
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Reviewers_OrderID]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [WX_Reviewers_OrderID] ON [dbo].[Reviewers_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Reviews_OrderID]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [WX_Reviews_OrderID] ON [dbo].[Reviews_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Unreads_OrderID]    Script Date: 31.10.2021 14:46:49 ******/
CREATE NONCLUSTERED INDEX [WX_Unreads_OrderID] ON [dbo].[Unreads_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments_tb] ADD  CONSTRAINT [DF_Comments_RD]  DEFAULT (getdate()) FOR [RD]
GO
ALTER TABLE [dbo].[Decrees_tb] ADD  CONSTRAINT [DF_Decrees_RD]  DEFAULT (getdate()) FOR [RD]
GO
ALTER TABLE [dbo].[DIC_StockList_tb] ADD  CONSTRAINT [DF_DIC_StockList_RD]  DEFAULT (getdate()) FOR [RD]
GO
ALTER TABLE [dbo].[OrderChanges_tb] ADD  CONSTRAINT [DF_OrderChanges_RD]  DEFAULT (getdate()) FOR [RD]
GO
ALTER TABLE [dbo].[OrderRefers_tb] ADD  CONSTRAINT [DF_OrderRefers_RD]  DEFAULT (getdate()) FOR [RD]
GO
ALTER TABLE [dbo].[Orders_tb] ADD  CONSTRAINT [DF_Orders_Qty]  DEFAULT ((0)) FOR [Qty]
GO
ALTER TABLE [dbo].[Orders_tb] ADD  CONSTRAINT [DF_Orders_RD]  DEFAULT (getdate()) FOR [RD]
GO
ALTER TABLE [dbo].[Params_tb] ADD  CONSTRAINT [DF_Params_RD]  DEFAULT (getdate()) FOR [RD]
GO
ALTER TABLE [dbo].[PaymentChanges_tb] ADD  CONSTRAINT [DF_PaymentChanges_RD]  DEFAULT (getdate()) FOR [RD]
GO
ALTER TABLE [dbo].[Payments_tb] ADD  CONSTRAINT [DF_Payments_RD]  DEFAULT (getdate()) FOR [RD]
GO
ALTER TABLE [dbo].[Reviews_tb] ADD  CONSTRAINT [DF_Reviews_RD]  DEFAULT (getdate()) FOR [RD]
GO
ALTER TABLE [dbo].[Comments_tb]  WITH CHECK ADD  CONSTRAINT [FK_Comments_CommentID] FOREIGN KEY([CommentID])
REFERENCES [dbo].[DIC_Comments_tb] ([TID])
GO
ALTER TABLE [dbo].[Comments_tb] CHECK CONSTRAINT [FK_Comments_CommentID]
GO
ALTER TABLE [dbo].[Comments_tb]  WITH CHECK ADD  CONSTRAINT [FK_Comments_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Comments_tb] CHECK CONSTRAINT [FK_Comments_OrderID]
GO
ALTER TABLE [dbo].[Decrees_tb]  WITH CHECK ADD  CONSTRAINT [FK_Decrees_ReviewID] FOREIGN KEY([ReviewID])
REFERENCES [dbo].[Reviews_tb] ([TID])
GO
ALTER TABLE [dbo].[Decrees_tb] CHECK CONSTRAINT [FK_Decrees_ReviewID]
GO
ALTER TABLE [dbo].[DIC_Equipments_tb]  WITH CHECK ADD  CONSTRAINT [FK_DIC_Equipments_SubdivisionID] FOREIGN KEY([SubdivisionID])
REFERENCES [dbo].[DIC_Subdivisions_tb] ([TID])
GO
ALTER TABLE [dbo].[DIC_Equipments_tb] CHECK CONSTRAINT [FK_DIC_Equipments_SubdivisionID]
GO
ALTER TABLE [dbo].[Items_tb]  WITH CHECK ADD  CONSTRAINT [FK_Items_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Items_tb] CHECK CONSTRAINT [FK_Items_OrderID]
GO
ALTER TABLE [dbo].[OrderChanges_tb]  WITH CHECK ADD  CONSTRAINT [FK_OrderChanges_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[OrderChanges_tb] CHECK CONSTRAINT [FK_OrderChanges_OrderID]
GO
ALTER TABLE [dbo].[OrderDates_tb]  WITH CHECK ADD  CONSTRAINT [FK_OrderDates_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[OrderDates_tb] CHECK CONSTRAINT [FK_OrderDates_OrderID]
GO
ALTER TABLE [dbo].[OrderRefers_tb]  WITH CHECK ADD  CONSTRAINT [FK_OrderRefers_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[OrderRefers_tb] CHECK CONSTRAINT [FK_OrderRefers_OrderID]
GO
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[DIC_Categories_tb] ([TID])
GO
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_CategoryID]
GO
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_ConditionID] FOREIGN KEY([ConditionID])
REFERENCES [dbo].[DIC_Conditions_tb] ([TID])
GO
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_ConditionID]
GO
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_EquipmentID] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[DIC_Equipments_tb] ([TID])
GO
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_EquipmentID]
GO
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_SellerID] FOREIGN KEY([SellerID])
REFERENCES [dbo].[DIC_Sellers_tb] ([TID])
GO
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_SellerID]
GO
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_StockListID] FOREIGN KEY([StockListID])
REFERENCES [dbo].[DIC_StockList_tb] ([TID])
GO
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_StockListID]
GO
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_SubdivisionID] FOREIGN KEY([SubdivisionID])
REFERENCES [dbo].[DIC_Subdivisions_tb] ([TID])
GO
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_SubdivisionID]
GO
ALTER TABLE [dbo].[Params_tb]  WITH CHECK ADD  CONSTRAINT [FK_Params_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Params_tb] CHECK CONSTRAINT [FK_Params_OrderID]
GO
ALTER TABLE [dbo].[Params_tb]  WITH CHECK ADD  CONSTRAINT [FK_Params_ParamID] FOREIGN KEY([ParamID])
REFERENCES [dbo].[DIC_Params_tb] ([TID])
GO
ALTER TABLE [dbo].[Params_tb] CHECK CONSTRAINT [FK_Params_ParamID]
GO
ALTER TABLE [dbo].[PaymentChanges_tb]  WITH CHECK ADD  CONSTRAINT [FK_PaymentChanges_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[PaymentChanges_tb] CHECK CONSTRAINT [FK_PaymentChanges_OrderID]
GO
ALTER TABLE [dbo].[PaymentChanges_tb]  WITH CHECK ADD  CONSTRAINT [FK_PaymentChanges_PaymentID] FOREIGN KEY([PaymentID])
REFERENCES [dbo].[Payments_tb] ([TID])
GO
ALTER TABLE [dbo].[PaymentChanges_tb] CHECK CONSTRAINT [FK_PaymentChanges_PaymentID]
GO
ALTER TABLE [dbo].[Payments_tb]  WITH CHECK ADD  CONSTRAINT [FK_Payments_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Payments_tb] CHECK CONSTRAINT [FK_Payments_OrderID]
GO
ALTER TABLE [dbo].[Payments_tb]  WITH CHECK ADD  CONSTRAINT [FK_Payments_PaymentID] FOREIGN KEY([PaymentID])
REFERENCES [dbo].[DIC_Payments_tb] ([TID])
GO
ALTER TABLE [dbo].[Payments_tb] CHECK CONSTRAINT [FK_Payments_PaymentID]
GO
ALTER TABLE [dbo].[Reviewers_tb]  WITH CHECK ADD  CONSTRAINT [FK_Reviewers_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Reviewers_tb] CHECK CONSTRAINT [FK_Reviewers_OrderID]
GO
ALTER TABLE [dbo].[Reviews_tb]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Reviews_tb] CHECK CONSTRAINT [FK_Reviews_OrderID]
GO
ALTER TABLE [dbo].[Unreads_tb]  WITH CHECK ADD  CONSTRAINT [FK_Unreads_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Unreads_tb] CHECK CONSTRAINT [FK_Unreads_OrderID]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Comment_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- ADD NEW PROVISION COMMENT
-- -------------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[ADD_Comment_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_CommentID        int,
    @p_Login            varchar(50),
    @p_NewComment       varchar(50),
    @p_Note             varchar(1000),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_CommentName      varchar(50),
        @l_CommentID        int = null,
        @l_ID               int = null,
        @l_now              datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        if @p_CommentID is NULL or @p_CommentID = 0 begin
            select @l_CommentID = TID from [dbo].[DIC_Comments_tb] where Name=@p_NewComment
            if @l_CommentID is NULL begin
                insert into [dbo].[DIC_Comments_tb](Name) values(@p_NewComment)
                select @l_CommentID = CAST(scope_identity() AS int)
            end
        end else
            set @l_CommentID = @p_CommentID

        if @p_ID > 0 begin
            UPDATE [dbo].[Comments_tb] SET
                OrderID=@p_OrderID,
                CommentID=@l_CommentID,
                Login=@p_Login,
                Note=@p_Note,
                RD=@l_now
            WHERE TID=@p_ID

            set @l_ID = @p_ID
            set @p_Output = 'Updated'
        end else begin
            INSERT INTO [dbo].[Comments_tb](
                OrderID,
                CommentID,
                Login,
                Note,
                RD
            ) VALUES (
                @p_OrderID,
                @l_CommentID,
                @p_Login,
                @p_Note,
                @l_now
            )

            select @l_ID = CAST(scope_identity() AS int)
            set @p_Output = 'Registered'
        end
        --
        -- Get Comment name and value
        --
        select top 1 @l_CommentName = Name from [dbo].[DIC_Comments_tb] where TID=@l_CommentID
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Комментарий', 
                'Автор: '      + @l_CommentName + '; ' + 
                'Содержание: ' + @p_Note
                )
    end else begin
        set @l_ID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_ID as varchar) + ':' + cast(@l_CommentID as varchar)

    if @p_Mode = 0
        SELECT @l_ID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[ADD_Comment_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END




GO
/****** Object:  StoredProcedure [dbo].[ADD_Document_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- UPLOAD IMAGE BLOB
-- -----------------
--   @p_OrderID      -- Order ID
--   @p_Login        -- login of reviewer
--   @p_Note         -- note of review
--
CREATE PROCEDURE [dbo].[ADD_Document_sp]
    @p_Mode             int,
    @p_UID              varchar(50),
    @p_OrderID          int,
    @p_Login            varchar(50),
    @p_FileName         varchar(255),
    @p_FileSize         int,
    @p_ContentType      varchar(20),
    @p_ForAudit         bit,
    @p_Note             varchar(1000),
    @p_Image            image,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_DocumentID   int,
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        INSERT INTO [dbo].[OrderDocuments_tb](
            UID,
            OrderID,
            Login,
            FileName,
            FileSize,
            ContentType,
            ForAudit,
            Note,
            Image
        ) VALUES (
            @p_UID,
            @p_OrderID,
            @p_Login,
            @p_FileName,
            @p_FileSize,
            @p_ContentType,
            @p_ForAudit,
            @p_Note,
            @p_Image
        )

        select @l_DocumentID = CAST(scope_identity() AS int)
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Документ', [dbo].[Strip_fn](
                'Имя файла: '  + @p_FileName + '; ' + 
                'Содержание: ' + @p_Note + '; ' + 
                'ДБО: ' + cast(@p_ForAudit as varchar)
                ))

        set @p_Output = 'Registered'
    end else begin
        set @l_DocumentID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_DocumentID as varchar)

    if @p_Mode = 0
        SELECT @l_DocumentID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[ADD_Document_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[ADD_Item_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- ADD NEW PROVISION ORDER ITEM
-- ----------------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[ADD_Item_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_VendorID         int,
    @p_Login            varchar(50),
    @p_Name             varchar(250),
    @p_Qty              int,
    @p_Units            varchar(20),
    @p_Total            float,
    @p_Tax              float,
    @p_Currency         varchar(10),
    @p_Account          varchar(100),
    @p_Vendor           varchar(100),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_TID          int = null,
        @l_ItemName     varchar(250),
        @l_Value        varchar(200),
        @l_VendorID     int,
        @l_Vendor       varchar(100),
        @l_now          datetime

    set @l_now = getdate()
    --
    --    Check Vendor exists
    --
    exec dbo.CHECK_Vendor_sp 1, @p_VendorID, @p_Vendor, @l_VendorID output

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        if @p_ID > 0 begin
            declare
                @l_old_VendorID int = null,
                @l_old_exists bit = 0

            select @l_old_VendorID=VendorID FROM [dbo].[Items_tb] WHERE TID=@p_ID

            UPDATE [dbo].[Items_tb] SET
                OrderID=@p_OrderID,
                VendorID=@l_VendorID,
                Login=@p_Login,
                Name=@p_Name,
                Qty=@p_Qty,
                Units=@p_Units,
                Total=cast(@p_Total as money),
                Tax=cast(@p_Tax as money),
                Currency=@p_Currency,
                Account=@p_Account,
                RD=@l_now
            WHERE TID=@p_ID
            --
            -- Check & Remove DIC Vendor item if not exists
            --
            if @l_old_VendorID > 0 and @l_VendorID != @l_old_VendorID begin
                select @l_old_exists=1 from [dbo].[Items_tb] where VendorID=@l_old_VendorID

                if @l_old_exists != 1
                    DELETE FROM [dbo].[DIC_Vendors_tb] WHERE TID=@l_old_VendorID
            end

            set @l_TID = @p_ID
            set @p_Output = 'Updated'
        end else begin
            INSERT INTO [dbo].[Items_tb](
                OrderID,
                VendorID,
                Login,
                Name,
                Qty,
                Units,
                Total,
                Tax,
                Currency,
                Account,
                RD
            ) VALUES (
                @p_OrderID,
                @l_VendorID,
                @p_Login,
                @p_Name,
                @p_Qty,
                @p_Units,
                cast(@p_Total as money),
                cast(@p_Tax as money),
                @p_Currency,
                @p_Account,
                @l_now
            )

            select @l_TID = CAST(scope_identity() AS int)
            set @p_Output = 'Registered'
        end
        --
        -- Get Item name and value
        --
        select top 1 @l_ItemName = Name, @l_Value = 
            cast(Qty as varchar) + ':' + 
            Units + ':' + 
            cast(Total as varchar) + ':' + 
            cast(Tax as varchar) + ':' + 
            cast(Currency as varchar) + ':' + 
            cast(Account as varchar) + ':' + 
            cast(Vendor as varchar)
        from [dbo].[WEB_OrderItems_vw] where TID=@l_TID
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Счет:' + @l_ItemName, @l_Value)
    end else begin
        set @l_TID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_TID as varchar) + ':' + cast(@l_VendorID as varchar)

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[ADD_Item_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[ADD_Param_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- ADD NEW PROVISION PARAM
-- -----------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[ADD_Param_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_ParamID          int,
    @p_Login            varchar(50),
    @p_NewParam         varchar(50),
    @p_Value            varchar(500),
    @p_MD               int,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_ParamID      int = null,
        @l_TID          int = null,
        @l_ParamName    varchar(50),
        @l_ParamCode    varchar(10),
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        --
        -- Check Params Reference
        --
        if @p_ParamID is null or @p_ParamID = 0 begin
            select @l_ParamID=TID from [dbo].[DIC_Params_tb] where Name=@p_NewParam and (MD=@p_MD or MD is null)
            if @l_ParamID is null begin
                INSERT INTO [dbo].[DIC_Params_tb](Name, MD) VALUES(@p_NewParam, @p_MD)
                select @l_ParamID = CAST(scope_identity() AS int)
            end
        end else
            set @l_ParamID = @p_ParamID
        --
        -- Get Param name and value
        --
        select top 1 @l_ParamName=Name, @l_ParamCode=Code from [dbo].[DIC_Params_tb] where TID=@l_ParamID
        set @p_Value = [dbo].[Strip_fn](@p_Value)
        --
        -- Check if this is Reviewer line
        --
        set @exists = 0

        if @l_ParamCode = 'RW' and [dbo].[CHECK_IsEmpty_fn](@p_Value) = 0 begin
            select @exists=1 from [dbo].[Reviewers_tb] where OrderID=@p_OrderID and Login=@p_Value

            if @exists = 0
                INSERT INTO [dbo].[Reviewers_tb] VALUES (
                    @p_OrderID,
                    @p_Value
                )

            set @l_TID = null
            set @exists = 1
        end

        else if @l_ParamCode = 'AC' and [dbo].[CHECK_IsEmpty_fn](@p_Value) = 0
            UPDATE [dbo].[Orders_tb] SET Account=@p_Value where TID=@p_OrderID

        else if @l_ParamCode = 'DE' and [dbo].[CHECK_IsEmpty_fn](@p_Value) = 0
            UPDATE [dbo].[OrderDates_tb] SET FinishDueDate=@p_Value where OrderID=@p_OrderID

        if @exists = 0 begin
            if @p_ID = 0 and @p_MD < 10
                select top 1 @l_TID=TID from [dbo].[Params_tb] where OrderID=@p_OrderID and ParamID=@l_ParamID
            else
                set @l_TID = @p_ID
        end

        if @l_TID > 0 begin
            UPDATE [dbo].[Params_tb] SET
                OrderID=@p_OrderID,
                ParamID=@l_ParamID,
                Login=@p_Login,
                Value=@p_Value,
                RD=@l_now
            WHERE TID=@l_TID

            set @p_Output = 'Updated'
        end else begin
            INSERT INTO [dbo].[Params_tb](
                OrderID,
                ParamID,
                Login,
                Value,
                RD
            ) VALUES (
                @p_OrderID,
                @l_ParamID,
                @p_Login,
                @p_Value,
                @l_now
            )

            select @l_TID = CAST(scope_identity() AS int)
            set @p_Output = 'Registered'
        end
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Параметры:' + @l_ParamName, @p_Value)

        if @@error != 0
            raiserror('ошибка обработки',16,1)
    end else begin
        set @l_TID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_TID as varchar) + ':' + cast(@l_ParamID as varchar)

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[ADD_Param_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[ADD_Payment_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- ADD NEW PROVISION PAYMENT
-- -------------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[ADD_Payment_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_PaymentID        int,
    @p_Login            varchar(50),
    @p_NewPayment       varchar(50),
    @p_PaymentDate      datetime,
    @p_Total            float,
    @p_Tax              float,
    @p_Currency         varchar(10),
    @p_Rate             float,
    @p_Status           int,
    @p_Comment          varchar(1000),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_TID          int = null,
        @l_PaymentID    int = null,
        @l_PaymentName  varchar(50),
        @l_Value        varchar(100),
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        if @p_PaymentID is NULL or @p_PaymentID = 0 begin
            select @l_PaymentID = TID from [dbo].[DIC_Payments_tb] where Name=@p_NewPayment
            if @l_PaymentID is NULL begin
                insert into [dbo].[DIC_Payments_tb](Name) values(@p_NewPayment)
                select @l_PaymentID = CAST(scope_identity() AS int)
            end
        end else
            set @l_PaymentID = @p_PaymentID

        if @p_ID > 0 begin
            UPDATE [dbo].[Payments_tb] SET
                OrderID=@p_OrderID,
                PaymentID=@l_PaymentID,
                Login=@p_Login,
                PaymentDate=@p_PaymentDate,
                Total=@p_Total,
                Tax=@p_Tax,
                Currency=@p_Currency,
                Rate=@p_Rate,
                Status=@p_Status,
                Comment=@p_Comment,
                RD=@l_now
            WHERE TID=@p_ID

            set @l_TID = @p_ID
            set @p_Output = 'Updated'
        end else begin
            INSERT INTO [dbo].[Payments_tb](
                OrderID,
                PaymentID,
                Login,
                PaymentDate,
                Total,
                Tax,
                Currency,
                Rate,
                Status,
                Comment,
                RD
            ) VALUES (
                @p_OrderID,
                @l_PaymentID,
                @p_Login,
                case when [dbo].[CHECK_IsEmpty_fn](@p_PaymentDate) = 0 then @p_PaymentDate else @l_now end,
                @p_Total,
                @p_Tax,
                @p_Currency,
                @p_Rate,
                @p_Status,
                @p_Comment,
                @l_now
            )
    
            select @l_TID = CAST(scope_identity() AS int)
            set @p_Output = 'Registered'
        end
        --
        -- Get Payment name and value
        --
        select top 1 @l_PaymentName = Purpose, @l_Value = 
            'Дата: '   + cast(PaymentDate as varchar) + '; ' + 
            'Сумма: '  + cast(Total as varchar) + '; ' + 
            'НДС: '    + cast(Tax as varchar) + '; ' + 
            'Валюта: ' + Currency + '; ' + 
            'Курс: '   + cast(Rate as varchar) + '; ' + 
            'Статус:'  + cast(Status as varchar)
        from [dbo].[WEB_OrderPayments_vw] where TID=@l_TID
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Платежи:' + @l_PaymentName, @l_Value + case when @p_Comment > '' then ' [' + @p_Comment + ']' else '' end)
        --
        -- Add to Payment Changes log
        --
        INSERT INTO [dbo].[PaymentChanges_tb](
            PaymentID, 
            OrderID, 
            Login, 
            Status, 
            RD
        ) VALUES (
            @l_TID,
            @p_OrderID,
            @p_Login,
            @p_Status,
            @l_now
        )

    end else begin
        set @l_TID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_TID as varchar) + ':' + cast(@l_PaymentID as varchar)

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[ADD_Payment_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[ADD_Refer_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- ADD NEW PROVISION REFER
-- -----------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[ADD_Refer_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_ReferID          int,
    @p_Login            varchar(50),
    @p_NewRefer         varchar(50),
    @p_Value            int,
    @p_Note             varchar(1000),
    @p_MD               int,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_ReferID      int = null,
        @l_TID          int = null,
        @l_ReferName    varchar(50),
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_Value

    if @exists = 1
    begin
        --
        -- Check Refers Reference
        --
        if @p_ReferID is null or @p_ReferID = 0 begin
            select @l_ReferID=TID from [dbo].[DIC_Refers_tb] where Name=@p_NewRefer and (MD=@p_MD or MD is null)
            if @l_ReferID is null begin
                INSERT INTO [dbo].[DIC_Refers_tb](Name, MD) VALUES(@p_NewRefer, @p_MD)
                select @l_ReferID = CAST(scope_identity() AS int)
            end
        end else
            set @l_ReferID = @p_ReferID
        --
        -- Get Refer name and value
        --
        select top 1 @l_ReferName=Name from [dbo].[DIC_Refers_tb] where TID=@l_ReferID
        --
        -- Check if this is OrderRefer line (like as Params extentions)
        --
        set @exists = 0

        if @exists = 0 begin
            if @p_ID = 0
                set @l_TID = 0
            else
                set @l_TID = @p_ID
        end

        if @l_TID > 0 begin
            UPDATE [dbo].[OrderRefers_tb] SET
                OrderID=@p_OrderID,
                ReferID=@l_ReferID,
                OrderReferID=@p_Value,
                Login=@p_Login,
                Note=@p_Note,
                RD=@l_now
            WHERE TID=@l_TID

            set @p_Output = 'Updated'
        end else begin
            INSERT INTO [dbo].[OrderRefers_tb](
                OrderID,
                ReferID,
                OrderReferID,
                Login,
                Note,
                RD
            ) VALUES (
                @p_OrderID,
                @l_ReferID,
                @p_Value,
                @p_Login,
                @p_Note,
                @l_now
            )

            select @l_TID = CAST(scope_identity() AS int)
            set @p_Output = 'Registered'
        end
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Ссылки:' + @l_ReferName, @p_Value)

        if @@error != 0
            raiserror('ошибка обработки',16,1)
    end else begin
        set @l_TID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_TID as varchar) + ':' + cast(@l_ReferID as varchar)

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[ADD_Refer_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[BATCH_ChangeSubdivision_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BATCH_ChangeSubdivision_sp] 
    @p_CheckOnly     bit,
    @p_FromID        int,
    @p_ToID          int,
    @p_NewName       varchar(50)
AS
BEGIN
    if @p_CheckOnly = 1 begin
        select * from [dbo].[Orders_tb] where SubdivisionID=@p_FromID order by TID desc
        select * from [dbo].[DIC_Equipments_tb] where SubdivisionID=@p_FromID order by TID desc
    end else begin
        update [dbo].[Orders_tb] set SubdivisionID=@p_ToID where SubdivisionID=@p_FromID
        update [dbo].[DIC_Equipments_tb] set SubdivisionID=@p_ToID where SubdivisionID=@p_FromID
        update [dbo].[DIC_Subdivisions_tb] set Name='...' where TID=@p_FromID
        update [dbo].[DIC_Subdivisions_tb] set Name=@p_NewName where TID=@p_ToID
        
        SELECT * FROM [dbo].[WEB_Orders_vw] where SubdivisionID=@p_ToID order by TID desc
    end
    return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[BATCH_SetAutoclosed_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BATCH_SetAutoclosed_sp] 
    @p_CheckOnly     bit,
    @p_Author        varchar(50)
AS
BEGIN
    DECLARE 
        @OrderID     int, 
        @StockListID int,
		@Params      varchar(200),
        @total       int

	create table #tmp(OrderID int, StockListID int, Params varchar(200))

    DECLARE x CURSOR READ_ONLY FOR SELECT TID, StockListID FROM [dbo].[WEB_Orders_vw] WHERE
		[dbo].[CHECK_IsInReviews_fn](ReviewStatuses, '7,8')=0 and 
		[dbo].[CHECK_IsInReviews_fn](ReviewStatuses, '6')=1 and 
		Status in (6,7) and 
        (@p_Author is NULL or Author=@p_Author) and 
        MD=0
    OPEN x
    while (1=1) begin
        FETCH NEXT FROM x INTO @OrderID, @StockListID
        if @@fetch_status = -1
            break
        if @StockListID > 0 begin
            select @Params=Params from [dbo].[WEB_Stocks_vw] where TID=@StockListID
            insert into #tmp values(@OrderID, @StockListID, @Params)
        
            if @p_CheckOnly = 0
                EXEC [dbo].[REGISTER_Review_sp] 1,@OrderID,'stock','Администрация (менеджер)',8,'',NULL,0,NULL
        end
    end
    CLOSE x
    DEALLOCATE x

    if @p_CheckOnly = 1
        select * from [dbo].[WEB_Orders_vw], #tmp where TID=#tmp.OrderID order by TID desc
    else begin
        select @total=count(*) from #tmp
        --print('Applied for ' + cast(@total as varchar) + ' records.')
        SELECT 'Applied for ' + cast(@total as varchar) + ' records.' FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[BATCH_SetAutoclosed_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    end
	
    drop table #tmp

    return(0)
END




GO
/****** Object:  StoredProcedure [dbo].[BATCH_SetCompany_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- SET COMPANY VALUE INSIDE ORDERS TABLE PARAMS
-- --------------------------------------------
-- EXEC [WorkflowDB].[dbo].[BATCH_SetCompany_sp] 1,42,NULL,'Розан Файнэнс, АО','2021-01-01',0,'admin'
-- EXEC [WorkflowDB].[dbo].[BATCH_SetCompany_sp] 1,42,'8,19,30','Розан Даймонд, ООО','2021-01-01',0,'admin'
-- EXEC [WorkflowDB].[dbo].[BATCH_SetCompany_sp] 1,42,'37','ЭкспрессКард, АО','2021-01-01',0,'admin'
-- EXEC [WorkflowDB].[dbo].[BATCH_SetCompany_sp] 1,42,'10,32','Розан Логистик, ООО','2021-01-01',0,'admin'
-- EXEC [WorkflowDB].[dbo].[BATCH_SetCompany_sp] 1,42,'11','Розан СПБ','2021-01-01',0,'admin'
-- EXEC [WorkflowDB].[dbo].[BATCH_SetCompany_sp] 1,42,'39','3Д ПЭЙ, ООО','2021-01-01',0,'admin'
--
CREATE PROCEDURE [dbo].[BATCH_SetCompany_sp] 
    @p_CheckOnly     bit,
    @p_ParamID       int, -- 45
    @p_Subdivisions  varchar(50),
    @p_Company       varchar(50),
    @p_RD            date,
    @p_MD            int,
    @p_Author        varchar(50)
AS
BEGIN
    DECLARE 
        @OrderID     int, 
        @l_RD        date,
        @l_MD        int,
        @l_Author    varchar(50),
        @exists      bit

    set @l_RD = case @p_RD when '' then '2021-01-01' else @p_RD end
    set @l_MD = case when @p_MD IS NULL then 0 else @p_MD end
    set @l_Author = case @p_Author when '' then 'admin' else @p_Author end

    select * into #tmp from [dbo].[GET_SplittedIDs_fn](@p_Subdivisions, ',')

    DECLARE x CURSOR READ_ONLY FOR SELECT TID FROM [dbo].[WEB_Orders_vw] WHERE
        (@p_Subdivisions IS NULL or SubdivisionID in (select item from #tmp)) and 
            RD > @l_RD and 
            MD=@l_MD
    OPEN x
    while (1=1) begin
        set @exists = null
        FETCH NEXT FROM x INTO @OrderID
        if @@fetch_status = -1
            break
        select @exists=1 from [dbo].[Params_tb] where OrderID=@OrderID and ParamID=@p_ParamID
        if @exists is null begin
            if @p_CheckOnly = 0
                insert into [dbo].[Params_tb](OrderID, ParamID, Login, Value) values(@OrderID, @p_ParamID, @l_Author, @p_Company)
            print(@OrderID)
        end
    end
    CLOSE x
    DEALLOCATE x

    drop table #tmp

    return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[BATCH_SetSubdivisionByAuthor_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BATCH_SetSubdivisionByAuthor_sp] 
    @p_CheckOnly     bit,
    @p_FromID        int,
    @p_ToID          int,
    @p_Author        varchar(50)
AS
BEGIN
    DECLARE 
        @OrderID     int, 
        @SubdivisionID int,
        @total       int

    create table #tmp(OrderID int, SubdivisionID int)

    DECLARE x CURSOR READ_ONLY FOR SELECT TID, SubdivisionID FROM [dbo].[WEB_Orders_vw] WHERE
        SubdivisionID=@p_FromID and 
        (@p_Author is NULL or Author=@p_Author) and 
        MD=0
    OPEN x
    while (1=1) begin
        FETCH NEXT FROM x INTO @OrderID, @SubdivisionID
        if @@fetch_status = -1
            break
        if @SubdivisionID > 0 begin
            insert into #tmp values(@OrderID, @SubdivisionID)
            if @p_CheckOnly != 1
                update [dbo].[Orders_tb] set SubdivisionID=@p_ToID where TID=@OrderID
        end
    end
    CLOSE x
    DEALLOCATE x

    if @p_CheckOnly = 1
        select * from [dbo].[WEB_Orders_vw], #tmp where TID=#tmp.OrderID order by TID desc
    else begin
        select @total=count(*) from #tmp
        SELECT 'Applied for ' + cast(@total as varchar) + ' records.' FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[BATCH_SetSubdivisionByAuthor_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    end

    drop table #tmp

    return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[BATCH_UndoAutoclosed_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BATCH_UndoAutoclosed_sp] 
    @p_CheckOnly     bit,
    @p_OrderID       int
AS
BEGIN
    declare 
        @exists bit = null

    select @exists=1 from [dbo].[WEB_Reviews_vw] where OrderID=@p_OrderID and Status=8

    if @p_CheckOnly = 1 begin
        select * from [dbo].[WEB_Reviews_vw] where OrderID=@p_OrderID order by TID desc
        select * from [dbo].[OrderDates_tb] where OrderID=@p_OrderID order by TID desc
    end else if @exists = 1 begin
        update [dbo].[Orders_tb] set Status=5 where TID=@p_OrderID
        update [dbo].[OrderDates_tb] set Delivered=NULL where OrderID=@p_OrderID
        delete from [dbo].[Reviews_tb] where OrderID=@p_OrderID and Status=8
    end
    return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[CHECK_Activity_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CHECK & REGISTER GIVEN SELLER IF NOT EXISTS
--   @p_Name        -- given activity name
--   @p_ID          -- activity id (output)
--
-- 20211016: creating
--
CREATE PROCEDURE [dbo].[CHECK_Activity_sp]
    @p_Mode             int,
    @p_Name             varchar(50),
    @p_ID               int output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_ActivityID  int,
        @l_Name         varchar(50)

    if dbo.CHECK_IsEmpty_fn(@p_Name) = 1
    begin
        set @p_ID = null
        return(-1)
    end

    set @l_Name = @p_Name

    SELECT TOP 1 @l_ActivityID=TID FROM [dbo].[DIC_Activities_tb] WHERE
        Name=@l_Name

    if @l_ActivityID is null
    begin
        INSERT INTO [dbo].[DIC_Activities_tb](Name) VALUES (@l_Name)
        select top 1 @l_ActivityID=TID from [dbo].[DIC_Activities_tb] where Name=@l_Name
        
        --select @l_ActivityID = CAST(scope_identity() AS int)
    end

    set @p_ID = @l_ActivityID

    if @p_Mode = 0
        SELECT @l_ActivityID FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[CHECK_Activity_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[CHECK_Category_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CHECK & REGISTER GIVEN CATEGORY IF NOT EXISTS
--   @p_Name        -- given category name: Name[|]
--   @p_ID          -- category id (output)
--
-- 20191026: creating
--
CREATE PROCEDURE [dbo].[CHECK_Category_sp]
    @p_Mode             int,
    @p_Name             varchar(150),
    @p_MD               int,
    @p_ID               int output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_CategoryID       int,
        @l_Name             varchar(50)

    if dbo.CHECK_IsEmpty_fn(@p_Name) = 1
    begin
        set @p_ID = null
        return(-1)
    end

    select * into #tmp from [dbo].[GET_SplittedStrings_fn](@p_Name, '|')
    
    select @l_Name=item from #tmp where n=0

    drop table #tmp

    SELECT TOP 1 @l_CategoryID=TID FROM [dbo].[DIC_Categories_tb] WHERE
        Name=@l_Name and (MD=@p_MD or MD is null)

    if @l_CategoryID is null
    begin
        INSERT INTO [dbo].[DIC_Categories_tb](Name, MD) VALUES (@l_Name, @p_MD)
        select top 1 @l_CategoryID=TID from [dbo].[DIC_Categories_tb] where Name=@l_Name
    end

    set @p_ID = @l_CategoryID

    if @p_Mode = 0
        SELECT @l_CategoryID FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[CHECK_Category_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[CHECK_Condition_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CHECK & REGISTER GIVEN SELLER IF NOT EXISTS
--   @p_Name        -- given condition name
--   @p_ID          -- condition id (output)
--
-- 20190620: creating
--
CREATE PROCEDURE [dbo].[CHECK_Condition_sp]
    @p_Mode             int,
    @p_Name             varchar(50),
    @p_ID               int output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_ConditionID  int,
        @l_Name         varchar(50)

    if dbo.CHECK_IsEmpty_fn(@p_Name) = 1
    begin
        set @p_ID = null
        return(-1)
    end

    set @l_Name = @p_Name

    SELECT TOP 1 @l_ConditionID=TID FROM [dbo].[DIC_Conditions_tb] WHERE
        Name=@l_Name

    if @l_ConditionID is null
    begin
        INSERT INTO [dbo].[DIC_Conditions_tb](Name) VALUES (@l_Name)
        select top 1 @l_ConditionID=TID from [dbo].[DIC_Conditions_tb] where Name=@l_Name
        
        --select @l_ConditionID = CAST(scope_identity() AS int)
    end

    set @p_ID = @l_ConditionID

    if @p_Mode = 0
        SELECT @l_ConditionID FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[CHECK_Condition_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[CHECK_Equipment_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CHECK & REGISTER GIVEN EQUIPMENT IF NOT EXISTS
--   @p_Name        -- given equipment name
--   @p_ID          -- equipment id (output)
--
-- 20190620: creating
--
CREATE PROCEDURE [dbo].[CHECK_Equipment_sp]
    @p_Mode             int,
    @p_SubdivisionID    int,
    @p_Name             varchar(2000),
    @p_ID               int output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_EquipmentID  int,
        @l_Title        varchar(1000),
        @l_Name         varchar(1000)

    if dbo.CHECK_IsEmpty_fn(@p_SubdivisionID) = 1 or dbo.CHECK_IsEmpty_fn(@p_Name) = 1
    begin
        set @p_ID = null
        return(-1)
    end

    set @l_Name = ''

    select * into #tmp from [dbo].[GET_SplittedStrings_fn](@p_Name, '|')
    
    select @l_Title=item from #tmp where n=0
    select @l_Name=item from #tmp where n=1

    drop table #tmp

    SELECT TOP 1 @l_EquipmentID=TID FROM [dbo].[DIC_Equipments_tb] WHERE
        SubdivisionID=@p_SubdivisionID AND 
        Title=@l_Title AND 
        Name=@l_Name

    if @l_EquipmentID is null
    begin
        INSERT INTO [dbo].[DIC_Equipments_tb](SubdivisionID, Title, Name) VALUES (@p_SubdivisionID, @l_Title, @l_Name)
        select @l_EquipmentID = CAST(scope_identity() AS int)
    end else
        UPDATE [dbo].[DIC_Equipments_tb] set 
            Title=@l_Title, 
            Name=@l_Name 
        WHERE TID=@l_EquipmentID

    set @p_ID = @l_EquipmentID

    if @p_Mode = 0
        SELECT @l_EquipmentID FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[CHECK_Equipment_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[CHECK_Sector_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CHECK & REGISTER GIVEN SECTOR IF NOT EXISTS
--   @p_Name        -- given sector name: Name[|Manager]
--   @p_ID          -- subdivision id (output)
--
-- 20190620: creating
--
CREATE PROCEDURE [dbo].[CHECK_Sector_sp]
    @p_Mode             int,
    @p_Name             varchar(150),
    @p_ID               int output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_SectorID     int,
        @l_Name         varchar(50),
        @l_Manager      varchar(100)

    if dbo.CHECK_IsEmpty_fn(@p_Name) = 1
    begin
        set @p_ID = null
        return(-1)
    end

    select * into #tmp from [dbo].[GET_SplittedStrings_fn](@p_Name, '|')
    
    select @l_Name=item from #tmp where n=0
    select @l_Manager=item from #tmp where n=1

    drop table #tmp

    SELECT TOP 1 @l_SectorID=TID FROM [dbo].[DIC_Sectors_tb] WHERE
        Name=@l_Name

    if @l_SectorID is null
    begin
        INSERT INTO [dbo].[DIC_Sectors_tb](Name, Manager) VALUES (@l_Name, @l_Manager)
        select top 1 @l_SectorID=TID from [dbo].[DIC_Sectors_tb] where Name=@l_Name
        
        --select @l_SectorID = CAST(scope_identity() AS int)
    end

    set @p_ID = @l_SectorID

    if @p_Mode = 0
        SELECT @l_SectorID FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[CHECK_Sector_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[CHECK_Seller_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CHECK & REGISTER GIVEN SELLER IF NOT EXISTS
--   @p_Name        -- given seller name: Name[|Title][|Address]
--   @p_ID          -- seller id (output)
--
-- 20190620: creating
--
CREATE PROCEDURE [dbo].[CHECK_Seller_sp]
    @p_Mode             int,
    @p_Name             varchar(2000),
    @p_MD               int,
    @p_ID               int output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_SellerID     int,
        @l_Name         varchar(100),
        @l_Title        varchar(250),
        @l_Address      varchar(1000),
        @l_Code         varchar(20),
        @l_Contact      varchar(200)

    if dbo.CHECK_IsEmpty_fn(@p_Name) = 1
    begin
        set @p_ID = null
        return(-1)
    end

    select * into #tmp from [dbo].[GET_SplittedStrings_fn](@p_Name, '||')
    
    select @l_Name=item from #tmp where n=0
    select @l_Title=item from #tmp where n=1
    select @l_Address=item from #tmp where n=2
    select @l_Code=item from #tmp where n=3
    select @l_Contact=item from #tmp where n=4

    drop table #tmp

    SELECT TOP 1 @l_SellerID=TID FROM [dbo].[DIC_Sellers_tb] WHERE
        Name=@l_Name and (MD=@p_MD or MD is null)

    if @l_SellerID is null and ([dbo].[CHECK_IsEmpty_fn](@l_Name)=1 or charindex('задано', @l_Name) > 0) begin
        select top 1 @l_SellerID=TID from [dbo].[DIC_Sellers_tb] where Name='---' or Name like '%- не задано -%' or [dbo].[CHECK_IsEmpty_fn](Name)=1

    end else if @l_SellerID is null
    begin
        INSERT INTO [dbo].[DIC_Sellers_tb](Name, Title, Address, Code, Contact, MD) VALUES (@l_Name, @l_Title, @l_Address, @l_Code, @l_Contact, @p_MD)
        select top 1 @l_SellerID=TID from [dbo].[DIC_Sellers_tb] where Name=@l_Name
        
        --select @l_SellerID = CAST(scope_identity() AS int)
    end else begin
        UPDATE [dbo].[DIC_Sellers_tb] SET 
            Title=@l_Title, 
            Address=@l_Address,
            Code=@l_Code,
            Contact=@l_Contact
        WHERE TID=@l_SellerID
    end

    set @p_ID = @l_SellerID

    if @p_Mode = 0
        SELECT @l_SellerID FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[CHECK_Seller_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[CHECK_Subdivision_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CHECK & REGISTER GIVEN SUBDIVISION IF NOT EXISTS
--   @p_Name        -- given subdivision name: Name[|Manager]
--   @p_ID          -- subdivision id (output)
--
-- 20190620: creating
--
CREATE PROCEDURE [dbo].[CHECK_Subdivision_sp]
    @p_Mode             int,
    @p_Name             varchar(150),
    @p_ID               int output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_SubdivisionID    int,
        @l_Name             varchar(50),
        @l_Manager          varchar(100)

    if dbo.CHECK_IsEmpty_fn(@p_Name) = 1
    begin
        set @p_ID = null
        return(-1)
    end

    select * into #tmp from [dbo].[GET_SplittedStrings_fn](@p_Name, '|')
    
    select @l_Name=item from #tmp where n=0
    select @l_Manager=item from #tmp where n=1

    drop table #tmp

    SELECT TOP 1 @l_SubdivisionID=TID FROM [dbo].[DIC_Subdivisions_tb] WHERE
        Name=@l_Name

    if @l_SubdivisionID is null
    begin
        INSERT INTO [dbo].[DIC_Subdivisions_tb](Name, Manager) VALUES (@l_Name, @l_Manager)
        select top 1 @l_SubdivisionID=TID from [dbo].[DIC_Subdivisions_tb] where Name=@l_Name
        
        --select @l_SubdivisionID = CAST(scope_identity() AS int)
    end

    set @p_ID = @l_SubdivisionID

    if @p_Mode = 0
        SELECT @l_SubdivisionID FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[CHECK_Subdivision_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END
/****** Object:  StoredProcedure [dbo].[CHECK_Vendor_sp]    Script Date: 25.09.2021 7:21:59 ******/
SET ANSI_NULLS ON


GO
/****** Object:  StoredProcedure [dbo].[CHECK_Vendor_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CHECK & REGISTER GIVEN VENDOR IF NOT EXISTS
--   @p_Name        -- given vendor name
--   @p_ID          -- vendor id (output)
--
-- 20201114: creating
--
CREATE PROCEDURE [dbo].[CHECK_Vendor_sp]
    @p_Mode             int,
    @p_VendorID         int,
    @p_Name             varchar(100),
    @p_ID               int output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_VendorID     int,
        @l_Name         varchar(100)

    if dbo.CHECK_IsEmpty_fn(@p_Name) = 1
    begin
        set @p_ID = @p_VendorID
        return(-1)
    end

    set @l_Name = @p_Name

    SELECT TOP 1 @l_VendorID=TID FROM [dbo].[DIC_Vendors_tb] WHERE
        Name=@l_Name

    if @l_VendorID is null
    begin
        INSERT INTO [dbo].[DIC_Vendors_tb](Name) VALUES (@l_Name)
        select top 1 @l_VendorID=TID from [dbo].[DIC_Vendors_tb] where Name=@l_Name
        
        --select @l_VendorID = CAST(scope_identity() AS int)
    end

    set @p_ID = @l_VendorID

    if @p_Mode = 0
        SELECT @l_VendorID FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[CHECK_Vendor_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[DEL_Comment_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- DEL NEW PROVISION PAYMENT
-- -------------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[DEL_Comment_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_CommentID          int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_TID          int = null,
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1 and @p_ID > 0
        select @l_TID=TID from [dbo].[Comments_tb] where TID=@p_ID

    if @l_TID > 0
    begin
        DELETE FROM [dbo].[Comments_tb] WHERE TID=@l_TID
        
        set @p_Output = 'Removed'
    end else begin
        set @p_Output = 'Invalid'
    end

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[DEL_Comment_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[DEL_Document_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- DEL NEW PROVISION PAYMENT
-- -------------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[DEL_Document_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_TID          int = null,
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1 and @p_ID > 0
        select top 1 @l_TID = TID from [dbo].[OrderDocuments_tb] where OrderID=@p_OrderID and TID=@p_ID

    if @l_TID > 0
    begin
        DELETE FROM [dbo].[OrderDocuments_tb] WHERE TID=@l_TID

        set @p_Output = 'Removed'
    end else begin
        set @p_Output = 'Invalid'
    end

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[DEL_Document_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[DEL_Item_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- DEL NEW PROVISION ORDER ITEM
-- ----------------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[DEL_Item_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_TID          int = null,
        @l_ItemName     varchar(250),
        @l_Value        varchar(200),
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1 and @p_ID > 0
        select @l_TID=TID from [dbo].[Items_tb] where TID=@p_ID

    if @l_TID > 0
    begin
        --
        -- Get Item name and value
        --
        select top 1 @l_ItemName = Name, @l_Value = 
            cast(Qty as varchar) + ':' + 
            Units + ':' + 
            cast(Total as varchar) + ':' + 
            cast(Tax as varchar) + ':' + 
            cast(Currency as varchar) + ':' + 
            cast(Account as varchar) 
        from [dbo].[WEB_OrderItems_vw] where TID=@l_TID

        DELETE FROM [dbo].[Items_tb] WHERE TID=@l_TID
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Удалено:[' + @l_ItemName + ']', @l_Value)
        
        set @p_Output = 'Removed'
    end else begin
        set @p_Output = 'Invalid'
    end

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[DEL_Item_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[DEL_Param_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- DEL NEW PROVISION PAYMENT
-- -------------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[DEL_Param_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_ParamID          int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_TID          int = null,
        @l_ParamName    varchar(50),
        @l_Value        varchar(500),
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1 and @p_ID > 0
        select top 1 @l_TID=TID from [dbo].[Params_tb] where OrderID=@p_OrderID and TID=@p_ID

    if @l_TID > 0
    begin
        select top 1 @l_ParamName=Name, @l_Value=[Value] from [dbo].[WEB_OrderParams_vw] where TID=@l_TID
        set @l_Value = [dbo].[Strip_fn](@l_Value)

        if @l_ParamName = 'Роль: рецензент' and @l_Value > ''
            DELETE FROM [dbo].[Reviewers_tb] WHERE OrderID=@p_OrderID and Login=@l_Value

        DELETE FROM [dbo].[Params_tb] WHERE TID=@l_TID
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Удалено:[' + @l_ParamName + ']', @l_Value)

        set @p_Output = 'Removed'
    end else begin
        set @p_Output = 'Invalid'
    end

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[DEL_Param_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[DEL_Payment_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- DEL NEW PROVISION PAYMENT
-- -------------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[DEL_Payment_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_PaymentID        int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_TID          int = null,
        @l_PaymentName  varchar(50),
        @l_Value        varchar(100),
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1 and @p_ID > 0
        select @l_TID=TID from [dbo].[Payments_tb] where TID=@p_ID

    if @l_TID > 0
    begin
        --
        -- Get Payment name and value
        --
        select top 1 @l_PaymentName = Purpose, @l_Value = 
            'Дата: '  + cast(PaymentDate as varchar) + '; ' + 
            'Сумма: ' + cast(Total as varchar) + '; ' + 
            'НДС: '   + cast(Tax as varchar) + '; ' + 
            'Статус:' + cast(Status as varchar)
        from [dbo].[WEB_OrderPayments_vw] where TID=@l_TID

        DELETE FROM [dbo].[PaymentChanges_tb] WHERE PaymentID=@l_TID
        DELETE FROM [dbo].[Payments_tb] WHERE TID=@l_TID
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Удалено:[' + @l_PaymentName + ']', @l_Value)
        
        set @p_Output = 'Removed'
    end else begin
        set @p_Output = 'Invalid'
    end

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[DEL_Payment_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[DEL_Refer_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- DEL NEW PROVISION REFER
-- ----------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[DEL_Refer_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_ReferID          int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_ReferID      int = null,
        @l_TID          int = null,
        @l_ReferName    varchar(50),
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1 and @p_ID > 0
        select top 1 @l_TID=TID from [dbo].[OrderRefers_tb] where OrderID=@p_OrderID and TID=@p_ID

    if @l_TID > 0
    begin
        set @l_ReferID = @p_ReferID
        --
        -- Get Refer name and value
        --
        select top 1 @l_ReferName=Name from [dbo].[DIC_Refers_tb] where TID=@l_ReferID

        DELETE FROM [dbo].[OrderRefers_tb] WHERE TID=@l_TID
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Удалено:[' + @l_ReferName + ']', @p_ID)

        set @p_Output = 'Removed'
    end else begin
        set @p_Output = 'Invalid'
    end

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[DEL_Refer_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[DEL_Seller_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- DEL PROVISION SELLER
-- --------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[DEL_Seller_sp]
    @p_Mode             int,
    @p_SellerID         int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_TID          int = null,
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where SellerID=@p_SellerID

    if @exists = 1 begin
        set @l_TID = @p_SellerID
        set @p_Output = 'Exists'
    end else if @p_SellerID > 0 begin
        set @l_TID = @p_SellerID

        DELETE FROM [dbo].[DIC_Sellers_tb] WHERE TID=@l_TID

        set @p_Output = 'Removed'
    end else begin
        set @p_Output = 'Invalid'
    end

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[DEL_Seller_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[DELETE_Order_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DELETE_Order_sp] 
    @p_Mode             int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_OrderID          int,
        @l_Status           int,
        @l_Name             varchar(50),
        @l_now              datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1, @l_Status=Status from [dbo].[Orders_tb] where TID=@p_ID

    set @p_Output = ''

    if @exists = 1
    begin
        if @l_Status = 9 begin
            DELETE FROM [storage].[dbo].[OrderDocuments_tb] WHERE OrderID=@p_ID

            DELETE FROM [dbo].[Decrees_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Params_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Items_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[PaymentChanges_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Payments_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Comments_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Reviewers_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Reviews_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[OrderDates_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[OrderChanges_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Unreads_tb] WHERE OrderID=@p_ID

            DELETE FROM [dbo].[Orders_tb] WHERE TID=@p_ID
        end else begin
            UPDATE [dbo].[Decrees_tb] SET Status=3 WHERE OrderID=@p_ID
            UPDATE [dbo].[Orders_tb] SET Status=9 WHERE TID=@p_ID

            set @l_Name = 'Корзина'
            --
            -- Add to Order Changes log
            --
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@p_ID, @p_Login, @l_Name, '')
        end

        select @l_OrderID = @p_ID
        set @p_Output = 'Removed'
    end else begin
        set @l_OrderID = 0
        set @p_Output = 'Invalid' 
            + ':' + cast(@exists as varchar)
    end

    set @p_Output = @p_Output + ':' + cast(@l_OrderID as varchar)

    if @p_Mode = 0
        SELECT @l_OrderID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[DELETE_Order_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[FINISH_Decree_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FINISH_Decree_sp] 
    @p_Mode             int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_DecreeID         int,
        @l_OrderID          int,
        @l_ReviewID         int,
        @l_ReportID         int,
        @l_now              datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1, @l_ReviewID=ReviewID, @l_ReportID=ReportID from [dbo].[Decrees_tb] where TID=@p_ID

    set @p_Output = ''

    if @exists = 1
    begin
        select @l_OrderID=OrderID from [dbo].[Reviews_tb] WHERE TID=@l_ReviewID

        UPDATE [dbo].[Decrees_tb] SET Status=1 WHERE TID=@p_ID

        if @@error != 0
            raiserror('ошибка обновления поручения',16,1)
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@l_OrderID, @p_Login, 'Действие', 'ПОРУЧЕНИЕ ИСПОЛНЕНО: ID=' + cast(@p_ID as varchar))

        if @@error != 0
            raiserror('ошибка обработки',16,1)

        select @l_DecreeID = @p_ID
        set @p_Output = 'Updated'
    end else begin
        set @l_DecreeID = 0
        set @p_Output = 'Invalid' 
            + ':' + cast(@exists as varchar)
    end

    set @p_Output = @p_Output + ':' + cast(@l_DecreeID as varchar)

    if @p_Mode = 0
        SELECT @l_DecreeID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[FINISH_Decree_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[GET_StocksChildren_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================
-- GET STOCK LIST WITH ORDERS COUNT
-- ================================

CREATE PROCEDURE [dbo].[GET_StocksChildren_sp] 
    @p_MD  int
AS
BEGIN
    SET NOCOUNT ON

    SELECT 
        s.TID, 
        s.Name, 
        --s.Title, 
        s.ShortName,
        s.NodeLevel,
        s.NodeCode,
        --s.RefCode1C,
        --s.Comment,
        --s.EditedBy, 
        --s.RD,
        s.Children,
        (select count(*) from [dbo].Orders_tb o where o.StockListID in (
            select TID from [dbo].DIC_StockList_tb where NodeCode like s.NodeCode+'%'
            )
            and o.MD=@p_MD
        ) as Orders
    FROM
        [dbo].DIC_StockList_tb AS s
    ORDER BY NodeCode

END


GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Order_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- REGISTER NEW WORKFLOW DOCUMENT
-- ------------------------------
--   @p_Mode         -- mode of review
--
CREATE PROCEDURE [dbo].[REGISTER_Order_sp]
    @p_Mode             int,
    @p_Login            varchar(50),
    @p_Article          varchar(500),
    @p_Purpose          varchar(2000),
    @p_Activity         varchar(50),
    @p_Subdivision      varchar(150),
    @p_Category         varchar(50),
    @p_Equipment        varchar(2000),
    @p_Account          varchar(200),
    @p_DueDate          varchar(10),
    @p_EditedBy         varchar(50),
    @p_Status           int,
    @p_MD               int,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_TID              int,
        @l_Login            varchar(50),
        @l_OrderID          int,
        @l_ActivityID       int,
        @l_SubdivisionID    int,
        @l_CategoryID       int,
        @l_EquipmentID      int,
        @l_ParamID          int,
        @l_now              datetime

    set @l_now = getdate()
    --
    --    Check Activity exists
    --
    exec dbo.CHECK_Activity_sp 1, @p_Activity, @l_ActivityID output
    --
    --    Check Subdivision exists
    --
    exec dbo.CHECK_Subdivision_sp 1, @p_Subdivision, @l_SubdivisionID output
    --
    --    Check Category exists
    --
    exec dbo.CHECK_Category_sp 1, @p_Category, @p_MD, @l_CategoryID output
    --
    --    Check Equipment exists
    --
    exec dbo.CHECK_Equipment_sp 1, @l_SubdivisionID, @p_Equipment, @l_EquipmentID output

    declare 
        @exists bit = null

    select @exists=1, @l_OrderID=TID from [dbo].[Orders_tb] where 
        SubdivisionID=@l_SubdivisionID and 
        Article=@p_Article and 
        Login=@p_Login and 
        Status=@p_Status and 
        Purpose=@p_Purpose

    set @p_Output = ''

    if @exists = 1
        set @p_Output = 'Exists'

    else if @exists is null begin
        if @l_OrderID is null
            INSERT INTO [dbo].[Orders_tb](
                ActivityID,
                SubdivisionID,
                CategoryID,
                EquipmentID,
                Login,
                Article,
                Purpose,
                Account,
                Status,
                EditedBy,
                MD,
                RD
            ) VALUES (
                @l_ActivityID,
                @l_SubdivisionID,
                @l_CategoryID,
                @l_EquipmentID,
                @p_Login,
                @p_Article,
                @p_Purpose,
                @p_Account,
                0,
                @p_EditedBy,
                @p_MD,
                @l_now
            )

        if @@error != 0
            raiserror('ошибка добавления документа',16,1)

        select @l_TID = CAST(scope_identity() AS int)

        set @l_Login = @p_EditedBy

        set @l_OrderID = @l_TID

        INSERT INTO [dbo].[OrderDates_tb](
            OrderID, 
            Created
        ) VALUES (
            @l_OrderID,
            @l_now
        )

        DECLARE @param varchar(50) = 'Срок ввода в действие'

        if [dbo].[CHECK_IsEmpty_fn](@p_DueDate) = 0
            EXEC [dbo].[ADD_Param_sp] 1, @l_OrderID, 0, 0, @p_EditedBy, @param, @p_DueDate, @p_MD, null

        set @p_Activity = [dbo].[GET_SplittedItem_fn](@p_Activity, '|', 0)
        set @p_Subdivision = [dbo].[GET_SplittedItem_fn](@p_Subdivision, '|', 0)
        set @p_Category = [dbo].[GET_SplittedItem_fn](@p_Category, '|', 0)
        set @p_Equipment = [dbo].[GET_SplittedItem_fn](@p_Equipment, '|', 0)
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@l_OrderID, @l_Login, 'НАИМЕНОВАНИЕ ДОКУМЕНТА', @p_Article),
            (@l_OrderID, @l_Login, 'СОДЕРЖАНИЕ', @p_Purpose)

        if len(@p_Equipment) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Руководитель', @p_Equipment)

        if len(@p_Activity) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Вид деятельности', @p_Activity)

        if len(@p_Category) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Категория документа', @p_Category)

        if len(@p_Subdivision) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'ПОДРАЗДЕЛЕНИЕ', @p_Subdivision)

        if len(@p_Account) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Регистрационный номер', @p_Account)

        if len(@p_Login) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Автор документа', @p_Login)

        set @p_Output = 'Registered'
    end else begin
        set @l_OrderID = 0
        set @p_Output = 'Invalid' 
            + ':' + case when @l_SubdivisionID is null then 'NULL' else cast(@l_SubdivisionID as varchar) end
    end

    set @p_Output = @p_Output + ':' + cast(@l_OrderID as varchar)

    if @p_Mode = 0
        SELECT @l_OrderID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[REGISTER_Order_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[REGISTER_OrderStockList_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- REGISTER NEW PROVISION STOCKLIST STATE
-- --------------------------------------
--   @p_OrderID      -- Order ID
--   @p_Login        -- login of reviewer
--   @p_ID           -- ID StockList Reference
--
CREATE PROCEDURE [dbo].[REGISTER_OrderStockList_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_Login            varchar(50),
    @p_ID               int,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_StockListID  int = null,
        @l_Value        varchar(100),
        @l_now          datetime

    set @p_Output = ''
    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID
    select @l_StockListID=TID, @l_Value=NodeCode from [dbo].[DIC_StockList_tb] where TID=@p_ID

    if @l_StockListID is not null and dbo.CHECK_IsEmpty_fn(@l_Value) = 0 and @exists = 1
    begin
        UPDATE [dbo].[Orders_tb] SET
            StockListID=@l_StockListID
            --EditedBy=@p_Login,
            --RD=@l_now
        WHERE TID=@p_OrderID

        if @@error != 0
            raiserror('ошибка обновления класса товара',16,1)
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Класс товара', @l_Value)

        if @@error != 0
            raiserror('ошибка обработки',16,1)

        set @p_Output = 'Registered'
    end else begin
        set @l_StockListID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_StockListID as varchar)

    if @p_Mode = 0
        SELECT @l_StockListID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[REGISTER_OrderStockList_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[REGISTER_PaymentStatus_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[REGISTER_PaymentStatus_sp] 
    @p_Mode             int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Status           int,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_PaymentID    int = null,
        @l_OrderID      int = null,
        @l_PaymentDate  datetime,
        @l_PaymentName  varchar(50),
        @l_Value        varchar(100),
        @l_today        datetime,
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @l_OrderID=OrderID, @l_PaymentDate=PaymentDate from [dbo].[Payments_tb] where TID=@p_ID

    set @p_Output = ''

    if @l_OrderID > 0
    begin
        set @l_today = convert(varchar(10), getdate(), 120)
        if @l_PaymentDate < @l_today and @p_Status = 2
            set @l_PaymentDate = @l_today

        UPDATE [dbo].[Payments_tb] SET
            Status=@p_Status,
            PaymentDate=@l_PaymentDate
        WHERE TID=@p_ID
        --
        -- Get Payment name and value
        --
        select top 1 @l_PaymentName = Purpose, @l_Value = 
            'Дата: '   + cast(PaymentDate as varchar) + '; ' + 
            'Сумма: '  + cast(Total as varchar) + '; ' + 
            'НДС: '    + cast(Tax as varchar) + '; ' + 
            'Валюта: ' + Currency + '; ' + 
            'Курс: '   + cast(Rate as varchar) + '; ' + 
            'Статус:'  + cast(Status as varchar)
        from [dbo].[WEB_OrderPayments_vw] where TID=@p_ID
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@l_OrderID, @p_Login, 'Платежи:' + @l_PaymentName, @l_Value)
        --
        -- Add to Payment Changes log
        --
        INSERT INTO [dbo].[PaymentChanges_tb](
            PaymentID, 
            OrderID, 
            Login, 
            Status, 
            RD
        ) VALUES (
            @p_ID,
            @l_OrderID,
            @p_Login,
            @p_Status,
            @l_now
        )

        set @l_PaymentID = @p_ID
        set @p_Output = 'Refreshed'
    end else begin
        set @l_PaymentID = 0
        set @p_Output = 'Invalid' 
            + ':' + case when @l_PaymentID is null then 'NULL' else cast(@l_PaymentID as varchar) end
            + ':' + cast(@exists as varchar)
    end

    set @p_Output = @p_Output + ':' + cast(@l_PaymentID as varchar) + ':' + convert(varchar(10), @l_PaymentDate, 120)

    if @p_Mode = 0
        SELECT @l_PaymentID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[REGISTER_PaymentStatus_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Review_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- REGISTER NEW PROVISION REVIEW
-- -----------------------------
--   @p_OrderID      -- Order ID
--   @p_Login        -- login of reviewer
--   @p_Status       -- status of reviewer: 1 - accepted, 2 - rejected, 3 - comfirm
--   @p_Note         -- note of review
--
CREATE PROCEDURE [dbo].[REGISTER_Review_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ReviewID         int,
    @p_DecreeID         int,
    @p_ReportID         int,
    @p_Login            varchar(50),
    @p_Reviewer         varchar(50),
    @p_Status           int,
    @p_Note             varchar(1000),
    @p_ReviewDueDate    varchar(10),
    @p_WithMail         bit,
    @p_Executor         varchar(50),
    @p_Report           varchar(1000),
    @p_EditedBy         varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_ReviewID     int = null,
        @l_DecreeID     int = 0,
        @l_ReportID     int = 0,
        @l_Reviewer     varchar(50),
        @l_Author       varchar(50),
        @l_now          datetime

    set @p_Output = ''
    set @l_now = getdate()

    declare 
        @exists bit = null,
        @is_decree_report bit = null

    select @exists=1, @l_Author=Login from [dbo].[Orders_tb] where TID=@p_OrderID

    set @is_decree_report = case when @p_Status=9 and @p_Login=@p_Executor then 1 else 0 end

    if @exists = 1
    begin
        if @p_ReviewID = 0 begin
            INSERT INTO [dbo].[Reviews_tb](
                OrderID, 
                Login, 
                Reviewer, 
                Status, 
                Note, 
                RD
            ) VALUES (
                @p_OrderID,
                @p_Login,
                @p_Reviewer,
                @p_Status,
                @p_Note,
                @l_now
            )

            if @@error != 0
                raiserror('ошибка добавления рецензии',16,1)

            select @l_ReviewID = CAST(scope_identity() AS int)
        end else if @is_decree_report = 0 begin
            UPDATE [dbo].[Reviews_tb] SET Login=@p_Login, Reviewer=@p_Reviewer, Note=@p_Note, RD=@l_now WHERE TID=@p_ReviewID

            if @@error != 0
                raiserror('ошибка обновления рецензии',16,1)
        
            set @l_ReviewID = @p_ReviewID
        end else
            set @l_ReviewID = @p_ReviewID

        if (@p_Login = 'aybazov' or @p_Login = @l_Author) and @p_Status < 5 begin
            UPDATE [dbo].[Orders_tb] SET Status=@p_Status WHERE TID=@p_OrderID

            if @p_Status = 2
                UPDATE [dbo].[OrderDates_tb] SET Approved=@l_now WHERE OrderID=@p_OrderID
        end

        if @@error != 0
            raiserror('ошибка смены статуса',16,1)

        else if @p_Status = 4 and @p_ReviewDueDate != ''
            UPDATE [dbo].[OrderDates_tb] SET ReviewDueDate=@p_ReviewDueDate, WithMail=@p_WithMail WHERE OrderID=@p_OrderID

        else if @p_Status = 6
            UPDATE [dbo].[OrderDates_tb] SET Paid=case when @p_ReviewDueDate='' then @l_now else @p_ReviewDueDate end WHERE OrderID=@p_OrderID

        else if @p_Status = 7
            UPDATE [dbo].[OrderDates_tb] SET Delivered=case when @p_ReviewDueDate='' then @l_now else @p_ReviewDueDate end WHERE OrderID=@p_OrderID

        else if @p_Status = 10
            UPDATE [dbo].[OrderDates_tb] SET AuditDate=@l_now WHERE OrderID=@p_OrderID

        else if @p_Status = 12
            UPDATE [dbo].[OrderDates_tb] SET Validated=@l_now WHERE OrderID=@p_OrderID

        if @@error != 0
            raiserror('ошибка регистрации даты рецензии',16,1)
        --
        -- Add Decree Executor
        --
        if @p_Status = 9
        begin
            if @p_DecreeID = 0 begin
                INSERT INTO [dbo].[Decrees_tb](
                    OrderID,
                    ReviewID, 
                    Login, 
                    Status,
                    DueDate,
                    ReportID,
                    EditedBy, 
                    RD
                ) VALUES (
                    @p_OrderID,
                    @l_ReviewID,
                    @p_Executor,
                    0,
                    @p_ReviewDueDate,
                    null,
                    @p_EditedBy,
                    @l_now
                )

                if @@error != 0
                    raiserror('ошибка добавления поручения',16,1)

                select @l_DecreeID = CAST(scope_identity() AS int)
            
            end else begin
                if @is_decree_report = 1 begin
                    select top 1 @l_Reviewer=Reviewer from [dbo].[Reviews_tb] where Login=@p_Executor

                    if @p_ReportID = 0 begin
                        INSERT INTO [dbo].[Reviews_tb](
                            OrderID, 
                            Login, 
                            Reviewer, 
                            Status, 
                            Note, 
                            RD
                        ) VALUES (
                            @p_OrderID,
                            @p_Executor,
                            @l_Reviewer,
                            5,
                            @p_Report,
                            @l_now
                        )

                        if @@error != 0
                            raiserror('ошибка добавления отчета исполнителя',16,1)

                        select @l_ReportID = CAST(scope_identity() AS int)

                    end else begin
                        UPDATE [dbo].[Reviews_tb] SET Note=@p_Report, RD=@l_now WHERE TID=@p_ReportID

                        if @@error != 0
                            raiserror('ошибка обновления отчета исполнителя',16,1)
        
                        set @l_ReportID = @p_ReportID
                    end

                    UPDATE [dbo].[Decrees_tb] SET ReportID=@l_ReportID, EditedBy=@p_EditedBy, RD=@l_now WHERE TID=@p_DecreeID

                    if @@error != 0
                        raiserror('ошибка обновления поручения',16,1)

                    INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                        (@p_OrderID, @p_Executor, 'Отчет о выполнении поручения', @p_Report)
                
                end else if @p_ReviewDueDate is not null begin
                    UPDATE [dbo].[Decrees_tb] SET Login=@p_Executor, Status=0, DueDate=@p_ReviewDueDate, EditedBy=@p_EditedBy, RD=@l_now WHERE TID=@p_DecreeID

                    if @@error != 0
                        raiserror('ошибка обновления поручения',16,1)

                    INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                        (@p_OrderID, @p_EditedBy, 'Срок исполнения поручения', @p_ReviewDueDate)
                end

                set @l_DecreeID = @p_DecreeID
            end
        end

        if @@error != 0
            raiserror('ошибка добавления рецензии',16,1)
        --
        -- Add to Order Changes log
        --
        if @is_decree_report = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@p_OrderID, @p_Login, 'Рецензия', case @p_Status 
                    when  2 then 'СОГЛАСОВАНО'
                    when  3 then 'ОТКАЗАНО'
                    when  4 then 'ТРЕБУЕТСЯ ОБОСНОВАНИЕ'
                    when  5 then 'Информация'
                    when  6 then 'Оплачено'
                    when  7 then 'Поставлено на склад'
                    when  9 then 'ПОРУЧЕНИЕ'
                    when 10 then 'АУДИТ'
                    when 11 then 'Замечание'
                    when 12 then 'Акцептовано к закрытию'
                    else '...'
                    end +
                    case when [dbo].[CHECK_IsEmpty_fn](@p_Note) = 0 then ':'+@p_Note else '' end
                    )

        if @@error != 0
            raiserror('ошибка обработки',16,1)

        set @p_Output = 'Registered'
    end else begin
        set @l_ReviewID = 0
        set @l_DecreeID = 0
        set @l_ReportID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_ReviewID as varchar) -- + ':' + cast(@l_DecreeID as varchar)

    if @p_Mode = 0
        SELECT @l_ReviewID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[REGISTER_Review_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Reviewers_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- REGISTER PROVISION REVIEWERS
-- ----------------------------
--   @p_OrderID      -- Order ID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[REGISTER_Reviewers_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_Login            varchar(50),
    @p_Value            varchar(1000),
    @p_MD               int,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_TID          int = null,
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        select * into #tmp from [dbo].[GET_SplittedStrings_fn](@p_Value, ':')
        
        DELETE FROM [dbo].[Reviewers_tb] WHERE OrderID=@p_OrderID
        INSERT INTO [dbo].[Reviewers_tb] SELECT @p_OrderID, item FROM #tmp

        drop table #tmp
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Назначены рецензенты', @p_Value)

        set @l_TID = @p_OrderID
        set @p_Output = 'Registered'
    end else begin
        set @l_TID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_TID as varchar)

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[REGISTER_Reviewers_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[REJECT_Decree_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[REJECT_Decree_sp] 
    @p_Mode             int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_DecreeID         int,
        @l_OrderID          int,
        @l_ReviewID         int,
        @l_ReportID         int,
        @l_now              datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1, @l_ReviewID=ReviewID, @l_ReportID=ReportID from [dbo].[Decrees_tb] where TID=@p_ID

    set @p_Output = ''

    if @exists = 1
    begin
        select @l_OrderID=OrderID from [dbo].[Reviews_tb] WHERE TID=@l_ReviewID

        UPDATE [dbo].[Decrees_tb] SET Status=3 WHERE TID=@p_ID

        if @@error != 0
            raiserror('ошибка обновления поручения',16,1)
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@l_OrderID, @p_Login, 'Действие', 'ПОРУЧЕНИЕ ОТМЕНЕНО: ID=' + cast(@p_ID as varchar))

        if @@error != 0
            raiserror('ошибка обработки',16,1)

        select @l_DecreeID = @p_ID
        set @p_Output = 'Updated'
    end else begin
        set @l_DecreeID = 0
        set @p_Output = 'Invalid' 
            + ':' + cast(@exists as varchar)
    end

    set @p_Output = @p_Output + ':' + cast(@l_DecreeID as varchar)

    if @p_Mode = 0
        SELECT @l_DecreeID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[REJECT_Decree_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[REMOVE_Decree_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[REMOVE_Decree_sp] 
    @p_Mode             int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_DecreeID         int,
        @l_OrderID          int,
        @l_ReviewID         int,
        @l_ReportID         int,
        @l_now              datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1, @l_ReviewID=ReviewID, @l_ReportID=ReportID from [dbo].[Decrees_tb] where TID=@p_ID

    set @p_Output = ''

    if @exists = 1
    begin
        select @l_OrderID=OrderID from [dbo].[Reviews_tb] WHERE TID=@l_ReviewID

        DELETE [dbo].[Decrees_tb] WHERE TID=@p_ID
        DELETE [dbo].[Reviews_tb] WHERE TID in (@l_ReviewID, @l_ReportID)

        if @@error != 0
            raiserror('ошибка удаления поручения',16,1)
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@l_OrderID, @p_Login, 'Действие', 'ПОРУЧЕНИЕ УДАЛЕНО: ID=' + cast(@p_ID as varchar))

        if @@error != 0
            raiserror('ошибка обработки',16,1)

        select @l_DecreeID = @p_ID
        set @p_Output = 'Removed'
    end else begin
        set @l_DecreeID = 0
        set @p_Output = 'Invalid' 
            + ':' + cast(@exists as varchar)
    end

    set @p_Output = @p_Output + ':' + cast(@l_DecreeID as varchar)

    if @p_Mode = 0
        SELECT @l_DecreeID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[REMOVE_Decree_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[SET_Read_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- SET READ FLAG
-- -------------
--   @p_OrderID      -- Order ID
--   @p_Logins       -- users login list, string with delimeter '|'
--
CREATE PROCEDURE [dbo].[SET_Read_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_Logins           varchar(250),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_Login        varchar(50),
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        DELETE FROM [dbo].[Unreads_tb] WHERE OrderID=@p_OrderID and Login in (
            select item as Login from [dbo].[GET_SplittedStrings_fn](@p_Logins, '|')
        )

        set @p_Output = 'Done'
    end else if @p_OrderID is null begin
        DELETE FROM [dbo].[Unreads_tb] WHERE Login in (
            select item as Login from [dbo].[GET_SplittedStrings_fn](@p_Logins, '|')
        )

        set @p_Output = 'Done'
    end else begin
        set @p_Output = 'Invalid'
    end

    if @p_Mode = 0
        SELECT @p_OrderID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[SET_Read_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[SET_Status_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- REGISTER NEW PROVISION REVIEW
-- -----------------------------
--   @p_OrderID      -- Order ID
--   @p_Login        -- login of reviewer
--   @p_Status       -- status of reviewer: 2 - accepted, 3 - rejected, 4 - confirm
--
CREATE PROCEDURE [dbo].[SET_Status_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_Login            varchar(50),
    @p_Status           int,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        UPDATE [dbo].[Orders_tb] SET Status=@p_Status WHERE TID=@p_OrderID

        if @p_Status = 5 begin
            UPDATE [dbo].[OrderDates_tb] SET Delivered=NULL WHERE OrderID=@p_OrderID
            delete from [dbo].[Reviews_tb] where OrderID=@p_OrderID and Status in (8)
        end
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Статус', case @p_Status 
                when 0 then 'В работе'
                when 1 then 'На согласовании'
                when 2 then 'СОГЛАСОВАНО'
                when 3 then 'ОТКАЗАНО'
                when 4 then 'ТРЕБУЕТСЯ ОБОСНОВАНИЕ'
                when 5 then 'На исполнении'
                when 6 then 'ИСПОЛНЕНО'
                when 7 then 'В архиве'
                when 8 then ''
                when 9 then 'Корзина'
                else '...'
                end
                )

        set @p_Output = 'Status changed'
    end else begin
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@p_Status as varchar)

    if @p_Mode = 0
        SELECT @p_OrderID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[SET_Status_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[SET_Unread_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- SET UNREAD FLAG
-- ---------------
--   @p_OrderID      -- Order ID
--   @p_Logins       -- users login list, string with delimeter '|'
--
CREATE PROCEDURE [dbo].[SET_Unread_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_Logins           varchar(250),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_Login        varchar(50),
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        INSERT INTO [dbo].[Unreads_tb]
        select @p_OrderID as OrderID, item as Login from [dbo].[GET_SplittedStrings_fn](@p_Logins, '|')

        set @p_Output = 'Done'
    end else begin
        set @p_Output = 'Invalid'
    end

    if @p_Mode = 0
        SELECT @p_OrderID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[SET_Unread_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[UPDATE_Order_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_Order_sp] 
    @p_Mode             int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Article          varchar(500),
    @p_Purpose          varchar(2000),
    @p_Activity         varchar(50),
    @p_Subdivision      varchar(150),
    @p_Category         varchar(50),
    @p_Equipment        varchar(2000),
    @p_Account          varchar(200),
    @p_DueDate          varchar(10),
    @p_EditedBy         varchar(50),
    @p_MD               int,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_OrderID          int,
        @l_ParamID          int,
        @l_ActivityID       int,
        @l_SubdivisionID    int,
        @l_EquipmentID      int,
        @l_CategoryID       int,
        @l_DueDate          varchar(10),
        @l_now              datetime

    DECLARE
        @c_Author           varchar(50), 
        @c_Article          varchar(500), 
        @c_Purpose          varchar(2000), 
        @c_Account          varchar(200), 
        @c_Equipment        varchar(1000), 
        @c_Activity         varchar(50), 
        @c_Subdivision      varchar(50), 
        @c_Category         varchar(50)

    set @l_now = getdate()
    --
    --    Check Activity exists
    --
    exec dbo.CHECK_Activity_sp 1, @p_Activity, @l_ActivityID output
    --
    --    Check Subdivision exists
    --
    exec dbo.CHECK_Subdivision_sp 1, @p_Subdivision, @l_SubdivisionID output
    --
    --    Check Category exists
    --
    exec dbo.CHECK_Category_sp 1, @p_Category, @p_MD, @l_CategoryID output
    --
    --    Check Equipment exists
    --
    exec dbo.CHECK_Equipment_sp 1, @l_SubdivisionID, @p_Equipment, @l_EquipmentID output

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_ID

    set @p_Output = ''

    if dbo.CHECK_IsEmpty_fn(@l_SubdivisionID) = 0 and @exists = 1
    begin
        select 
            @c_Author=Author, @c_Article=Article, @c_Purpose=Purpose, 
            @c_Activity=Activity, @c_Category=Category, @c_Equipment=Equipment, @c_Account=Account, @c_Subdivision=Subdivision
        from [dbo].[WEB_Orders_vw] where TID=@p_ID

        if @p_ID is not null
            UPDATE [dbo].[Orders_tb] SET
                ActivityID=@l_ActivityID,
                SubdivisionID=@l_SubdivisionID,
                CategoryID=@l_CategoryID,
                EquipmentID=@l_EquipmentID,
                Login=@p_Login,
                Article=@p_Article,
                Purpose=@p_Purpose,
                Account=@p_Account,
                EditedBy=@p_EditedBy,
                RD=@l_now
            WHERE TID=@p_ID

        select @l_OrderID = @p_ID

        set @p_Activity = [dbo].[GET_SplittedItem_fn](@p_Activity, '|', 0)
        set @p_Subdivision = [dbo].[GET_SplittedItem_fn](@p_Subdivision, '|', 0)
        set @p_Category = [dbo].[GET_SplittedItem_fn](@p_Category, '|', 0)
        set @p_Equipment = [dbo].[GET_SplittedItem_fn](@p_Equipment, '|', 0)
        --
        -- Add to Order Changes log
        --
        if [dbo].[CHECK_IsEqual_fn](@c_Article, @p_Article) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'НАИМЕНОВАНИЕ ДОКУМЕНТА', @p_Article)

        if [dbo].[CHECK_IsEqual_fn](@c_Equipment, @p_Equipment) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Руководитель', @p_Equipment)

        if [dbo].[CHECK_IsEqual_fn](@c_Purpose, @p_Purpose) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'СОДЕРЖАНИЕ', @p_Purpose)

        if [dbo].[CHECK_IsEqual_fn](@c_Activity, @p_Activity) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Вид деятельности', @p_Activity)

        if [dbo].[CHECK_IsEqual_fn](@c_Category, @p_Category) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Категория документа', @p_Category)

        if [dbo].[CHECK_IsEqual_fn](@c_Account, @p_Account) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Регистрационный номер', @p_Account)

        if [dbo].[CHECK_IsEqual_fn](@c_Author, @p_Login) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Автор документа', @p_Login)

        DECLARE @param varchar(50) = 'Срок ввода в действие'

        select top 1 @l_ParamID = TID from [dbo].[DIC_Params_tb] where Name=@param and (MD=@p_MD or MD is null)

        if [dbo].[CHECK_IsEmpty_fn](@p_DueDate) = 0 begin
            select @l_DueDate=[Value] from [dbo].[Params_tb] where OrderID=@l_OrderID and ParamID=@l_ParamID
            if @p_DueDate != @l_DueDate or [dbo].[CHECK_IsEmpty_fn](@l_DueDate) = 1
                EXEC [dbo].[ADD_Param_sp] 1, @l_OrderID, 0, 0, @p_EditedBy, @param, @p_DueDate, @p_MD, null
        end else
            EXEC [dbo].[DEL_Param_sp] 1, @l_OrderID, @l_ParamID, 0, @p_EditedBy, null

        set @p_Output = 'Refreshed'
    end else begin
        set @l_OrderID = 0
        set @p_Output = 'Invalid' 
            + ':' + case when @l_SubdivisionID is null then 'NULL' else cast(@l_SubdivisionID as varchar) end
            + ':' + cast(@exists as varchar)
    end

    set @p_Output = @p_Output + ':' + cast(@l_OrderID as varchar)

    if @p_Mode = 0
        SELECT @l_OrderID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[UPDATE_Order_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[UPDATE_Seller_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_Seller_sp] 
    @p_Mode             int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Name             varchar(100),
    @p_Title            varchar(250),
    @p_Address          varchar(1000),
    @p_Code             varchar(20),
    @p_Type             int,
    @p_Contact          varchar(200),
    @p_URL              varchar(200),
    @p_Phone            varchar(100),
    @p_Email            varchar(100),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_SellerID         int,
        @l_now              datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[DIC_Sellers_tb] where TID=@p_ID

    set @p_Output = ''

    if @exists = 1
    begin
        UPDATE [dbo].[DIC_Sellers_tb] SET
            Name=@p_Name,
            Title=@p_Title,
            Address=@p_Address,
            Code=@p_Code,
            Type=@p_Type,
            Contact=@p_Contact,
            URL=@p_URL,
            Phone=@p_Phone,
            Email=@p_Email,
            EditedBy=@p_Login,
            RD=@l_now
        WHERE TID=@p_ID

        set @l_SellerID = @p_ID
        set @p_Output = 'Refreshed'
    end else begin
        set @l_SellerID = 0
        set @p_Output = 'Invalid' 
            + ':' + case when @l_SellerID is null then 'NULL' else cast(@l_SellerID as varchar) end
            + ':' + cast(@exists as varchar)
    end

    set @p_Output = @p_Output + ':' + cast(@l_SellerID as varchar)

    if @p_Mode = 0
        SELECT @l_SellerID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[UPDATE_Seller_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[UPDATE_Stock_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_Stock_sp] 
    @p_Mode             int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Name             varchar(100),
    @p_Title            varchar(250),
    @p_ShortName        varchar(100),
    @p_RefCode1C        varchar(20),
    @p_Comment          varchar(1000),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_StockID          int,
        @l_now              datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[DIC_StockList_tb] where TID=@p_ID

    set @p_Output = ''

    if @exists = 1
    begin
        UPDATE [dbo].[DIC_StockList_tb] SET
            Name=@p_Name,
            Title=@p_Title,
            ShortName=@p_ShortName,
            RefCode1C=@p_RefCode1C,
            Comment=@p_Comment,
            EditedBy=@p_Login,
            RD=@l_now
        WHERE TID=@p_ID

        set @l_StockID = @p_ID
        set @p_Output = 'Refreshed'
    end else begin
        set @l_StockID = 0
        set @p_Output = 'Invalid' 
            + ':' + case when @l_StockID is null then 'NULL' else cast(@l_StockID as varchar) end
            + ':' + cast(@exists as varchar)
    end

    set @p_Output = @p_Output + ':' + cast(@l_StockID as varchar)

    if @p_Mode = 0
        SELECT @l_StockID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[UPDATE_Stock_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[WEB_SemaphoreEvents_sp]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================
-- Author:      Kharlamov
-- Create date: 20200129
-- Description: Semaphore of WorkflowDB Events 
-- ============================================

CREATE PROCEDURE [dbo].[WEB_SemaphoreEvents_sp] 
    @p_Mode        int,
    @p_OrderLogID  int,
    @p_ReviewLogID int,
    @p_LogDateTime datetime,
    @p_OUT         varchar(100) OUTPUT
AS
BEGIN
    SET NOCOUNT ON

    DECLARE 
        @l_current_order_log_id  int,
        @l_current_review_log_id int

    select top 1 @l_current_order_log_id = LID from [dbo].[Orders_Log_tb] order by LID desc
    select top 1 @l_current_review_log_id = LID from [dbo].[Reviews_Log_tb] order by LID desc

    if @p_Mode = 0
        SELECT @l_current_order_log_id, @l_current_review_log_id FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[WEB_SemaphoreEvents_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else if @p_Mode = 1
        select 
            cast(LID as varchar) + ':0' as LID,
            Status,
            Oper
        from [dbo].[Orders_Log_tb] 
        where LID > @p_OrderLogID
        UNION
        select 
            '0:' + cast(LID as varchar) as LID,
            Status,
            Oper
        from [dbo].[Reviews_Log_tb] 
        where LID > @p_ReviewLogID
        order by LID
END



GO
/****** Object:  Trigger [dbo].[Orders_Log_Del_trg]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Orders_Log_Del_trg] on [dbo].[Orders_tb]
for delete
as
  INSERT INTO [dbo].[Orders_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [EditedBy], [RD], 'D' from deleted


GO
ALTER TABLE [dbo].[Orders_tb] ENABLE TRIGGER [Orders_Log_Del_trg]
GO
/****** Object:  Trigger [dbo].[Orders_Log_Ins_trg]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Orders_Log_Ins_trg] on [dbo].[Orders_tb]
for insert
as
  INSERT INTO [dbo].[Orders_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [EditedBy], [RD], 'I' from inserted


GO
ALTER TABLE [dbo].[Orders_tb] ENABLE TRIGGER [Orders_Log_Ins_trg]
GO
/****** Object:  Trigger [dbo].[Orders_Log_Upd_trg]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Orders_Log_Upd_trg] on [dbo].[Orders_tb]
for update
as
  INSERT INTO [dbo].[Orders_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [EditedBy], [RD], 'U' from inserted


GO
ALTER TABLE [dbo].[Orders_tb] ENABLE TRIGGER [Orders_Log_Upd_trg]
GO
/****** Object:  Trigger [dbo].[Reviews_Log_Del_trg]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[Reviews_Log_Del_trg] on [dbo].[Reviews_tb]
for delete
as
  INSERT INTO [dbo].[Reviews_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [Login], [RD], 'D' from deleted


GO
ALTER TABLE [dbo].[Reviews_tb] ENABLE TRIGGER [Reviews_Log_Del_trg]
GO
/****** Object:  Trigger [dbo].[Reviews_Log_Ins_trg]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Reviews_Log_Ins_trg] on [dbo].[Reviews_tb]
for insert
as
  INSERT INTO [dbo].[Reviews_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [Login], [RD], 'I' from inserted


GO
ALTER TABLE [dbo].[Reviews_tb] ENABLE TRIGGER [Reviews_Log_Ins_trg]
GO
/****** Object:  Trigger [dbo].[Reviews_Log_Upd_trg]    Script Date: 31.10.2021 14:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Reviews_Log_Upd_trg] on [dbo].[Reviews_tb]
for update
as
  INSERT INTO [dbo].[Reviews_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [Login], [RD], 'U' from inserted


GO
ALTER TABLE [dbo].[Reviews_tb] ENABLE TRIGGER [Reviews_Log_Upd_trg]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 258
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o"
            Begin Extent = 
               Top = 7
               Left = 306
               Bottom = 170
               Right = 516
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BATCH_Sellers_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BATCH_Sellers_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Activities_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Activities_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Authors_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Authors_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 84
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Categories_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Categories_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 93
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Comments_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Comments_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 123
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Companies_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Companies_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Conditions_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Conditions_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 119
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 120
               Left = 662
               Bottom = 250
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "g"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 234
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "l"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 268
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_CostOrders_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'      Begin Table = "d"
            Begin Extent = 
               Top = 138
               Left = 454
               Bottom = 268
               Right = 625
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_CostOrders_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_CostOrders_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "r"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Decrees_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Decrees_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 108
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Equipments_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Equipments_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderChanges_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderChanges_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 93
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderComments_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderComments_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v"
            Begin Extent = 
               Top = 7
               Left = 256
               Bottom = 126
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderItems_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderItems_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 93
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderParams_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderParams_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 93
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderPayments_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderPayments_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 102
               Left = 454
               Bottom = 219
               Right = 614
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "g"
            Begin Extent = 
               Top = 120
               Left = 246
               Bottom = 198
               Right = 397
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "l"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 255
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 138
               Left = 652
               Bottom = 255
               Right = 818
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 652
               Bottom = 119
               Right = 822
            End
            DisplayFlags = 280
            TopColumn = 0
         End
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Orders_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'     End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 45
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Orders_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Orders_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderVendors_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderVendors_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 93
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Params_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Params_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_ParamValues_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_ParamValues_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 93
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Payments_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Payments_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "r"
            Begin Extent = 
               Top = 6
               Left = 254
               Bottom = 119
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_ReviewerOrders_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_ReviewerOrders_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 126
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 7
               Left = 774
               Bottom = 170
               Right = 968
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 126
               Left = 532
               Bottom = 289
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_ReviewPayments_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_ReviewPayments_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_ReviewPayments_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "r"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 136
               Right = 406
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 434
               Bottom = 136
               Right = 604
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Reviews_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Reviews_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "r"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 123
               Right = 417
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 455
               Bottom = 123
               Right = 621
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 20
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Schedule_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Schedule_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[28] 4[18] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Sellers_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Sellers_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Stocks_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Stocks_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_StocksChildren_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_StocksChildren_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 2115
         Width = 1500
         Width = 3075
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Subdivisions_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Subdivisions_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 126
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Vendors_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Vendors_vw'
GO
USE [master]
GO
ALTER DATABASE [WorkflowDB] SET  READ_WRITE 
GO
