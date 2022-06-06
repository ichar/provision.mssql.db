USE [ProvisionDB]
GO
/****** Object:  UserDefinedFunction [dbo].[CHECK_IsEqual_fn]    Script Date: 15.03.2021 10:52:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHECK_IsEqual_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[CHECK_IsEqual_fn]
GO
/****** Object:  StoredProcedure [dbo].[CHECK_Sector_sp]    Script Date: 15.03.2021 10:52:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHECK_Sector_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CHECK_Sector_sp]
GO
/****** Object:  StoredProcedure [dbo].[DEL_Link_sp]    Script Date: 15.03.2021 10:28:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEL_Link_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DEL_Link_sp]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Link_sp]    Script Date: 15.03.2021 10:28:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADD_Link_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ADD_Link_sp]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderLinks_OrderID]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderLinks_tb]'))
ALTER TABLE [dbo].[OrderLinks_tb] DROP CONSTRAINT [FK_OrderLinks_OrderID]
GO
/****** Object:  View [dbo].[WEB_Sectors_vw]    Script Date: 15.03.2021 10:52:23 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Sectors_vw]'))
DROP VIEW [dbo].[WEB_Sectors_vw]
GO
/****** Object:  View [dbo].[WEB_OrderLinks_vw]    Script Date: 15.03.2021 10:28:24 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_OrderLinks_vw]'))
DROP VIEW [dbo].[WEB_OrderLinks_vw]
GO
/****** Object:  View [dbo].[WEB_Links_vw]    Script Date: 15.03.2021 10:28:24 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Links_vw]'))
DROP VIEW [dbo].[WEB_Links_vw]
GO
/****** Object:  Table [dbo].[DIC_Sectors_tb]    Script Date: 15.03.2021 10:52:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DIC_Sectors_tb]') AND type in (N'U'))
DROP TABLE [dbo].[DIC_Sectors_tb]
GO
/****** Object:  Table [dbo].[OrderLinks_tb]    Script Date: 15.03.2021 10:28:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderLinks_tb]') AND type in (N'U'))
DROP TABLE [dbo].[OrderLinks_tb]
GO
/****** Object:  Table [dbo].[DIC_Links_tb]    Script Date: 15.03.2021 10:28:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DIC_Links_tb]') AND type in (N'U'))
DROP TABLE [dbo].[DIC_Links_tb]
GO

alter table [ProvisionDB].[dbo].[Orders_tb] add [SectorID] [int] NULL
GO

/****** Object:  UserDefinedFunction [dbo].[CHECK_IsEqual_fn]    Script Date: 13.03.2021 20:30:47 ******/
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
    if @s1 is NULL
        return 0
    if @s2 is NULL
        return 0
    if RTRIM(LTRIM(@s1)) != RTRIM(LTRIM(@s2))
        return 0
    return 1
END

