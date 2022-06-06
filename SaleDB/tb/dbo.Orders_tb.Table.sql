USE [SaleDB]
GO
/****** Object:  Table [dbo].[Orders_tb]    Script Date: 29.01.2022 8:08:48 ******/
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
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Orders_Article]    Script Date: 29.01.2022 8:08:48 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_Article] ON [dbo].[Orders_tb]
(
	[Article] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Orders_Login]    Script Date: 29.01.2022 8:08:48 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_Login] ON [dbo].[Orders_tb]
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_MD]    Script Date: 29.01.2022 8:08:48 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_MD] ON [dbo].[Orders_tb]
(
	[MD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Orders_CategoryID]    Script Date: 29.01.2022 8:08:48 ******/
CREATE NONCLUSTERED INDEX [WX_Orders_CategoryID] ON [dbo].[Orders_tb]
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Orders_ConditionID]    Script Date: 29.01.2022 8:08:48 ******/
CREATE NONCLUSTERED INDEX [WX_Orders_ConditionID] ON [dbo].[Orders_tb]
(
	[ConditionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Orders_EquipmentID]    Script Date: 29.01.2022 8:08:48 ******/
CREATE NONCLUSTERED INDEX [WX_Orders_EquipmentID] ON [dbo].[Orders_tb]
(
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Orders_SellerID]    Script Date: 29.01.2022 8:08:48 ******/
CREATE NONCLUSTERED INDEX [WX_Orders_SellerID] ON [dbo].[Orders_tb]
(
	[SellerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Orders_StockListID]    Script Date: 29.01.2022 8:08:48 ******/
CREATE NONCLUSTERED INDEX [WX_Orders_StockListID] ON [dbo].[Orders_tb]
(
	[StockListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Orders_SubdivisionID]    Script Date: 29.01.2022 8:08:48 ******/
CREATE NONCLUSTERED INDEX [WX_Orders_SubdivisionID] ON [dbo].[Orders_tb]
(
	[SubdivisionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_SubdivisionID] FOREIGN KEY([SubdivisionID])
REFERENCES [dbo].[DIC_Subdivisions_tb] ([TID])
GO
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_SubdivisionID]
GO
/****** Object:  Trigger [dbo].[Orders_Log_Del_trg]    Script Date: 29.01.2022 8:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Orders_Log_Del_trg] on [dbo].[Orders_tb]
for delete
as
  INSERT INTO [dbo].[Orders_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [EditedBy], [RD], 'D' from deleted

GO
ALTER TABLE [dbo].[Orders_tb] ENABLE TRIGGER [Orders_Log_Del_trg]
GO
/****** Object:  Trigger [dbo].[Orders_Log_Ins_trg]    Script Date: 29.01.2022 8:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Orders_Log_Ins_trg] on [dbo].[Orders_tb]
for insert
as
  INSERT INTO [dbo].[Orders_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [EditedBy], [RD], 'I' from inserted

GO
ALTER TABLE [dbo].[Orders_tb] ENABLE TRIGGER [Orders_Log_Ins_trg]
GO
/****** Object:  Trigger [dbo].[Orders_Log_Upd_trg]    Script Date: 29.01.2022 8:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Orders_Log_Upd_trg] on [dbo].[Orders_tb]
for update
as
  INSERT INTO [dbo].[Orders_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [EditedBy], [RD], 'U' from inserted

GO
ALTER TABLE [dbo].[Orders_tb] ENABLE TRIGGER [Orders_Log_Upd_trg]
GO
