USE [PurchaseDB]
GO
/****** Object:  Table [dbo].[DIC_StockList_tb]    Script Date: 29.01.2022 8:11:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIC_StockList_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Title] [varchar](250) NULL,
	[ShortName] [varchar](100) NULL,
	[NodeLevel] [int] NULL,
	[NodeCode] [varchar](100) NOT NULL,
	[RefCode1C] [varchar](20) NULL,
	[Comment] [varchar](1000) NOT NULL,
	[EditedBy] [varchar](50) NULL,
	[RD] [datetime] NULL,
	[Children] [int] NULL,
	[Params] [varchar](200) NULL,
 CONSTRAINT [PK_DIC_StockList_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_StockList_Name]    Script Date: 29.01.2022 8:11:56 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_StockList_Name] ON [dbo].[DIC_StockList_tb]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_StockList_NodeCode]    Script Date: 29.01.2022 8:11:56 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DIC_StockList_NodeCode] ON [dbo].[DIC_StockList_tb]
(
	[NodeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DIC_StockList_NodeLevel]    Script Date: 29.01.2022 8:11:56 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_StockList_NodeLevel] ON [dbo].[DIC_StockList_tb]
(
	[NodeLevel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_StockList_ShortName]    Script Date: 29.01.2022 8:11:56 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_StockList_ShortName] ON [dbo].[DIC_StockList_tb]
(
	[ShortName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DIC_StockList_tb] ADD  CONSTRAINT [DF_DIC_StockList_RD]  DEFAULT (getdate()) FOR [RD]
GO
