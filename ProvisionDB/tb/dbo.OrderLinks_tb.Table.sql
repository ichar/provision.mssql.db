USE [ProvisionDB]
GO
/****** Object:  Table [dbo].[OrderLinks_tb]    Script Date: 12.03.2021 17:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLinks_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[LinkID] [int] NOT NULL,
	[OrderLinkID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Note] [varchar](1000) NULL,
	[RD] [datetime] NULL,
 CONSTRAINT [PK_OrderLinks_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [WX_OrderLinks_LinkID]    Script Date: 12.03.2021 17:15:24 ******/
CREATE NONCLUSTERED INDEX [WX_OrderLinks_LinkID] ON [dbo].[OrderLinks_tb]
(
	[LinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_OrderLinks_OrderID]    Script Date: 12.03.2021 17:15:24 ******/
CREATE NONCLUSTERED INDEX [WX_OrderLinks_OrderID] ON [dbo].[OrderLinks_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderLinks_tb] ADD  CONSTRAINT [DF_OrderLinks_RD]  DEFAULT (getdate()) FOR [RD]
GO
ALTER TABLE [dbo].[OrderLinks_tb]  WITH CHECK ADD  CONSTRAINT [FK_OrderLinks_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[OrderLinks_tb] CHECK CONSTRAINT [FK_OrderLinks_OrderID]
GO
