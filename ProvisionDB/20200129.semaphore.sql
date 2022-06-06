USE [ProvisionDB]
GO
/****** Object:  Table [dbo].[Orders_Log_tb]    Script Date: 29.01.2020 12:32:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders_Log_tb]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Orders_Log_tb](
	[LID] [int] IDENTITY(1,1) NOT NULL,
	[TID] [int] NOT NULL,
	[Status] [int] NULL,
	[EditedBy] [varchar](50) NULL,
	[RD] [datetime] NULL,
	[Oper] [char](1) NOT NULL,
 CONSTRAINT [PK_Orders_Log_LID] PRIMARY KEY CLUSTERED 
(
	[LID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders_tb]    Script Date: 29.01.2020 12:32:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders_tb]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Orders_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[SubdivisionID] [int] NULL,
	[EquipmentID] [int] NULL,
	[ConditionID] [int] NULL,
	[SellerID] [int] NULL,
	[Login] [varchar](50) NULL,
	[Article] [varchar](500) NULL,
	[Qty] [int] NULL CONSTRAINT [DF_Orders_Qty]  DEFAULT ((0)),
	[Purpose] [varchar](2000) NULL,
	[Price] [float] NULL,
	[Currency] [varchar](10) NULL,
	[Total] [money] NULL,
	[Tax] [money] NULL,
	[Status] [int] NULL,
	[RowSpan] [int] NULL,
	[RD] [datetime] NULL CONSTRAINT [DF_Orders_RD]  DEFAULT (getdate()),
	[Account] [varchar](500) NULL,
	[EditedBy] [varchar](50) NULL,
	[CategoryID] [int] NULL,
	[URL] [varchar](200) NULL,
	[StockListID] [int] NULL,
 CONSTRAINT [PK_Orders_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reviews_Log_tb]    Script Date: 29.01.2020 12:32:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reviews_Log_tb]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reviews_Log_tb](
	[LID] [int] IDENTITY(1,1) NOT NULL,
	[TID] [int] NOT NULL,
	[Status] [int] NULL,
	[EditedBy] [varchar](50) NULL,
	[RD] [datetime] NULL,
	[Oper] [char](1) NOT NULL,
 CONSTRAINT [PK_Reviews_Log_LID] PRIMARY KEY CLUSTERED 
(
	[LID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reviews_tb]    Script Date: 29.01.2020 12:32:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reviews_tb]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reviews_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Reviewer] [varchar](50) NULL,
	[Status] [int] NULL,
	[Note] [varchar](1000) NULL,
	[RD] [datetime] NULL CONSTRAINT [DF_Reviews_RD]  DEFAULT (getdate()),
 CONSTRAINT [PK_Reviews_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Orders_Article]    Script Date: 29.01.2020 12:32:05 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Orders_tb]') AND name = N'IX_Orders_Article')
CREATE NONCLUSTERED INDEX [IX_Orders_Article] ON [dbo].[Orders_tb]
(
	[Article] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Orders_Login]    Script Date: 29.01.2020 12:32:05 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Orders_tb]') AND name = N'IX_Orders_Login')
CREATE NONCLUSTERED INDEX [IX_Orders_Login] ON [dbo].[Orders_tb]
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Orders_CategoryID]    Script Date: 29.01.2020 12:32:05 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Orders_tb]') AND name = N'WX_Orders_CategoryID')
CREATE NONCLUSTERED INDEX [WX_Orders_CategoryID] ON [dbo].[Orders_tb]
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Orders_ConditionID]    Script Date: 29.01.2020 12:32:05 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Orders_tb]') AND name = N'WX_Orders_ConditionID')
CREATE NONCLUSTERED INDEX [WX_Orders_ConditionID] ON [dbo].[Orders_tb]
(
	[ConditionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Orders_EquipmentID]    Script Date: 29.01.2020 12:32:05 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Orders_tb]') AND name = N'WX_Orders_EquipmentID')
CREATE NONCLUSTERED INDEX [WX_Orders_EquipmentID] ON [dbo].[Orders_tb]
(
	[EquipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Orders_SellerID]    Script Date: 29.01.2020 12:32:05 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Orders_tb]') AND name = N'WX_Orders_SellerID')
CREATE NONCLUSTERED INDEX [WX_Orders_SellerID] ON [dbo].[Orders_tb]
(
	[SellerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Orders_StockListID]    Script Date: 29.01.2020 12:32:05 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Orders_tb]') AND name = N'WX_Orders_StockListID')
CREATE NONCLUSTERED INDEX [WX_Orders_StockListID] ON [dbo].[Orders_tb]
(
	[StockListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Orders_SubdivisionID]    Script Date: 29.01.2020 12:32:05 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Orders_tb]') AND name = N'WX_Orders_SubdivisionID')
CREATE NONCLUSTERED INDEX [WX_Orders_SubdivisionID] ON [dbo].[Orders_tb]
(
	[SubdivisionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Reviews_OrderID]    Script Date: 29.01.2020 12:32:05 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Reviews_tb]') AND name = N'WX_Reviews_OrderID')
CREATE NONCLUSTERED INDEX [WX_Reviews_OrderID] ON [dbo].[Reviews_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orders_CategoryID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders_tb]'))
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[DIC_Categories_tb] ([TID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orders_CategoryID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders_tb]'))
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_CategoryID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orders_ConditionID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders_tb]'))
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_ConditionID] FOREIGN KEY([ConditionID])
REFERENCES [dbo].[DIC_Conditions_tb] ([TID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orders_ConditionID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders_tb]'))
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_ConditionID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orders_EquipmentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders_tb]'))
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_EquipmentID] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[DIC_Equipments_tb] ([TID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orders_EquipmentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders_tb]'))
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_EquipmentID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orders_SellerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders_tb]'))
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_SellerID] FOREIGN KEY([SellerID])
REFERENCES [dbo].[DIC_Sellers_tb] ([TID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orders_SellerID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders_tb]'))
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_SellerID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orders_StockListID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders_tb]'))
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_StockListID] FOREIGN KEY([StockListID])
REFERENCES [dbo].[DIC_StockList_tb] ([TID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orders_StockListID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders_tb]'))
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_StockListID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orders_SubdivisionID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders_tb]'))
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_SubdivisionID] FOREIGN KEY([SubdivisionID])
REFERENCES [dbo].[DIC_Subdivisions_tb] ([TID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orders_SubdivisionID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders_tb]'))
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_SubdivisionID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reviews_OrderID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reviews_tb]'))
ALTER TABLE [dbo].[Reviews_tb]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reviews_OrderID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reviews_tb]'))
ALTER TABLE [dbo].[Reviews_tb] CHECK CONSTRAINT [FK_Reviews_OrderID]
GO
/****** Object:  StoredProcedure [dbo].[WEB_SemaphoreEvents_sp]    Script Date: 29.01.2020 12:32:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WEB_SemaphoreEvents_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[WEB_SemaphoreEvents_sp] AS' 
END
GO

-- ============================================
-- Author:      Kharlamov
-- Create date: 20200129
-- Description: Semaphore of ProvisionDB Events 
-- ============================================

ALTER PROCEDURE [dbo].[WEB_SemaphoreEvents_sp] 
    @p_Mode        int,
    @p_OrderLogID  int,
    @p_ReviewLogID int,
    @p_LogDateTime datetime,
    @p_OUT         varchar(100) OUTPUT
AS
BEGIN
    DECLARE 
        @l_current_order_log_id  int,
        @l_current_review_log_id int

    select top 1 @l_current_order_log_id = LID from [dbo].[Orders_Log_tb] order by LID desc
    select top 1 @l_current_review_log_id = LID from [dbo].[Reviews_Log_tb] order by LID desc

    if @p_Mode = 0
        SELECT @l_current_order_log_id, @l_current_review_log_id FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[WEB_SemaphoreEvents_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else if @p_Mode = 1
        select 
            cast(LID as varchar) + ':0' as LID,
            Status,
            Oper
        from [dbo].[Orders_Log_tb] 
        where LID > @p_OrderLogID
        UNION
        select 
            '0:' + cast(LID as varchar) as LID,
            Status,
            Oper
        from [dbo].[Reviews_Log_tb] 
        where LID > @p_ReviewLogID
        order by LID
END

GO
/****** Object:  Trigger [dbo].[Orders_Log_Del_trg]    Script Date: 29.01.2020 12:32:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Orders_Log_Del_trg]'))
EXEC dbo.sp_executesql @statement = N'create trigger [dbo].[Orders_Log_Del_trg] on [dbo].[Orders_tb]
for delete
as
  INSERT INTO [dbo].[Orders_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [EditedBy], [RD], ''D'' from deleted
' 
GO
/****** Object:  Trigger [dbo].[Orders_Log_Ins_trg]    Script Date: 29.01.2020 12:32:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Orders_Log_Ins_trg]'))
EXEC dbo.sp_executesql @statement = N'create trigger [dbo].[Orders_Log_Ins_trg] on [dbo].[Orders_tb]
for insert
as
  INSERT INTO [dbo].[Orders_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [EditedBy], [RD], ''I'' from inserted
' 
GO
/****** Object:  Trigger [dbo].[Orders_Log_Upd_trg]    Script Date: 29.01.2020 12:32:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Orders_Log_Upd_trg]'))
EXEC dbo.sp_executesql @statement = N'create trigger [dbo].[Orders_Log_Upd_trg] on [dbo].[Orders_tb]
for update
as
  INSERT INTO [dbo].[Orders_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [EditedBy], [RD], ''U'' from inserted
' 
GO
/****** Object:  Trigger [dbo].[Reviews_Log_Del_trg]    Script Date: 29.01.2020 12:32:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Reviews_Log_Del_trg]'))
EXEC dbo.sp_executesql @statement = N'create trigger [dbo].[Reviews_Log_Del_trg] on [dbo].[Reviews_tb]
for delete
as
  INSERT INTO [dbo].[Reviews_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [Login], [RD], ''D'' from deleted
' 
GO
/****** Object:  Trigger [dbo].[Reviews_Log_Ins_trg]    Script Date: 29.01.2020 12:32:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Reviews_Log_Ins_trg]'))
EXEC dbo.sp_executesql @statement = N'create trigger [dbo].[Reviews_Log_Ins_trg] on [dbo].[Reviews_tb]
for insert
as
  INSERT INTO [dbo].[Reviews_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [Login], [RD], ''I'' from inserted
' 
GO
/****** Object:  Trigger [dbo].[Reviews_Log_Upd_trg]    Script Date: 29.01.2020 12:32:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Reviews_Log_Upd_trg]'))
EXEC dbo.sp_executesql @statement = N'create trigger [dbo].[Reviews_Log_Upd_trg] on [dbo].[Reviews_tb]
for update
as
  INSERT INTO [dbo].[Reviews_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [Login], [RD], ''U'' from inserted
' 
GO