GO
/****** Object:  Table [dbo].[DIC_Refers_tb]    Script Date: 13.03.2021 20:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIC_Refers_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[MD] [int] NULL,
 CONSTRAINT [PK_Refers] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DIC_Sectors_tb]    Script Date: 13.03.2021 20:30:47 ******/
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
/****** Object:  Table [dbo].[OrderRefers_tb]    Script Date: 13.03.2021 20:30:47 ******/
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
/****** Object:  View [dbo].[WEB_CostOrders_vw]    Script Date: 13.03.2021 20:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[WEB_CostOrders_vw]
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
/****** Object:  View [dbo].[WEB_Refers_vw]    Script Date: 13.03.2021 20:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_Refers_vw]
AS
SELECT        TID, Name, MD
FROM            dbo.DIC_Refers_tb AS s

GO
/****** Object:  View [dbo].[WEB_OrderRefers_vw]    Script Date: 13.03.2021 20:30:47 ******/
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
/****** Object:  View [dbo].[WEB_Orders_vw]    Script Date: 13.03.2021 20:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[WEB_Orders_vw]
AS
SELECT        o.TID, o.Login AS Author, o.Article, o.Qty, o.Purpose, o.Price, o.Currency, o.Total, o.Tax, p.Name AS Subdivision, u.Name AS Sector, e.Title AS Equipment, e.Name AS EquipmentName, c.Name AS Condition, s.Name AS Seller, 
                         s.Code AS SellerCode, s.Type AS SellerType, s.Title AS SellerTitle, s.Address AS SellerAddress, s.Contact AS SellerContact, s.URL AS SellerURL, g.Name AS Category, o.Account, o.URL, o.Status,
                             (SELECT        TOP (1) Status
                               FROM            dbo.Reviews_tb AS r
                               WHERE        (OrderID = o.TID)
                               ORDER BY TID DESC) AS ReviewStatus, dbo.GET_ReviewStatuses_fn(o.TID) AS ReviewStatuses, p.Code AS SubdivisionCode, p.TID AS SubdivisionID, u.TID AS SectorID, e.TID AS EquipmentID, s.TID AS SellerID, 
                         c.TID AS ConditionID, o.CategoryID, o.StockListID, l.NodeCode AS StockListNodeCode, dbo.GET_UnreadByLogin_fn(o.TID) AS UnreadByLogin, o.EditedBy, o.RowSpan, d.Created, d.Approved, d.ReviewDueDate, d.Paid, 
                         d.Delivered, o.MD, o.RD
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
/****** Object:  View [dbo].[WEB_Sectors_vw]    Script Date: 13.03.2021 20:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_Sectors_vw]
AS
SELECT        TID, Name, Code, Manager, Name + ' (' + Manager + ')' AS FullName
FROM            dbo.DIC_Sectors_tb AS s

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_Refers_Name]    Script Date: 13.03.2021 20:30:47 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_Refers_Name] ON [dbo].[DIC_Refers_tb]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_Sectors_Name]    Script Date: 13.03.2021 20:30:47 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_Sectors_Name] ON [dbo].[DIC_Sectors_tb]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_OrderRefers_ReferID]    Script Date: 13.03.2021 20:30:47 ******/
CREATE NONCLUSTERED INDEX [WX_OrderRefers_ReferID] ON [dbo].[OrderRefers_tb]
(
	[ReferID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_OrderRefers_OrderID]    Script Date: 13.03.2021 20:30:47 ******/
CREATE NONCLUSTERED INDEX [WX_OrderRefers_OrderID] ON [dbo].[OrderRefers_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderRefers_tb] ADD  CONSTRAINT [DF_OrderRefers_RD]  DEFAULT (getdate()) FOR [RD]
GO
ALTER TABLE [dbo].[OrderRefers_tb]  WITH CHECK ADD  CONSTRAINT [FK_OrderRefers_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[OrderRefers_tb] CHECK CONSTRAINT [FK_OrderRefers_OrderID]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Refer_sp]    Script Date: 13.03.2021 20:30:47 ******/
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
/****** Object:  StoredProcedure [dbo].[CHECK_Sector_sp]    Script Date: 13.03.2021 20:30:47 ******/
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
/****** Object:  StoredProcedure [dbo].[DEL_Refer_sp]    Script Date: 13.03.2021 20:30:47 ******/
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
/****** Object:  StoredProcedure [dbo].[REGISTER_Order_sp]    Script Date: 13.03.2021 20:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- REGISTER NEW PROVISION ORDER
-- ----------------------------
--   @p_Mode         -- mode of review
--
ALTER PROCEDURE [dbo].[REGISTER_Order_sp]
    @p_Mode             int,
    @p_Login            varchar(50),
    @p_Article          varchar(500),
    @p_Qty              int,
    @p_Purpose          varchar(2000),
    @p_Price            float,
    @p_Currency         varchar(10),
    @p_Total            float,
    @p_Tax              float,
    @p_Subdivision      varchar(150),
    @p_Sector           varchar(150),
    @p_Category         varchar(50),
    @p_Equipment        varchar(2000),
    @p_Seller           varchar(2000),
    @p_Condition        varchar(50),
    @p_Account          varchar(200),
    @p_URL              varchar(200),
    @p_DueDate          varchar(10),
    @p_EditedBy         varchar(50),
    @p_Status           int,
    @p_IsNoPrice        int,
    @p_MD               int,
    @p_RowSpan          int,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_TID              int,
        @l_Login            varchar(50),
        @l_OrderID          int,
        @l_SubdivisionID    int,
        @l_SectorID         int,
        @l_CategoryID       int,
        @l_SellerID         int,
        @l_EquipmentID      int,
        @l_ConditionID      int,
        @l_ParamID          int,
        @l_now              datetime

    set @l_now = getdate()
    --
    --    Check Subdivision exists
    --
    exec dbo.CHECK_Subdivision_sp 1, @p_Subdivision, @l_SubdivisionID output
    --
    --    Check Sector exists
    --
    exec dbo.CHECK_Sector_sp 1, @p_Sector, @l_SectorID output
    --
    --    Check Category exists
    --
    exec dbo.CHECK_Category_sp 1, @p_Category, @p_MD, @l_CategoryID output
    --
    --    Check Equipment exists
    --
    exec dbo.CHECK_Equipment_sp 1, @l_SubdivisionID, @p_Equipment, @l_EquipmentID output
    --
    --    Check Condition exists
    --
    if @p_IsNoPrice = 0
        exec dbo.CHECK_Condition_sp 1, @p_Condition, @l_ConditionID output
    --
    --    Check Seller exists
    --
    exec dbo.CHECK_Seller_sp 1, @p_Seller, @p_MD, @l_SellerID output

    declare 
        @exists bit = null

    select @exists=1, @l_OrderID=TID from [dbo].[Orders_tb] where 
        SubdivisionID=@l_SubdivisionID and 
        Article=@p_Article and 
        Qty=@p_Qty and 
        Login=@p_Login and 
        Status=@p_Status and 
        Purpose=@p_Purpose

    set @p_Output = ''

    if @exists = 1
        set @p_Output = 'Exists'

    else if @exists is null
    begin
        declare @l_min int, @l_max int
        set @l_min = case when @p_MD < 10 then 0 else (@p_MD*100000) end
        set @l_max = (@p_MD+1)*100000
        select top 1 @l_TID=TID from [dbo].[Orders_tb] where TID > @l_min and TID < @l_max order by TID desc
        set @l_TID = case when @l_TID is null then @l_min+1 else @l_TID+1 end

        if @p_IsNoPrice = 1
            INSERT INTO [dbo].[Orders_tb](
                TID,
                SubdivisionID,
                SectorID,
                CategoryID,
                EquipmentID,
                SellerID,
                Login,
                Article,
                Qty,
                Purpose,
                URL,
                Status,
                EditedBy,
                MD,
                RowSpan,
                RD
            ) VALUES (
                @l_TID,
                @l_SubdivisionID,
                @l_SectorID,
                @l_CategoryID,
                @l_EquipmentID,
                @l_SellerID,
                @p_Login,
                @p_Article,
                @p_Qty,
                @p_Purpose,
                @p_URL,
                0,
                @p_EditedBy,
                @p_MD,
                @p_RowSpan,
                @l_now
            )
        else
            INSERT INTO [dbo].[Orders_tb](
                TID,
                SubdivisionID,
                SectorID,
                CategoryID,
                EquipmentID,
                ConditionID,
                SellerID,
                Login,
                Article,
                Qty,
                Purpose,
                Price,
                Currency,
                Total,
                Tax,
                Account,
                URL,
                Status,
                EditedBy,
                MD,
                RowSpan,
                RD
            ) VALUES (
                @l_TID,
                @l_SubdivisionID,
                @l_SectorID,
                @l_CategoryID,
                @l_EquipmentID,
                @l_ConditionID,
                @l_SellerID,
                @p_Login,
                @p_Article,
                @p_Qty,
                @p_Purpose,
                @p_Price,
                @p_Currency,
                cast(@p_Total as money),
                cast(@p_Tax as money),
                @p_Account,
                @p_URL,
                0,
                @p_EditedBy,
                @p_MD,
                @p_RowSpan,
                @l_now
            )

        set @l_Login = @p_EditedBy

        select @l_OrderID = @l_TID

        INSERT INTO [dbo].[OrderDates_tb](
            OrderID, 
            Created
        ) VALUES (
            @l_OrderID,
            @l_now
        )

        DECLARE @param varchar(20) = 'Срок исполнения'

        if [dbo].[CHECK_IsEmpty_fn](@p_DueDate) = 0
            EXEC [dbo].[ADD_Param_sp] 1, @l_OrderID, 0, 0, @p_EditedBy, @param, @p_DueDate, @p_MD, null
        /*
        set @param = 'Заказчик'
        EXEC [dbo].[ADD_Param_sp] 1, @l_OrderID, 0, 0, @p_EditedBy, @param, @p_Login, null
        */
        set @p_Subdivision = [dbo].[GET_SplittedItem_fn](@p_Subdivision, '|', 0)
        set @p_Sector = [dbo].[GET_SplittedItem_fn](@p_Sector, '|', 0)
        set @p_Category = [dbo].[GET_SplittedItem_fn](@p_Category, '|', 0)
        set @p_Equipment = [dbo].[GET_SplittedItem_fn](@p_Equipment, '|', 0)
        set @p_Seller = [dbo].[GET_SplittedItem_fn](@p_Seller, '|', 0)
        set @p_Condition = [dbo].[GET_SplittedItem_fn](@p_Condition, '|', 0)
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@l_OrderID, @l_Login, 'НАИМЕНОВАНИЕ ТОВАРА', @p_Article),
            (@l_OrderID, @l_Login, 'Кол-во (шт)', cast(@p_Qty as varchar)),
            (@l_OrderID, @l_Login, 'Обоснование', @p_Purpose),
            (@l_OrderID, @l_Login, 'URL', @p_URL)

        if @p_Price > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Цена за единицу', cast(@p_Price as varchar))

        if len(@p_Currency) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Валюта платежа', @p_Currency)

        if @p_Total > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'СУММА', [dbo].[CONVERT_Money_fn](@p_Total))

        if len(@p_Equipment) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Описание', @p_Equipment)

        if len(@p_Condition) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Условия оплаты', @p_Condition)

        if len(@p_Seller) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'ПОСТАВЩИК', @p_Seller)

        if len(@p_Category) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Категория', @p_Category)

        if len(@p_Subdivision) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'ПОТРЕБИТЕЛЬ', @p_Subdivision)

        if len(@p_Sector) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Участок производства', @p_Sector)

        if len(@p_Account) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Номер счета', @p_Account)

        if len(@p_Login) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Заказчик', @p_Login)

        set @p_Output = 'Registered'
    end else begin
        set @l_OrderID = 0
        set @p_Output = 'Invalid' 
            + ':' + case when @l_SubdivisionID is null then 'NULL' else cast(@l_SubdivisionID as varchar) end
            + ':' + case when @l_SellerID is null then 'NULL' else cast(@l_SellerID as varchar) end
    end

    set @p_Output = @p_Output + ':' + cast(@l_OrderID as varchar)

    if @p_Mode = 0
        SELECT @l_OrderID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[REGISTER_Order_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END

GO
/****** Object:  StoredProcedure [dbo].[UPDATE_Order_sp]    Script Date: 13.03.2021 20:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[UPDATE_Order_sp] 
    @p_Mode             int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Article          varchar(500),
    @p_Qty              int,
    @p_Purpose          varchar(2000),
    @p_Price            float,
    @p_Currency         varchar(10),
    @p_Total            float,
    @p_Tax              float,
    @p_Subdivision      varchar(150),
    @p_Sector           varchar(150),
    @p_Category         varchar(50),
    @p_Equipment        varchar(2000),
    @p_Seller           varchar(2000),
    @p_Condition        varchar(50),
    @p_Account          varchar(200),
    @p_URL              varchar(200),
    @p_DueDate          varchar(10),
    @p_EditedBy         varchar(50),
    @p_IsNoPrice        int,
    @p_MD               int,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_OrderID          int,
        @l_ParamID          int,
        @l_SubdivisionID    int,
        @l_SectorID         int,
        @l_CategoryID       int,
        @l_SellerID         int,
        @l_EquipmentID      int,
        @l_ConditionID      int,
        @l_DueDate          varchar(10),
        @l_now              datetime

    DECLARE
        @c_Author           varchar(50), 
        @c_Article          varchar(500), 
        @c_Qty              int, 
        @c_Price            float, 
        @c_Currency         varchar(10), 
        @c_Total            money, 
        @c_Purpose          varchar(2000), 
        @c_Condition        varchar(50), 
        @c_Account          varchar(200), 
        @c_URL              varchar(200), 
        @c_Equipment        varchar(1000), 
        @c_Subdivision      varchar(50), 
        @c_Sector           varchar(50), 
        @c_Category         varchar(50), 
        @c_Seller           varchar(100)

    set @l_now = getdate()
    --
    --    Check Subdivision exists
    --
    exec dbo.CHECK_Subdivision_sp 1, @p_Subdivision, @l_SubdivisionID output
    --
    --    Check Sector exists
    --
    exec dbo.CHECK_Sector_sp 1, @p_Sector, @l_SectorID output
    --
    --    Check Category exists
    --
    exec dbo.CHECK_Category_sp 1, @p_Category, @p_MD, @l_CategoryID output
    --
    --    Check Equipment exists
    --
    exec dbo.CHECK_Equipment_sp 1, @l_SubdivisionID, @p_Equipment, @l_EquipmentID output
    --
    --    Check Condition exists
    --
    if @p_IsNoPrice = 0
        exec dbo.CHECK_Condition_sp 1, @p_Condition, @l_ConditionID output
    --
    --    Check Seller exists
    --
    exec dbo.CHECK_Seller_sp 1, @p_Seller, @p_MD, @l_SellerID output

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_ID

    set @p_Output = ''

    if dbo.CHECK_IsEmpty_fn(@l_SubdivisionID) = 0 and @exists = 1
    begin
        select 
            @c_Author=Author, @c_Article=Article, @c_Qty=Qty, @c_Price=Price, @c_Currency=Currency, @c_Total=Total, @c_Purpose=Purpose, 
            @c_Condition=Condition, @c_Equipment=Equipment, @c_Account=Account, @c_Subdivision=Subdivision, @c_Seller=Seller, @c_URL=URL
        from [dbo].[WEB_Orders_vw] where TID=@p_ID

        select @c_Category=Name from [dbo].[DIC_Categories_tb] where TID=(
            select top 1 CategoryID from [dbo].[WEB_Orders_vw] where TID=@p_ID)

        if @p_IsNoPrice = 1
            UPDATE [dbo].[Orders_tb] SET
                SubdivisionID=@l_SubdivisionID,
                SectorID=@l_SectorID,
                CategoryID=@l_CategoryID,
                EquipmentID=@l_EquipmentID,
                SellerID=@l_SellerID,
                Login=@p_Login,
                Article=@p_Article,
                Qty=@p_Qty,
                Purpose=@p_Purpose,
                --Account=@p_Account,
                URL=@p_URL,
                EditedBy=@p_EditedBy,
                RD=@l_now
            WHERE TID=@p_ID
        else
            UPDATE [dbo].[Orders_tb] SET
                SubdivisionID=@l_SubdivisionID,
                SectorID=@l_SectorID,
                CategoryID=@l_CategoryID,
                EquipmentID=@l_EquipmentID,
                ConditionID=@l_ConditionID,
                SellerID=@l_SellerID,
                Login=@p_Login,
                Article=@p_Article,
                Qty=@p_Qty,
                Purpose=@p_Purpose,
                --Account=@p_Account,
                URL=@p_URL,
                Price=@p_Price,
                Currency=@p_Currency,
                Total=cast(@p_Total as money),
                Tax=cast(@p_Tax as money),
                EditedBy=@p_EditedBy,
                RD=@l_now
            WHERE TID=@p_ID

        select @l_OrderID = @p_ID

        set @p_Subdivision = [dbo].[GET_SplittedItem_fn](@p_Subdivision, '|', 0)
        set @p_Sector = [dbo].[GET_SplittedItem_fn](@p_Sector, '|', 0)
        set @p_Category = [dbo].[GET_SplittedItem_fn](@p_Category, '|', 0)
        set @p_Equipment = [dbo].[GET_SplittedItem_fn](@p_Equipment, '|', 0)
        set @p_Seller = [dbo].[GET_SplittedItem_fn](@p_Seller, '|', 0)
        set @p_Condition = [dbo].[GET_SplittedItem_fn](@p_Condition, '|', 0)
        --
        -- Add to Order Changes log
        --
        if [dbo].[CHECK_IsEqual_fn](@c_Article, @p_Article) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'НАИМЕНОВАНИЕ ТОВАРА', @p_Article)

        if [dbo].[CHECK_IsEqual_fn](@c_Equipment, @p_Equipment) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Описание', @p_Equipment)

        if [dbo].[CHECK_IsEqual_fn](@c_Qty, @p_Qty) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Кол-во (шт)', cast(@p_Qty as varchar))

        if [dbo].[CHECK_IsEqual_fn](@c_Purpose, @p_Purpose) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Обоснование', @p_Purpose)

        if [dbo].[CHECK_IsEqual_fn](@c_Category, @p_Category) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Категория', @p_Category)

        if [dbo].[CHECK_IsEqual_fn](@c_Subdivision, @p_Subdivision) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'ПОТРЕБИТЕЛЬ', @p_Subdivision)

        if [dbo].[CHECK_IsEqual_fn](@c_Sector, @p_Sector) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Участок производства', @p_Sector)
        /*
        if [dbo].[CHECK_IsEqual_fn](@c_Account, @p_Account) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Номер счета', @p_Account)
        */
        if [dbo].[CHECK_IsEqual_fn](@c_Author, @p_Login) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Заказчик', @p_Login)

        if [dbo].[CHECK_IsEqual_fn](@c_Seller, @p_Seller) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'ПОСТАВЩИК', @p_Seller)

        if [dbo].[CHECK_IsEqual_fn](@c_URL, @p_URL) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'URL', @p_URL)

        if @p_IsNoPrice = 0 begin
            if [dbo].[CHECK_IsEqual_fn](@c_Price, @p_Price) = 0
                INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                    (@l_OrderID, @p_EditedBy, 'Цена за единицу', cast(@p_Price as varchar))

            if [dbo].[CHECK_IsEqual_fn](@c_Currency, @p_Currency) = 0
                INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                    (@l_OrderID, @p_EditedBy, 'Валюта платежа', @p_Currency)

            if [dbo].[CHECK_IsEqual_fn](@c_Total, @p_Total) = 0
                INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                    (@l_OrderID, @p_EditedBy, 'СУММА', [dbo].[CONVERT_Money_fn](@p_Total))

            if [dbo].[CHECK_IsEqual_fn](@c_Condition, @p_Condition) = 0
                INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                    (@l_OrderID, @p_EditedBy, 'Условия оплаты', @p_Condition)
        end

        DECLARE @param varchar(20) = 'Срок исполнения'

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
            + ':' + case when @l_SellerID is null then 'NULL' else cast(@l_SellerID as varchar) end
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

