USE [PurchaseDB]
GO
/****** Object:  Table [dbo].[Items_tb]    Script Date: 29.01.2022 8:11:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Login] [varchar](50) NULL,
	[Name] [varchar](250) NULL,
	[Qty] [int] NULL,
	[Units] [varchar](20) NULL,
	[Total] [money] NULL,
	[Tax] [money] NULL,
	[RD] [datetime] NULL,
	[Account] [varchar](100) NULL,
	[Currency] [varchar](10) NULL,
	[VendorID] [int] NULL,
 CONSTRAINT [PK_Items_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [WX_Items_OrderID]    Script Date: 29.01.2022 8:11:56 ******/
CREATE NONCLUSTERED INDEX [WX_Items_OrderID] ON [dbo].[Items_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Items_tb]  WITH CHECK ADD  CONSTRAINT [FK_Items_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Items_tb] CHECK CONSTRAINT [FK_Items_OrderID]
GO
