USE [PurchaseDB]
GO
/****** Object:  Table [dbo].[Unreads_tb]    Script Date: 29.01.2022 8:11:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unreads_tb](
	[OrderID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Index [WX_Unreads_OrderID]    Script Date: 29.01.2022 8:11:56 ******/
CREATE NONCLUSTERED INDEX [WX_Unreads_OrderID] ON [dbo].[Unreads_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Unreads_tb]  WITH CHECK ADD  CONSTRAINT [FK_Unreads_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Unreads_tb] CHECK CONSTRAINT [FK_Unreads_OrderID]
GO
