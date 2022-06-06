USE [ProvisionDB]
GO

--SELECT * FROM [ProvisionDB].[dbo].[Orders_tb] order by TID desc
--SELECT TID,Article,StockListID FROM [ProvisionDB].[dbo].[Orders_tb] where StockListID is not null order by TID desc

ALTER TABLE [dbo].[Orders_tb] DROP CONSTRAINT [FK_Orders_StockListID]
GO
/****** Object:  Index [WX_Orders_StockListID]    Script Date: 06.08.2020 13:57:47 ******/
DROP INDEX [WX_Orders_StockListID] ON [dbo].[Orders_tb]
GO

--SELECT * FROM [ProvisionDB].[dbo].[DIC_StockList_tb] order by TID
--SELECT TID, Name, NodeLevel, NodeCode as _____________________________________, Children, EditedBy FROM [ProvisionDB].[dbo].[DIC_StockList_tb] order by NodeCode
