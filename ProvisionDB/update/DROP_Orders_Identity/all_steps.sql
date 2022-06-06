USE [ProvisionDB]
GO
/****** Object:  ForeignKey [FK_Comments_OrderID]    Script Date: 10/26/2020 05:35:23 ******/
ALTER TABLE [dbo].[Comments_tb] DROP CONSTRAINT [FK_Comments_OrderID]
GO
/****** Object:  ForeignKey [FK_Items_OrderID]    Script Date: 10/26/2020 05:35:24 ******/
ALTER TABLE [dbo].[Items_tb] DROP CONSTRAINT [FK_Items_OrderID]
GO
/****** Object:  ForeignKey [FK_OrderChanges_OrderID]    Script Date: 10/26/2020 05:35:24 ******/
ALTER TABLE [dbo].[OrderChanges_tb] DROP CONSTRAINT [FK_OrderChanges_OrderID]
GO
/****** Object:  ForeignKey [FK_OrderDates_OrderID]    Script Date: 10/26/2020 05:35:24 ******/
ALTER TABLE [dbo].[OrderDates_tb] DROP CONSTRAINT [FK_OrderDates_OrderID]
GO
/****** Object:  ForeignKey [FK_OrderDocuments_OrderID]    Script Date: 10/26/2020 05:35:24 ******/
ALTER TABLE [dbo].[OrderDocuments_tb] DROP CONSTRAINT [FK_OrderDocuments_OrderID]
GO
/****** Object:  ForeignKey [FK_Params_OrderID]    Script Date: 10/26/2020 05:35:24 ******/
ALTER TABLE [dbo].[Params_tb] DROP CONSTRAINT [FK_Params_OrderID]
GO
/****** Object:  ForeignKey [FK_PaymentChanges_OrderID]    Script Date: 10/26/2020 05:35:24 ******/
ALTER TABLE [dbo].[PaymentChanges_tb] DROP CONSTRAINT [FK_PaymentChanges_OrderID]
GO
/****** Object:  ForeignKey [FK_Payments_OrderID]    Script Date: 10/26/2020 05:35:24 ******/
ALTER TABLE [dbo].[Payments_tb] DROP CONSTRAINT [FK_Payments_OrderID]
GO
/****** Object:  ForeignKey [FK_Reviewers_OrderID]    Script Date: 10/26/2020 05:35:25 ******/
ALTER TABLE [dbo].[Reviewers_tb] DROP CONSTRAINT [FK_Reviewers_OrderID]
GO
/****** Object:  ForeignKey [FK_Reviews_OrderID]    Script Date: 10/26/2020 05:35:25 ******/
ALTER TABLE [dbo].[Reviews_tb] DROP CONSTRAINT [FK_Reviews_OrderID]
GO
/****** Object:  ForeignKey [FK_Unreads_OrderID]    Script Date: 10/26/2020 05:35:25 ******/
ALTER TABLE [dbo].[Unreads_tb] DROP CONSTRAINT [FK_Unreads_OrderID]
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

/****** Object:  Table [dbo].[OrdersNew_tb]    Script Date: 10/26/2020 05:41:08 ******/

--ALTER TABLE [dbo].[Orders_tb] SWITCH TO [dbo].[OrdersNew_tb];
--IF NOT EXISTS (SELECT * FROM [dbo].[Orders_tb]) DROP TABLE [dbo].[Orders_tb]

INSERT INTO [dbo].[OrdersNew_tb]
SELECT 
	[TID],
	[SubdivisionID],
	[EquipmentID],
	[ConditionID],
	[CategoryID],
	[SellerID],
	[StockListID],
	[Login],
	[Article],
	[Qty],
	[Purpose],
	[Price],
	[Currency],
	[Total],
	[Tax],
	[Status],
	[Account],
	[URL],
	[EditedBy],
	[RowSpan],
	[MD],
	[RD]
FROM [dbo].[Orders_tb] 
GO

DECLARE @rows1 int, @rows2 int

select @rows1 = count(*) from [dbo].[Orders_tb]
select @rows2 = count(*) from [dbo].[OrdersNew_tb]

IF @rows1 = @rows2 BEGIN
    DROP TABLE [dbo].[Orders_tb]
    EXEC sys.sp_rename 'OrdersNew_tb', 'Orders_tb', 'OBJECT';
    EXEC sys.sp_rename 'PK_OrdersNew_TID', 'PK_Orders_TID', 'OBJECT';
