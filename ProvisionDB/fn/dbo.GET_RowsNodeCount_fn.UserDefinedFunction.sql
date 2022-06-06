USE [ProvisionDB]
GO
/****** Object:  UserDefinedFunction [dbo].[GET_RowsNodeCount_fn]    Script Date: 06.08.2020 0:21:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
CREATE function [dbo].[GET_RowsNodeCount_fn](@pCode varchar(100))
returns int
as
BEGIN
    DECLARE 
        @rows int = 0
    select 
        @rows=count(*) from [dbo].[DIC_StockList_tb] where NodeCode like @pCode+'.%'
    return @rows
END

GO
