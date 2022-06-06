USE [ProvisionDB]
GO
/****** Object:  UserDefinedFunction [dbo].[GET_Reviewers_fn]    Script Date: 01.08.2019 17:34:13 ******/
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
    DECLARE x CURSOR READ_ONLY FOR SELECT [Login] FROM [ProvisionDB].[dbo].[Reviewers_tb] WHERE OrderID=@p_OrderID
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
