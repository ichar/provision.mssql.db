USE [LegalDB]
GO
/****** Object:  Table [dbo].[Orders_tb]    Script Date: 25.09.2021 7:51:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
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
	[SectorID] [int] NULL,
 CONSTRAINT [PK_Orders_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Orders_tb] ADD  CONSTRAINT [DF_Orders_Qty]  DEFAULT ((0)) FOR [Qty]
GO
ALTER TABLE [dbo].[Orders_tb] ADD  CONSTRAINT [DF_Orders_RD]  DEFAULT (getdate()) FOR [RD]
GO
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[DIC_Categories_tb] ([TID])
GO
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_CategoryID]
GO
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_ConditionID] FOREIGN KEY([ConditionID])
REFERENCES [dbo].[DIC_Conditions_tb] ([TID])
GO
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_ConditionID]
GO
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_EquipmentID] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[DIC_Equipments_tb] ([TID])
GO
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_EquipmentID]
GO
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_SellerID] FOREIGN KEY([SellerID])
REFERENCES [dbo].[DIC_Sellers_tb] ([TID])
GO
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_SellerID]
GO
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_StockListID] FOREIGN KEY([StockListID])
REFERENCES [dbo].[DIC_StockList_tb] ([TID])
GO
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_StockListID]
GO
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_SubdivisionID] FOREIGN KEY([SubdivisionID])
REFERENCES [dbo].[DIC_Subdivisions_tb] ([TID])
GO
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_SubdivisionID]
GO
