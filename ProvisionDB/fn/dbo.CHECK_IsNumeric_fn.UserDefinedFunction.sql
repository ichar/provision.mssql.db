USE [ProvisionDB]
GO
/****** Object:  UserDefinedFunction [dbo].[CHECK_IsNumeric_fn]    Script Date: 06.08.2020 0:21:43 ******/
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
