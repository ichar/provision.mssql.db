USE [ProvisionDB]
GO
/****** Object:  UserDefinedFunction [dbo].[DATE_GetDateTime_fn]    Script Date: 06.08.2020 0:21:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- RETURNS CURRENT DATETIME WITH SPECIAL FORMATING
--
-- x-parser, v 0.3.5, 2010-10-01, ichar
--
CREATE function [dbo].[DATE_GetDateTime_fn](@datevalue datetime, @datetype varchar(10))
returns varchar(10)
as
BEGIN
    DECLARE @s varchar(50), @y char(2), @yy char(4), @m char(2), @d char(2), @mode varchar(10)
    set @s  = convert( varchar, cast(@datevalue as datetime), 121 )
    set @y  = substring(@s, 3, 2)
    set @yy = substring(@s, 1, 4)
    set @m  = substring(@s, 6, 2)
    set @d  = substring(@s, 9, 2)

    set @mode = lower(@datetype)

    if @mode = 'yymmdd' return @y+@m+@d
    if @mode = 'yyyymmdd' return @yy+@m+@d
    if @mode = 'ddmmyy' return @d+@m+@y
    if @mode = 'ddmmyyyy' return @d+@m+@yy
    if @mode = 'mm/yy' return @m+'/'+@y
    if @mode = 'mm/yyyy' return @m+'/'+@yy
    if @mode = 'dd/mm/yy' return @d+'/'+@m+'/'+@y
    if @mode = 'dd/mm/yyyy' return @d+'/'+@m+'/'+@yy
    if @mode = 'dd.mm.yy' return @d+'.'+@m+'.'+@y
    if @mode = 'dd.mm.yyyy' return @d+'.'+@m+'.'+@yy
    return @s
END

GO