insert into [ProvisionDB].[dbo].[DIC_Sectors_tb] (Name) values
('- не задано -'),
('Производство. Намотка антенны'),
('Производство. Магнитоукладка'),
('Производство. Кашировка'),
('Производство. Ламинатор'),
('Производство. Рубка'),
('Производство. Офсетная печать'),
('Производство. СТП'),
('Производство. Цифровая печать'),
('Производство. Шелкотрафаретная печать'),
('Производство. Склад'),
('Производство. Участок горячего тиснения'),
('Производство. Имплантация'),
('Производство. Ламинация чипов'),
('Производство. Кодировка чипов'),
('Производство. ОТК'),
('Производство. Офис'),
('Производство. Шредерная'),
('Персонализация. Раскладка'),
('Персонализация. Склад'),
('Персонализация. Офис'),
('Персонализация. Серверная'),
('Персонализация. ПИН-принтерная'),
('Персонализация. Выпуск карт'),
('Персонализация. Печать листовок'),
('Персонализация. ОТК-2'),
('Розан Даймонд. Сборка'),
('Розан Даймонд. Склад'),
('Розан Даймонд. Шлифовка'),
('Розан Даймонд. Камнерезка'),
('Розан Даймонд. Фрезеровка'),
('Розан Даймонд. Гравировка'),
('Розан Даймонд. Покраска карт'), 
('Розан Даймонд. Ламинация изделий')

GO
