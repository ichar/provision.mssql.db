USE [ProvisionDB]
GO
/****** Object:  UserDefinedFunction [dbo].[Strip_fn]    Script Date: 06.08.2020 0:21:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  FUNCTION [dbo].[Strip_fn](@v varchar(max))
returns varchar(max)
as
begin
  return LTRIM(RTRIM(ISNULL(@v, '')))
end
GO
