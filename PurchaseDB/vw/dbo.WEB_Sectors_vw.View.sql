USE [PurchaseDB]
GO
/****** Object:  View [dbo].[WEB_Sectors_vw]    Script Date: 29.01.2022 8:11:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_Sectors_vw]
AS
SELECT        TID, Name, Code, Manager, Name + ' (' + Manager + ')' AS FullName
FROM            dbo.DIC_Sectors_tb AS s



GO
