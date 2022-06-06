USE [PurchaseDB]
GO
/****** Object:  Table [dbo].[Reviews_tb]    Script Date: 29.01.2022 8:11:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Reviewer] [varchar](50) NULL,
	[Status] [int] NULL,
	[Note] [varchar](8000) NULL,
	[RD] [datetime] NULL,
 CONSTRAINT [PK_Reviews_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [WX_Reviews_OrderID]    Script Date: 29.01.2022 8:11:56 ******/
CREATE NONCLUSTERED INDEX [WX_Reviews_OrderID] ON [dbo].[Reviews_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Reviews_tb] ADD  CONSTRAINT [DF_Reviews_RD]  DEFAULT (getdate()) FOR [RD]
GO
ALTER TABLE [dbo].[Reviews_tb]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Reviews_tb] CHECK CONSTRAINT [FK_Reviews_OrderID]
GO
/****** Object:  Trigger [dbo].[Reviews_Log_Del_trg]    Script Date: 29.01.2022 8:11:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[Reviews_Log_Del_trg] on [dbo].[Reviews_tb]
for delete
as
  INSERT INTO [dbo].[Reviews_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [Login], [RD], 'D' from deleted


GO
ALTER TABLE [dbo].[Reviews_tb] ENABLE TRIGGER [Reviews_Log_Del_trg]
GO
/****** Object:  Trigger [dbo].[Reviews_Log_Ins_trg]    Script Date: 29.01.2022 8:11:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Reviews_Log_Ins_trg] on [dbo].[Reviews_tb]
for insert
as
  INSERT INTO [dbo].[Reviews_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [Login], [RD], 'I' from inserted


GO
ALTER TABLE [dbo].[Reviews_tb] ENABLE TRIGGER [Reviews_Log_Ins_trg]
GO
/****** Object:  Trigger [dbo].[Reviews_Log_Upd_trg]    Script Date: 29.01.2022 8:11:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Reviews_Log_Upd_trg] on [dbo].[Reviews_tb]
for update
as
  INSERT INTO [dbo].[Reviews_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [Login], [RD], 'U' from inserted


GO
ALTER TABLE [dbo].[Reviews_tb] ENABLE TRIGGER [Reviews_Log_Upd_trg]
GO
