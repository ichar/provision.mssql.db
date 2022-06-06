USE [ProvisionDB]
GO
/****** Object:  UserDefinedFunction [dbo].[CHECK_IsInReviewers_fn]    Script Date: 06.08.2020 0:21:43 ******/
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
    select @x=1 from [ProvisionDB].[dbo].[Reviewers_tb] where OrderID=@p_OrderID and Login=@p_Login
    return @x
END

GO
