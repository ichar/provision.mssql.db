USE [SaleDB]
GO
/****** Object:  Table [dbo].[PaymentChanges_tb]    Script Date: 29.01.2022 8:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentChanges_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Status] [int] NULL,
	[RD] [datetime] NULL,
 CONSTRAINT [PK_PaymentChanges_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [WX_PaymentChanges_OrderID]    Script Date: 29.01.2022 8:08:48 ******/
CREATE NONCLUSTERED INDEX [WX_PaymentChanges_OrderID] ON [dbo].[PaymentChanges_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_PaymentChanges_PaymentID]    Script Date: 29.01.2022 8:08:48 ******/
CREATE NONCLUSTERED INDEX [WX_PaymentChanges_PaymentID] ON [dbo].[PaymentChanges_tb]
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PaymentChanges_tb] ADD  CONSTRAINT [DF_PaymentChanges_RD]  DEFAULT (getdate()) FOR [RD]
GO
ALTER TABLE [dbo].[PaymentChanges_tb]  WITH CHECK ADD  CONSTRAINT [FK_PaymentChanges_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[PaymentChanges_tb] CHECK CONSTRAINT [FK_PaymentChanges_OrderID]
GO
ALTER TABLE [dbo].[PaymentChanges_tb]  WITH CHECK ADD  CONSTRAINT [FK_PaymentChanges_PaymentID] FOREIGN KEY([PaymentID])
REFERENCES [dbo].[Payments_tb] ([TID])
GO
ALTER TABLE [dbo].[PaymentChanges_tb] CHECK CONSTRAINT [FK_PaymentChanges_PaymentID]
GO
