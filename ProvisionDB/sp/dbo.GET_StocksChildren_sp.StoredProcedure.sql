USE [ProvisionDB]
GO
/****** Object:  StoredProcedure [dbo].[GET_StocksChildren_sp]    Script Date: 12/06/2020 04:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================
-- GET STOCK LIST WITH ORDERS COUNT
-- ================================

CREATE PROCEDURE [dbo].[GET_StocksChildren_sp] 
    @p_MD  int
AS
BEGIN
    SET NOCOUNT ON

    SELECT 
        s.TID, 
        s.Name, 
        --s.Title, 
        s.ShortName,
        s.NodeLevel,
        s.NodeCode,
        --s.RefCode1C,
        --s.Comment,
        --s.EditedBy, 
        --s.RD,
        s.Children,
        (select count(*) from [dbo].Orders_tb o where o.StockListID in (
            select TID from [dbo].DIC_StockList_tb where NodeCode like s.NodeCode+'%'
            )
            and o.MD=@p_MD
        ) as Orders
    FROM
        [dbo].DIC_StockList_tb AS s
    ORDER BY NodeCode

END
GO
