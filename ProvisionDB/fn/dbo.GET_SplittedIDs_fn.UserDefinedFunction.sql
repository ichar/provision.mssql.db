USE [ProvisionDB]
GO
/****** Object:  UserDefinedFunction [dbo].[GET_SplittedIDs_fn]    Script Date: 06.08.2020 0:21:43 ******/
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
