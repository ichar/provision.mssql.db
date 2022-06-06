USE [ProvisionDB]
GO
/****** Object:  UserDefinedFunction [dbo].[GET_SplittedStrings_fn]    Script Date: 12/06/2020 04:28:12 ******/
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
