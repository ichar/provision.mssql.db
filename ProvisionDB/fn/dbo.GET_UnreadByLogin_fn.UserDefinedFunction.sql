USE [ProvisionDB]
GO
/****** Object:  UserDefinedFunction [dbo].[GET_UnreadByLogin_fn]    Script Date: 12/06/2020 04:28:12 ******/
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
