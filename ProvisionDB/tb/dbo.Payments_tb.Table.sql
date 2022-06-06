USE [ProvisionDB]
GO
/****** Object:  Table [dbo].[Payments_tb]    Script Date: 31.03.2022 14:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[PaymentID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[Total] [money] NULL,
	[Tax] [money] NULL,
	[Status] [int] NULL,
	[RD] [datetime] NULL,
	[Currency] [varchar](10) NULL,
	[Rate] [float] NULL,
	[Comment] [varchar](1000) NULL,
	[ExchangeRate] [float] NULL,
 CONSTRAINT [PK_Payments_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [WX_Payments_OrderID]    Script Date: 31.03.2022 14:27:54 ******/
CREATE NONCLUSTERED INDEX [WX_Payments_OrderID] ON [dbo].[Payments_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Payments_PaymentID]    Script Date: 31.03.2022 14:27:54 ******/
CREATE NONCLUSTERED INDEX [WX_Payments_PaymentID] ON [dbo].[Payments_tb]
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Payments_tb] ADD  CONSTRAINT [DF_Payments_RD]  DEFAULT (getdate()) FOR [RD]
GO
ALTER TABLE [dbo].[Payments_tb]  WITH CHECK ADD  CONSTRAINT [FK_Payments_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Payments_tb] CHECK CONSTRAINT [FK_Payments_OrderID]
GO
ALTER TABLE [dbo].[Payments_tb]  WITH CHECK ADD  CONSTRAINT [FK_Payments_PaymentID] FOREIGN KEY([PaymentID])
REFERENCES [dbo].[DIC_Payments_tb] ([TID])
GO
ALTER TABLE [dbo].[Payments_tb] CHECK CONSTRAINT [FK_Payments_PaymentID]
GO
