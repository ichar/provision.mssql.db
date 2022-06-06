/*
Missing Index Details from SQLQuery2.sql - localhost.master (sa (61))
The Query Processor estimates that implementing the following index could improve the query cost by 12.2801%.
*/


USE [ProvisionDB]
GO
CREATE NONCLUSTERED INDEX IX_DIC_Comments_Name
ON [dbo].[DIC_Comments_tb] ([Name])
GO
CREATE NONCLUSTERED INDEX IX_DIC_Conditions_Name
ON [dbo].[DIC_Conditions_tb] ([Name])
GO
CREATE NONCLUSTERED INDEX IX_DIC_Equipments_Title
ON [dbo].[DIC_Equipments_tb] ([Title])
GO
CREATE NONCLUSTERED INDEX IX_DIC_Params_Name
ON [dbo].[DIC_Params_tb] ([Name])
GO
CREATE NONCLUSTERED INDEX IX_DIC_Payments_Name
ON [dbo].[DIC_Payments_tb] ([Name])
GO
CREATE NONCLUSTERED INDEX IX_DIC_Sellers_Name
ON [dbo].[DIC_Sellers_tb] ([Name])
GO
CREATE NONCLUSTERED INDEX IX_DIC_Subdivisions_Name
ON [dbo].[DIC_Subdivisions_tb] ([Name])

GO
CREATE NONCLUSTERED INDEX WX_Orders_SubdivisionID
ON [dbo].[Orders_tb] ([SubdivisionID])
GO
CREATE NONCLUSTERED INDEX WX_Orders_EquipmentID
ON [dbo].[Orders_tb] ([EquipmentID])
GO
CREATE NONCLUSTERED INDEX WX_Orders_ConditionID
ON [dbo].[Orders_tb] ([ConditionID])
GO
CREATE NONCLUSTERED INDEX WX_Orders_SellerID
ON [dbo].[Orders_tb] ([SellerID])
GO
CREATE NONCLUSTERED INDEX IX_Orders_Login
ON [dbo].[Orders_tb] ([Login])
GO
CREATE NONCLUSTERED INDEX IX_Orders_Article
ON [dbo].[Orders_tb] ([Article])

GO
CREATE NONCLUSTERED INDEX WX_Comments_OrderID
ON [dbo].[Comments_tb] ([OrderID])
GO
CREATE NONCLUSTERED INDEX WX_Comments_CommentID
ON [dbo].[Comments_tb] ([CommentID])

GO
CREATE NONCLUSTERED INDEX WX_Items_OrderID
ON [dbo].[Items_tb] ([OrderID])

GO
CREATE NONCLUSTERED INDEX WX_Params_OrderID
ON [dbo].[Params_tb] ([OrderID])
GO
CREATE NONCLUSTERED INDEX WX_Params_ParamID
ON [dbo].[Params_tb] ([ParamID])

GO
CREATE NONCLUSTERED INDEX WX_Payments_OrderID
ON [dbo].[Payments_tb] ([OrderID])
GO
CREATE NONCLUSTERED INDEX WX_Payments_PaymentID
ON [dbo].[Payments_tb] ([PaymentID])

GO
CREATE NONCLUSTERED INDEX WX_Reviews_OrderID
ON [dbo].[Reviews_tb] ([OrderID])

GO
CREATE NONCLUSTERED INDEX WX_OrderDates_OrderID
ON [dbo].[OrderDates_tb] ([OrderID])

GO
CREATE NONCLUSTERED INDEX WX_OrderChanges_OrderID
ON [dbo].[OrderChanges_tb] ([OrderID])

GO
