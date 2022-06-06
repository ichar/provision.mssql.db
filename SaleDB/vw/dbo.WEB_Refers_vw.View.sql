USE [SaleDB]
GO
/****** Object:  View [dbo].[WEB_Refers_vw]    Script Date: 29.01.2022 8:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_Refers_vw]
AS
SELECT        TID, Name, MD
FROM            dbo.DIC_Refers_tb AS s


GO
