USE [ProvisionDB]
GO
/****** Object:  UserDefinedFunction [dbo].[GET_ReviewStatuses_fn]    Script Date: 06.08.2020 0:21:43 ******/
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
