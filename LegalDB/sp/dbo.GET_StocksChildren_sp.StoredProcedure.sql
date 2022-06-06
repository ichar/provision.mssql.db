USE [LegalDB]
GO
/****** Object:  StoredProcedure [dbo].[GET_StocksChildren_sp]    Script Date: 27.01.2022 12:52:55 ******/
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
            select TID from [ProvisionDB].[dbo].DIC_StockList_tb where NodeCode like s.NodeCode+'%'
            )
            and o.MD=@p_MD
        ) as Orders
    FROM
        [ProvisionDB].[dbo].DIC_StockList_tb AS s
    ORDER BY NodeCode

END

GO
