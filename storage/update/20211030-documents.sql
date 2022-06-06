USE [storage]
GO

alter table [dbo].[OrderDocuments_tb] add [MD] [int] NULL
GO
update [dbo].[OrderDocuments_tb] set [MD]=0
GO

/****** Object:  View [dbo].[WEB_OrderDocuments_vw]    Script Date: 31.10.2021 15:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[WEB_OrderDocuments_vw]
AS
SELECT        TID, UID, OrderID, Login, FileName, FileSize, ContentType, CASE WHEN d .Image IS NULL THEN 0 ELSE 1 END AS IsExist, Note, ForAudit, RD, MD
FROM            dbo.OrderDocuments_tb AS d

GO
