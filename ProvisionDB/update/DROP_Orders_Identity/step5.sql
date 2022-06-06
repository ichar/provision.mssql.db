USE [ProvisionDB]
GO
ALTER TABLE [dbo].[Comments_tb]  WITH CHECK ADD  CONSTRAINT [FK_Comments_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Items_tb]  WITH CHECK ADD  CONSTRAINT [FK_Items_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[OrderChanges_tb]  WITH CHECK ADD  CONSTRAINT [FK_OrderChanges_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[OrderDates_tb]  WITH CHECK ADD  CONSTRAINT [FK_OrderDates_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[OrderDocuments_tb]  WITH CHECK ADD  CONSTRAINT [FK_OrderDocuments_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Params_tb]  WITH CHECK ADD  CONSTRAINT [FK_Params_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[PaymentChanges_tb]  WITH CHECK ADD  CONSTRAINT [FK_PaymentChanges_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Payments_tb]  WITH CHECK ADD  CONSTRAINT [FK_Payments_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Reviewers_tb]  WITH CHECK ADD  CONSTRAINT [FK_Reviewers_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Reviews_tb]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Unreads_tb]  WITH CHECK ADD  CONSTRAINT [FK_Unreads_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO

ALTER TABLE [dbo].[Comments_tb] CHECK CONSTRAINT [FK_Comments_CommentID]
GO
ALTER TABLE [dbo].[Items_tb] CHECK CONSTRAINT [FK_Items_OrderID]
GO
ALTER TABLE [dbo].[OrderChanges_tb] CHECK CONSTRAINT [FK_OrderChanges_OrderID]
GO
ALTER TABLE [dbo].[OrderDates_tb] CHECK CONSTRAINT [FK_OrderDates_OrderID]
GO
ALTER TABLE [dbo].[OrderDocuments_tb] CHECK CONSTRAINT [FK_OrderDocuments_OrderID]
GO
ALTER TABLE [dbo].[Params_tb] CHECK CONSTRAINT [FK_Params_OrderID]
GO
ALTER TABLE [dbo].[PaymentChanges_tb] CHECK CONSTRAINT [FK_PaymentChanges_OrderID]
GO
ALTER TABLE [dbo].[Payments_tb] CHECK CONSTRAINT [FK_Payments_OrderID]
GO
ALTER TABLE [dbo].[Reviewers_tb] CHECK CONSTRAINT [FK_Reviewers_OrderID]
GO
ALTER TABLE [dbo].[Reviews_tb] CHECK CONSTRAINT [FK_Reviews_OrderID]
GO
ALTER TABLE [dbo].[Unreads_tb] CHECK CONSTRAINT [FK_Unreads_OrderID]
GO
