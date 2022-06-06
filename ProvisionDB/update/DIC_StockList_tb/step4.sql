USE [ProvisionDB]
GO

/****** Object:  Index [WX_Orders_StockListID]    Script Date: 06.08.2020 13:57:48 ******/
CREATE NONCLUSTERED INDEX [WX_Orders_StockListID] ON [dbo].[Orders_tb]
(
	[StockListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_StockListID] FOREIGN KEY([StockListID])
REFERENCES [dbo].[DIC_StockList_tb] ([TID])
GO
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_StockListID]
GO

