USE [ProvisionDB]
GO
/****** Object:  UserDefinedFunction [dbo].[GET_SplittedItem_fn]    Script Date: 06.08.2020 0:21:43 ******/
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
