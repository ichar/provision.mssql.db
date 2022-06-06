USE [ProvisionDB]
GO
/****** Object:  ForeignKey [FK_Comments_OrderID]    Script Date: 10/26/2020 05:35:23 ******/
ALTER TABLE [dbo].[Comments_tb] DROP CONSTRAINT [FK_Comments_OrderID]
GO
/****** Object:  ForeignKey [FK_Items_OrderID]    Script Date: 10/26/2020 05:35:24 ******/
ALTER TABLE [dbo].[Items_tb] DROP CONSTRAINT [FK_Items_OrderID]
GO
/****** Object:  ForeignKey [FK_OrderChanges_OrderID]    Script Date: 10/26/2020 05:35:24 ******/
ALTER TABLE [dbo].[OrderChanges_tb] DROP CONSTRAINT [FK_OrderChanges_OrderID]
GO
/****** Object:  ForeignKey [FK_OrderDates_OrderID]    Script Date: 10/26/2020 05:35:24 ******/
ALTER TABLE [dbo].[OrderDates_tb] DROP CONSTRAINT [FK_OrderDates_OrderID]
GO
/****** Object:  ForeignKey [FK_OrderDocuments_OrderID]    Script Date: 10/26/2020 05:35:24 ******/
ALTER TABLE [dbo].[OrderDocuments_tb] DROP CONSTRAINT [FK_OrderDocuments_OrderID]
GO
/****** Object:  ForeignKey [FK_Params_OrderID]    Script Date: 10/26/2020 05:35:24 ******/
ALTER TABLE [dbo].[Params_tb] DROP CONSTRAINT [FK_Params_OrderID]
GO
/****** Object:  ForeignKey [FK_PaymentChanges_OrderID]    Script Date: 10/26/2020 05:35:24 ******/
ALTER TABLE [dbo].[PaymentChanges_tb] DROP CONSTRAINT [FK_PaymentChanges_OrderID]
GO
/****** Object:  ForeignKey [FK_Payments_OrderID]    Script Date: 10/26/2020 05:35:24 ******/
ALTER TABLE [dbo].[Payments_tb] DROP CONSTRAINT [FK_Payments_OrderID]
GO
/****** Object:  ForeignKey [FK_Reviewers_OrderID]    Script Date: 10/26/2020 05:35:25 ******/
ALTER TABLE [dbo].[Reviewers_tb] DROP CONSTRAINT [FK_Reviewers_OrderID]
GO
/****** Object:  ForeignKey [FK_Reviews_OrderID]    Script Date: 10/26/2020 05:35:25 ******/
ALTER TABLE [dbo].[Reviews_tb] DROP CONSTRAINT [FK_Reviews_OrderID]
GO
/****** Object:  ForeignKey [FK_Unreads_OrderID]    Script Date: 10/26/2020 05:35:25 ******/
ALTER TABLE [dbo].[Unreads_tb] DROP CONSTRAINT [FK_Unreads_OrderID]
GO