END
GO

/****** Object:  Table [dbo].[Orders_tb]    Script Date: 10/26/2020 05:41:08 ******/
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_Orders_Article] ON [dbo].[Orders_tb] 
(
	[Article] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Orders_Login] ON [dbo].[Orders_tb] 
(
	[Login] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Orders_MD] ON [dbo].[Orders_tb] 
(
	[MD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WX_Orders_CategoryID] ON [dbo].[Orders_tb] 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WX_Orders_ConditionID] ON [dbo].[Orders_tb] 
(
	[ConditionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WX_Orders_EquipmentID] ON [dbo].[Orders_tb] 
(
	[EquipmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WX_Orders_SellerID] ON [dbo].[Orders_tb] 
(
	[SellerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WX_Orders_StockListID] ON [dbo].[Orders_tb] 
(
	[StockListID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WX_Orders_SubdivisionID] ON [dbo].[Orders_tb] 
(
	[SubdivisionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
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

ALTER TABLE [dbo].[Orders_tb] ADD  CONSTRAINT [DF_Orders_Qty]  DEFAULT ((0)) FOR [Qty]
GO
ALTER TABLE [dbo].[Orders_tb] ADD  CONSTRAINT [DF_Orders_RD]  DEFAULT (getdate()) FOR [RD]
GO

ALTER TABLE [dbo].[Comments_tb]  WITH CHECK ADD  CONSTRAINT [FK_Comments_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Items_tb]  WITH CHECK ADD  CONSTRAINT [FK_Items_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[OrderChanges_tb]  WITH CHECK ADD  CONSTRAINT [FK_OrderChanges_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[OrderDates_tb]  WITH CHECK ADD  CONSTRAINT [FK_OrderDates_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[OrderDocuments_tb]  WITH CHECK ADD  CONSTRAINT [FK_OrderDocuments_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Params_tb]  WITH CHECK ADD  CONSTRAINT [FK_Params_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[PaymentChanges_tb]  WITH CHECK ADD  CONSTRAINT [FK_PaymentChanges_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Payments_tb]  WITH CHECK ADD  CONSTRAINT [FK_Payments_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Reviewers_tb]  WITH CHECK ADD  CONSTRAINT [FK_Reviewers_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Reviews_tb]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Unreads_tb]  WITH CHECK ADD  CONSTRAINT [FK_Unreads_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO

ALTER TABLE [dbo].[Comments_tb] CHECK CONSTRAINT [FK_Comments_CommentID]
GO
ALTER TABLE [dbo].[Items_tb] CHECK CONSTRAINT [FK_Items_OrderID]
GO
ALTER TABLE [dbo].[OrderChanges_tb] CHECK CONSTRAINT [FK_OrderChanges_OrderID]
GO
ALTER TABLE [dbo].[OrderDates_tb] CHECK CONSTRAINT [FK_OrderDates_OrderID]
GO
ALTER TABLE [dbo].[OrderDocuments_tb] CHECK CONSTRAINT [FK_OrderDocuments_OrderID]
GO
ALTER TABLE [dbo].[Params_tb] CHECK CONSTRAINT [FK_Params_OrderID]
GO
ALTER TABLE [dbo].[PaymentChanges_tb] CHECK CONSTRAINT [FK_PaymentChanges_OrderID]
GO
ALTER TABLE [dbo].[Payments_tb] CHECK CONSTRAINT [FK_Payments_OrderID]
GO
ALTER TABLE [dbo].[Reviewers_tb] CHECK CONSTRAINT [FK_Reviewers_OrderID]
GO
ALTER TABLE [dbo].[Reviews_tb] CHECK CONSTRAINT [FK_Reviews_OrderID]
GO
ALTER TABLE [dbo].[Unreads_tb] CHECK CONSTRAINT [FK_Unreads_OrderID]
GO

/****** Object:  Trigger [Orders_Log_Del_trg]    Script Date: 10/26/2020 05:41:08 ******/
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
/****** Object:  Trigger [Orders_Log_Ins_trg]    Script Date: 10/26/2020 05:41:09 ******/
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
/****** Object:  Trigger [Orders_Log_Upd_trg]    Script Date: 10/26/2020 05:41:09 ******/
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
