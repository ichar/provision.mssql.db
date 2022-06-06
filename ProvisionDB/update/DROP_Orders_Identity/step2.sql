USE [ProvisionDB]
GO
/****** Object:  Table [dbo].[OrdersNew_tb]    Script Date: 10/26/2020 05:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrdersNew_tb](
	[TID] [int] NOT NULL UNIQUE,
	[SubdivisionID] [int] NULL,
	[EquipmentID] [int] NULL,
	[ConditionID] [int] NULL,
	[CategoryID] [int] NULL,
	[SellerID] [int] NULL,
	[StockListID] [int] NULL,
	[Login] [varchar](50) NULL,
	[Article] [varchar](500) NULL,
	[Qty] [int] NULL,
	[Purpose] [varchar](2000) NULL,
	[Price] [float] NULL,
	[Currency] [varchar](10) NULL,
	[Total] [money] NULL,
	[Tax] [money] NULL,
	[Status] [int] NULL,
	[Account] [varchar](500) NULL,
	[URL] [varchar](200) NULL,
	[EditedBy] [varchar](50) NULL,
	[RowSpan] [int] NULL,
	[MD] [int] NULL,
	[RD] [datetime] NULL,
 CONSTRAINT [PK_OrdersNew_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
