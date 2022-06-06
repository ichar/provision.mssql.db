USE [ProvisionDB]
GO
/****** Object:  UserDefinedFunction [dbo].[CHECK_IsEmpty_fn]    Script Date: 01.08.2019 17:34:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CHECK EMPTY VALUE
--   0 -- source value is not empty value
--   1 -- EMPTY
--
-- x-parser, v 0.3.5, 2010-10-01, ichar
--
ALTER function [dbo].[CHECK_IsEmpty_fn](@pSource varchar(1000))
returns int
as
BEGIN
    if @pSource is NULL or LEN(@pSource) = 0
        return 1 -- 0
    if RTRIM(LTRIM(@pSource)) <> ''
        return 0
    return 1
END

GO
