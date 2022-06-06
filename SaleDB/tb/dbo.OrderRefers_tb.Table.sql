USE [SaleDB]
GO
/****** Object:  Table [dbo].[OrderRefers_tb]    Script Date: 29.01.2022 8:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderRefers_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ReferID] [int] NOT NULL,
	[OrderReferID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Note] [varchar](1000) NULL,
	[RD] [datetime] NULL,
 CONSTRAINT [PK_OrderRefers_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [WX_OrderRefers_OrderID]    Script Date: 29.01.2022 8:08:48 ******/
CREATE NONCLUSTERED INDEX [WX_OrderRefers_OrderID] ON [dbo].[OrderRefers_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_OrderRefers_ReferID]    Script Date: 29.01.2022 8:08:48 ******/
CREATE NONCLUSTERED INDEX [WX_OrderRefers_ReferID] ON [dbo].[OrderRefers_tb]
(
	[ReferID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderRefers_tb] ADD  CONSTRAINT [DF_OrderRefers_RD]  DEFAULT (getdate()) FOR [RD]
GO
ALTER TABLE [dbo].[OrderRefers_tb]  WITH CHECK ADD  CONSTRAINT [FK_OrderRefers_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[OrderRefers_tb] CHECK CONSTRAINT [FK_OrderRefers_OrderID]
GO
