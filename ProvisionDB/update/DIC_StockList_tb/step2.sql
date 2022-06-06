USE [ProvisionDB]
GO
/****** Object:  Index [IX_DIC_StockList_ShortName]    Script Date: 06.08.2020 13:57:47 ******/
DROP INDEX [IX_DIC_StockList_ShortName] ON [dbo].[DIC_StockList_tb]
GO
/****** Object:  Index [IX_DIC_StockList_NodeLevel]    Script Date: 06.08.2020 13:57:47 ******/
DROP INDEX [IX_DIC_StockList_NodeLevel] ON [dbo].[DIC_StockList_tb]
GO
/****** Object:  Index [IX_DIC_StockList_NodeCode]    Script Date: 06.08.2020 13:57:47 ******/
DROP INDEX [IX_DIC_StockList_NodeCode] ON [dbo].[DIC_StockList_tb]
GO
/****** Object:  Index [IX_DIC_StockList_Name]    Script Date: 06.08.2020 13:57:47 ******/
DROP INDEX [IX_DIC_StockList_Name] ON [dbo].[DIC_StockList_tb]
GO
/****** Object:  Table [dbo].[DIC_StockList_tb]    Script Date: 06.08.2020 13:57:48 ******/
DROP TABLE [dbo].[DIC_StockList_tb]
GO
/****** Object:  Table [dbo].[DIC_StockList_tb]    Script Date: 06.08.2020 13:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[RD] [datetime] NULL CONSTRAINT [DF_DIC_StockList_RD]  DEFAULT (getdate()),
	[Children] [int] NULL,
 CONSTRAINT [PK_DIC_StockList_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_StockList_Name]    Script Date: 06.08.2020 13:57:48 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_StockList_Name] ON [dbo].[DIC_StockList_tb]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_StockList_NodeCode]    Script Date: 06.08.2020 13:57:48 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DIC_StockList_NodeCode] ON [dbo].[DIC_StockList_tb]
(
	[NodeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DIC_StockList_NodeLevel]    Script Date: 06.08.2020 13:57:48 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_StockList_NodeLevel] ON [dbo].[DIC_StockList_tb]
(
	[NodeLevel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_StockList_ShortName]    Script Date: 06.08.2020 13:57:48 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_StockList_ShortName] ON [dbo].[DIC_StockList_tb]
(
	[ShortName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
