USE [ProvisionDB]
GO
/****** Object:  StoredProcedure [dbo].[DEL_Link_sp]    Script Date: 15.03.2021 10:28:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEL_Link_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DEL_Link_sp]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Link_sp]    Script Date: 15.03.2021 10:28:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADD_Link_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ADD_Link_sp]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderLinks_OrderID]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderLinks_tb]'))
ALTER TABLE [dbo].[OrderLinks_tb] DROP CONSTRAINT [FK_OrderLinks_OrderID]
GO
/****** Object:  View [dbo].[WEB_OrderLinks_vw]    Script Date: 15.03.2021 10:28:24 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_OrderLinks_vw]'))
DROP VIEW [dbo].[WEB_OrderLinks_vw]
GO
/****** Object:  View [dbo].[WEB_Links_vw]    Script Date: 15.03.2021 10:28:24 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Links_vw]'))
DROP VIEW [dbo].[WEB_Links_vw]
GO
/****** Object:  Table [dbo].[OrderLinks_tb]    Script Date: 15.03.2021 10:28:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderLinks_tb]') AND type in (N'U'))
DROP TABLE [dbo].[OrderLinks_tb]
GO
/****** Object:  Table [dbo].[DIC_Links_tb]    Script Date: 15.03.2021 10:28:24 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DIC_Links_tb]') AND type in (N'U'))
DROP TABLE [dbo].[DIC_Links_tb]
GO
