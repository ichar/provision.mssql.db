USE [ProvisionDB]
GO
/****** Object:  UserDefinedFunction [dbo].[CONVERT_Money_fn]    Script Date: 06.08.2020 0:21:43 ******/
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
