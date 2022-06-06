USE [SaleDB]
GO
/****** Object:  View [dbo].[WEB_OrderRefers_vw]    Script Date: 29.01.2022 8:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_OrderRefers_vw]
AS
SELECT        r.TID, r.OrderID, r.ReferID, r.OrderReferID, r.Login, p.Name AS ReferType, o.Article AS Name, o.Qty, o.Currency, o.Total, r.Note, o.RD AS RegistryDate, r.RD AS ReferDate
FROM            dbo.OrderRefers_tb AS r INNER JOIN
                         dbo.DIC_Refers_tb AS p ON p.TID = r.ReferID INNER JOIN
                         dbo.Orders_tb AS o ON o.TID = r.OrderReferID


GO
