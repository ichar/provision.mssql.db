USE [ProvisionDB]
GO
/****** Object:  UserDefinedFunction [dbo].[CHECK_IsEqual_fn]    Script Date: 01.08.2019 17:34:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CHECK EQUAL STRING VALUE
--   0 -- source value is not equal value
--   1 -- EQUAL
--
-- v 0.0.1, 2021-03-12, ichar
--
ALTER function [dbo].[CHECK_IsEqual_fn](@s1 varchar(2000), @s2 varchar(2000))
returns int
as
BEGIN
    if @s1 is NULL and @s2 is NULL
        return 1
    if RTRIM(LTRIM(ISNULL(@s1, ''))) != RTRIM(LTRIM(ISNULL(@s2, '')))
        return 0
    return 1
END

GO
