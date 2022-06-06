USE [ProvisionDB]
GO
/****** Object:  ForeignKey [FK_Comments_CommentID]    Script Date: 10/26/2020 05:30:33 ******/
ALTER TABLE [dbo].[Comments_tb] DROP CONSTRAINT [FK_Comments_CommentID]
GO
/****** Object:  ForeignKey [FK_Comments_OrderID]    Script Date: 10/26/2020 05:30:33 ******/
ALTER TABLE [dbo].[Comments_tb] DROP CONSTRAINT [FK_Comments_OrderID]
GO
/****** Object:  ForeignKey [FK_DIC_Equipments_SubdivisionID]    Script Date: 10/26/2020 05:30:33 ******/
ALTER TABLE [dbo].[DIC_Equipments_tb] DROP CONSTRAINT [FK_DIC_Equipments_SubdivisionID]
GO
/****** Object:  ForeignKey [FK_Items_OrderID]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[Items_tb] DROP CONSTRAINT [FK_Items_OrderID]
GO
/****** Object:  ForeignKey [FK_OrderChanges_OrderID]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[OrderChanges_tb] DROP CONSTRAINT [FK_OrderChanges_OrderID]
GO
/****** Object:  ForeignKey [FK_OrderDates_OrderID]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[OrderDates_tb] DROP CONSTRAINT [FK_OrderDates_OrderID]
GO
/****** Object:  ForeignKey [FK_OrderDocuments_OrderID]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[OrderDocuments_tb] DROP CONSTRAINT [FK_OrderDocuments_OrderID]
GO
/****** Object:  ForeignKey [FK_Orders_CategoryID]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[Orders_tb] DROP CONSTRAINT [FK_Orders_CategoryID]
GO
/****** Object:  ForeignKey [FK_Orders_ConditionID]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[Orders_tb] DROP CONSTRAINT [FK_Orders_ConditionID]
GO
/****** Object:  ForeignKey [FK_Orders_EquipmentID]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[Orders_tb] DROP CONSTRAINT [FK_Orders_EquipmentID]
GO
/****** Object:  ForeignKey [FK_Orders_SellerID]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[Orders_tb] DROP CONSTRAINT [FK_Orders_SellerID]
GO
/****** Object:  ForeignKey [FK_Orders_StockListID]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[Orders_tb] DROP CONSTRAINT [FK_Orders_StockListID]
GO
/****** Object:  ForeignKey [FK_Orders_SubdivisionID]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[Orders_tb] DROP CONSTRAINT [FK_Orders_SubdivisionID]
GO
/****** Object:  ForeignKey [FK_Params_OrderID]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[Params_tb] DROP CONSTRAINT [FK_Params_OrderID]
GO
/****** Object:  ForeignKey [FK_Params_ParamID]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[Params_tb] DROP CONSTRAINT [FK_Params_ParamID]
GO
/****** Object:  ForeignKey [FK_PaymentChanges_OrderID]    Script Date: 10/26/2020 05:30:35 ******/
ALTER TABLE [dbo].[PaymentChanges_tb] DROP CONSTRAINT [FK_PaymentChanges_OrderID]
GO
/****** Object:  ForeignKey [FK_PaymentChanges_PaymentID]    Script Date: 10/26/2020 05:30:35 ******/
ALTER TABLE [dbo].[PaymentChanges_tb] DROP CONSTRAINT [FK_PaymentChanges_PaymentID]
GO
/****** Object:  ForeignKey [FK_Payments_OrderID]    Script Date: 10/26/2020 05:30:35 ******/
ALTER TABLE [dbo].[Payments_tb] DROP CONSTRAINT [FK_Payments_OrderID]
GO
/****** Object:  ForeignKey [FK_Payments_PaymentID]    Script Date: 10/26/2020 05:30:35 ******/
ALTER TABLE [dbo].[Payments_tb] DROP CONSTRAINT [FK_Payments_PaymentID]
GO
/****** Object:  ForeignKey [FK_Reviewers_OrderID]    Script Date: 10/26/2020 05:30:35 ******/
ALTER TABLE [dbo].[Reviewers_tb] DROP CONSTRAINT [FK_Reviewers_OrderID]
GO
/****** Object:  ForeignKey [FK_Reviews_OrderID]    Script Date: 10/26/2020 05:30:35 ******/
ALTER TABLE [dbo].[Reviews_tb] DROP CONSTRAINT [FK_Reviews_OrderID]
GO
/****** Object:  ForeignKey [FK_Unreads_OrderID]    Script Date: 10/26/2020 05:30:35 ******/
ALTER TABLE [dbo].[Unreads_tb] DROP CONSTRAINT [FK_Unreads_OrderID]
GO
/****** Object:  Table [dbo].[PaymentChanges_tb]    Script Date: 10/26/2020 05:30:35 ******/
ALTER TABLE [dbo].[PaymentChanges_tb] DROP CONSTRAINT [FK_PaymentChanges_OrderID]
GO
ALTER TABLE [dbo].[PaymentChanges_tb] DROP CONSTRAINT [FK_PaymentChanges_PaymentID]
GO
ALTER TABLE [dbo].[PaymentChanges_tb] DROP CONSTRAINT [DF_PaymentChanges_RD]
GO
DROP TABLE [dbo].[PaymentChanges_tb]
GO
/****** Object:  Table [dbo].[Reviews_tb]    Script Date: 10/26/2020 05:30:35 ******/
ALTER TABLE [dbo].[Reviews_tb] DROP CONSTRAINT [FK_Reviews_OrderID]
GO
ALTER TABLE [dbo].[Reviews_tb] DROP CONSTRAINT [DF_Reviews_RD]
GO
DROP TABLE [dbo].[Reviews_tb]
GO
/****** Object:  Table [dbo].[Unreads_tb]    Script Date: 10/26/2020 05:30:35 ******/
ALTER TABLE [dbo].[Unreads_tb] DROP CONSTRAINT [FK_Unreads_OrderID]
GO
DROP TABLE [dbo].[Unreads_tb]
GO
/****** Object:  Table [dbo].[Payments_tb]    Script Date: 10/26/2020 05:30:35 ******/
ALTER TABLE [dbo].[Payments_tb] DROP CONSTRAINT [FK_Payments_OrderID]
GO
ALTER TABLE [dbo].[Payments_tb] DROP CONSTRAINT [FK_Payments_PaymentID]
GO
ALTER TABLE [dbo].[Payments_tb] DROP CONSTRAINT [DF_Payments_RD]
GO
DROP TABLE [dbo].[Payments_tb]
GO
/****** Object:  Table [dbo].[Reviewers_tb]    Script Date: 10/26/2020 05:30:35 ******/
ALTER TABLE [dbo].[Reviewers_tb] DROP CONSTRAINT [FK_Reviewers_OrderID]
GO
DROP TABLE [dbo].[Reviewers_tb]
GO
/****** Object:  Table [dbo].[Comments_tb]    Script Date: 10/26/2020 05:30:33 ******/
ALTER TABLE [dbo].[Comments_tb] DROP CONSTRAINT [FK_Comments_CommentID]
GO
ALTER TABLE [dbo].[Comments_tb] DROP CONSTRAINT [FK_Comments_OrderID]
GO
ALTER TABLE [dbo].[Comments_tb] DROP CONSTRAINT [DF_Comments_RD]
GO
DROP TABLE [dbo].[Comments_tb]
GO
/****** Object:  Table [dbo].[Params_tb]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[Params_tb] DROP CONSTRAINT [FK_Params_OrderID]
GO
ALTER TABLE [dbo].[Params_tb] DROP CONSTRAINT [FK_Params_ParamID]
GO
ALTER TABLE [dbo].[Params_tb] DROP CONSTRAINT [DF_Params_RD]
GO
DROP TABLE [dbo].[Params_tb]
GO
/****** Object:  Table [dbo].[Items_tb]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[Items_tb] DROP CONSTRAINT [FK_Items_OrderID]
GO
DROP TABLE [dbo].[Items_tb]
GO
/****** Object:  Table [dbo].[OrderChanges_tb]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[OrderChanges_tb] DROP CONSTRAINT [FK_OrderChanges_OrderID]
GO
ALTER TABLE [dbo].[OrderChanges_tb] DROP CONSTRAINT [DF_OrderChanges_RD]
GO
DROP TABLE [dbo].[OrderChanges_tb]
GO
/****** Object:  Table [dbo].[OrderDates_tb]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[OrderDates_tb] DROP CONSTRAINT [FK_OrderDates_OrderID]
GO
DROP TABLE [dbo].[OrderDates_tb]
GO
/****** Object:  Table [dbo].[OrderDocuments_tb]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[OrderDocuments_tb] DROP CONSTRAINT [FK_OrderDocuments_OrderID]
GO
ALTER TABLE [dbo].[OrderDocuments_tb] DROP CONSTRAINT [DF_OrderDocuments_RD]
GO
DROP TABLE [dbo].[OrderDocuments_tb]
GO
/****** Object:  Table [dbo].[Orders_tb]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[Orders_tb] DROP CONSTRAINT [FK_Orders_CategoryID]
GO
ALTER TABLE [dbo].[Orders_tb] DROP CONSTRAINT [FK_Orders_ConditionID]
GO
ALTER TABLE [dbo].[Orders_tb] DROP CONSTRAINT [FK_Orders_EquipmentID]
GO
ALTER TABLE [dbo].[Orders_tb] DROP CONSTRAINT [FK_Orders_SellerID]
GO
ALTER TABLE [dbo].[Orders_tb] DROP CONSTRAINT [FK_Orders_StockListID]
GO
ALTER TABLE [dbo].[Orders_tb] DROP CONSTRAINT [FK_Orders_SubdivisionID]
GO
ALTER TABLE [dbo].[Orders_tb] DROP CONSTRAINT [DF_Orders_Qty]
GO
ALTER TABLE [dbo].[Orders_tb] DROP CONSTRAINT [DF_Orders_RD]
GO
DROP TABLE [dbo].[Orders_tb]
GO
/****** Object:  Table [dbo].[DIC_Equipments_tb]    Script Date: 10/26/2020 05:30:33 ******/
ALTER TABLE [dbo].[DIC_Equipments_tb] DROP CONSTRAINT [FK_DIC_Equipments_SubdivisionID]
GO
DROP TABLE [dbo].[DIC_Equipments_tb]
GO
/****** Object:  Table [dbo].[DIC_Params_tb]    Script Date: 10/26/2020 05:30:33 ******/
DROP TABLE [dbo].[DIC_Params_tb]
GO
/****** Object:  Table [dbo].[DIC_Payments_tb]    Script Date: 10/26/2020 05:30:33 ******/
DROP TABLE [dbo].[DIC_Payments_tb]
GO
/****** Object:  Table [dbo].[DIC_Sellers_tb]    Script Date: 10/26/2020 05:30:34 ******/
DROP TABLE [dbo].[DIC_Sellers_tb]
GO
/****** Object:  Table [dbo].[DIC_StockList_tb]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[DIC_StockList_tb] DROP CONSTRAINT [DF_DIC_StockList_RD]
GO
DROP TABLE [dbo].[DIC_StockList_tb]
GO
/****** Object:  Table [dbo].[DIC_Subdivisions_tb]    Script Date: 10/26/2020 05:30:34 ******/
DROP TABLE [dbo].[DIC_Subdivisions_tb]
GO
/****** Object:  Table [dbo].[Orders_Log_tb]    Script Date: 10/26/2020 05:30:34 ******/
DROP TABLE [dbo].[Orders_Log_tb]
GO
/****** Object:  Table [dbo].[DIC_Categories_tb]    Script Date: 10/26/2020 05:30:33 ******/
DROP TABLE [dbo].[DIC_Categories_tb]
GO
/****** Object:  Table [dbo].[DIC_Comments_tb]    Script Date: 10/26/2020 05:30:33 ******/
DROP TABLE [dbo].[DIC_Comments_tb]
GO
/****** Object:  Table [dbo].[DIC_Conditions_tb]    Script Date: 10/26/2020 05:30:33 ******/
DROP TABLE [dbo].[DIC_Conditions_tb]
GO
/****** Object:  Table [dbo].[Reviews_Log_tb]    Script Date: 10/26/2020 05:30:35 ******/
DROP TABLE [dbo].[Reviews_Log_tb]
GO
/****** Object:  Table [dbo].[Reviews_Log_tb]    Script Date: 10/26/2020 05:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DIC_Conditions_tb]    Script Date: 10/26/2020 05:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DIC_Conditions_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](10) NULL,
 CONSTRAINT [PK_Conditions] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_DIC_Conditions_Name] ON [dbo].[DIC_Conditions_tb] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIC_Comments_tb]    Script Date: 10/26/2020 05:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DIC_Comments_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_DIC_Comments_Name] ON [dbo].[DIC_Comments_tb] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIC_Categories_tb]    Script Date: 10/26/2020 05:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DIC_Categories_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_DIC_Categories_Name] ON [dbo].[DIC_Categories_tb] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders_Log_tb]    Script Date: 10/26/2020 05:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DIC_Subdivisions_tb]    Script Date: 10/26/2020 05:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DIC_Subdivisions_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Manager] [varchar](100) NULL,
	[Code] [char](4) NULL,
 CONSTRAINT [PK_Subdivisions] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_DIC_Subdivisions_Name] ON [dbo].[DIC_Subdivisions_tb] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIC_StockList_tb]    Script Date: 10/26/2020 05:30:34 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_DIC_StockList_Name] ON [dbo].[DIC_StockList_tb] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_DIC_StockList_NodeCode] ON [dbo].[DIC_StockList_tb] 
(
	[NodeCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DIC_StockList_NodeLevel] ON [dbo].[DIC_StockList_tb] 
(
	[NodeLevel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DIC_StockList_ShortName] ON [dbo].[DIC_StockList_tb] 
(
	[ShortName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIC_Sellers_tb]    Script Date: 10/26/2020 05:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DIC_Sellers_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Title] [varchar](250) NULL,
	[Address] [varchar](1000) NULL,
	[Code] [varchar](20) NULL,
	[Type] [int] NULL,
	[URL] [varchar](200) NULL,
	[Phone] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[EditedBy] [varchar](50) NULL,
	[RD] [datetime] NULL,
	[Contact] [varchar](200) NULL,
 CONSTRAINT [PK_Sellers] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_DIC_Sellers_Name] ON [dbo].[DIC_Sellers_tb] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIC_Payments_tb]    Script Date: 10/26/2020 05:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DIC_Payments_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_DIC_Payments_Name] ON [dbo].[DIC_Payments_tb] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIC_Params_tb]    Script Date: 10/26/2020 05:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DIC_Params_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](10) NULL,
 CONSTRAINT [PK_Params] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_DIC_Params_Name] ON [dbo].[DIC_Params_tb] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIC_Equipments_tb]    Script Date: 10/26/2020 05:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DIC_Equipments_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[SubdivisionID] [int] NOT NULL,
	[Name] [varchar](1000) NULL,
	[Title] [varchar](1000) NULL,
 CONSTRAINT [PK_Equipments] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_DIC_Equipments_Title] ON [dbo].[DIC_Equipments_tb] 
(
	[Title] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders_tb]    Script Date: 10/26/2020 05:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
	[MD] [int] NULL,
 CONSTRAINT [PK_Orders_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
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
/****** Object:  Trigger [Orders_Log_Upd_trg]    Script Date: 10/26/2020 05:30:35 ******/
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
/****** Object:  Trigger [Orders_Log_Ins_trg]    Script Date: 10/26/2020 05:30:35 ******/
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
/****** Object:  Trigger [Orders_Log_Del_trg]    Script Date: 10/26/2020 05:30:35 ******/
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
/****** Object:  Table [dbo].[OrderDocuments_tb]    Script Date: 10/26/2020 05:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDocuments_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [char](50) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[FileName] [varchar](255) NOT NULL,
	[FileSize] [int] NULL,
	[ContentType] [varchar](20) NULL,
	[Note] [varchar](1000) NULL,
	[Image] [image] NULL,
	[RD] [datetime] NULL CONSTRAINT [DF_OrderDocuments_RD]  DEFAULT (getdate()),
 CONSTRAINT [PK_OrderDocuments_tb] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [WX_OrderDocuments_OrderID] ON [dbo].[OrderDocuments_tb] 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [WX_OrderDocuments_UID] ON [dbo].[OrderDocuments_tb] 
(
	[UID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDates_tb]    Script Date: 10/26/2020 05:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDates_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Created] [datetime] NULL,
	[Approved] [datetime] NULL,
	[Paid] [datetime] NULL,
	[Delivered] [datetime] NULL,
	[ReviewDueDate] [datetime] NULL,
	[WithMail] [bit] NULL,
 CONSTRAINT [PK_OrderDates_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WX_OrderDates_OrderID] ON [dbo].[OrderDates_tb] 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderChanges_tb]    Script Date: 10/26/2020 05:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderChanges_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Name] [varchar](500) NULL,
	[Value] [varchar](2000) NULL,
	[RD] [datetime] NULL CONSTRAINT [DF_OrderChanges_RD]  DEFAULT (getdate()),
 CONSTRAINT [PK_OrderChanges_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [WX_OrderChanges_OrderID] ON [dbo].[OrderChanges_tb] 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items_tb]    Script Date: 10/26/2020 05:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
 CONSTRAINT [PK_Items_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [WX_Items_OrderID] ON [dbo].[Items_tb] 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Params_tb]    Script Date: 10/26/2020 05:30:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Params_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ParamID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Value] [varchar](500) NULL,
	[RD] [datetime] NULL CONSTRAINT [DF_Params_RD]  DEFAULT (getdate()),
 CONSTRAINT [PK_Params_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [WX_Params_OrderID] ON [dbo].[Params_tb] 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WX_Params_ParamID] ON [dbo].[Params_tb] 
(
	[ParamID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments_tb]    Script Date: 10/26/2020 05:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comments_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[CommentID] [int] NULL,
	[Login] [varchar](50) NOT NULL,
	[Note] [varchar](1000) NULL,
	[RD] [datetime] NULL CONSTRAINT [DF_Comments_RD]  DEFAULT (getdate()),
 CONSTRAINT [PK_Comments_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [WX_Comments_CommentID] ON [dbo].[Comments_tb] 
(
	[CommentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WX_Comments_OrderID] ON [dbo].[Comments_tb] 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviewers_tb]    Script Date: 10/26/2020 05:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reviewers_tb](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Reviewers_TID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [WX_Reviewers_OrderID] ON [dbo].[Reviewers_tb] 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments_tb]    Script Date: 10/26/2020 05:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payments_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[PaymentID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[Total] [money] NULL,
	[Tax] [money] NULL,
	[Status] [int] NULL,
	[RD] [datetime] NULL CONSTRAINT [DF_Payments_RD]  DEFAULT (getdate()),
	[Currency] [varchar](10) NULL,
	[Rate] [float] NULL,
	[Comment] [varchar](1000) NULL,
 CONSTRAINT [PK_Payments_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [WX_Payments_OrderID] ON [dbo].[Payments_tb] 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WX_Payments_PaymentID] ON [dbo].[Payments_tb] 
(
	[PaymentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unreads_tb]    Script Date: 10/26/2020 05:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Unreads_tb](
	[OrderID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [WX_Unreads_OrderID] ON [dbo].[Unreads_tb] 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews_tb]    Script Date: 10/26/2020 05:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [WX_Reviews_OrderID] ON [dbo].[Reviews_tb] 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Trigger [Reviews_Log_Upd_trg]    Script Date: 10/26/2020 05:30:35 ******/
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
/****** Object:  Trigger [Reviews_Log_Ins_trg]    Script Date: 10/26/2020 05:30:35 ******/
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
/****** Object:  Trigger [Reviews_Log_Del_trg]    Script Date: 10/26/2020 05:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Reviews_Log_Del_trg] on [dbo].[Reviews_tb]
for delete
as
  INSERT INTO [dbo].[Reviews_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [Login], [RD], 'D' from deleted
GO
/****** Object:  Table [dbo].[PaymentChanges_tb]    Script Date: 10/26/2020 05:30:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentChanges_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Status] [int] NULL,
	[RD] [datetime] NULL CONSTRAINT [DF_PaymentChanges_RD]  DEFAULT (getdate()),
 CONSTRAINT [PK_PaymentChanges_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [WX_PaymentChanges_OrderID] ON [dbo].[PaymentChanges_tb] 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [WX_PaymentChanges_PaymentID] ON [dbo].[PaymentChanges_tb] 
(
	[PaymentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Comments_CommentID]    Script Date: 10/26/2020 05:30:33 ******/
ALTER TABLE [dbo].[Comments_tb]  WITH CHECK ADD  CONSTRAINT [FK_Comments_CommentID] FOREIGN KEY([CommentID])
REFERENCES [dbo].[DIC_Comments_tb] ([TID])
GO
ALTER TABLE [dbo].[Comments_tb] CHECK CONSTRAINT [FK_Comments_CommentID]
GO
/****** Object:  ForeignKey [FK_Comments_OrderID]    Script Date: 10/26/2020 05:30:33 ******/
ALTER TABLE [dbo].[Comments_tb]  WITH CHECK ADD  CONSTRAINT [FK_Comments_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Comments_tb] CHECK CONSTRAINT [FK_Comments_OrderID]
GO
/****** Object:  ForeignKey [FK_DIC_Equipments_SubdivisionID]    Script Date: 10/26/2020 05:30:33 ******/
ALTER TABLE [dbo].[DIC_Equipments_tb]  WITH CHECK ADD  CONSTRAINT [FK_DIC_Equipments_SubdivisionID] FOREIGN KEY([SubdivisionID])
REFERENCES [dbo].[DIC_Subdivisions_tb] ([TID])
GO
ALTER TABLE [dbo].[DIC_Equipments_tb] CHECK CONSTRAINT [FK_DIC_Equipments_SubdivisionID]
GO
/****** Object:  ForeignKey [FK_Items_OrderID]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[Items_tb]  WITH CHECK ADD  CONSTRAINT [FK_Items_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Items_tb] CHECK CONSTRAINT [FK_Items_OrderID]
GO
/****** Object:  ForeignKey [FK_OrderChanges_OrderID]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[OrderChanges_tb]  WITH CHECK ADD  CONSTRAINT [FK_OrderChanges_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[OrderChanges_tb] CHECK CONSTRAINT [FK_OrderChanges_OrderID]
GO
/****** Object:  ForeignKey [FK_OrderDates_OrderID]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[OrderDates_tb]  WITH CHECK ADD  CONSTRAINT [FK_OrderDates_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[OrderDates_tb] CHECK CONSTRAINT [FK_OrderDates_OrderID]
GO
/****** Object:  ForeignKey [FK_OrderDocuments_OrderID]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[OrderDocuments_tb]  WITH CHECK ADD  CONSTRAINT [FK_OrderDocuments_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[OrderDocuments_tb] CHECK CONSTRAINT [FK_OrderDocuments_OrderID]
GO
/****** Object:  ForeignKey [FK_Orders_CategoryID]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[DIC_Categories_tb] ([TID])
GO
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_CategoryID]
GO
/****** Object:  ForeignKey [FK_Orders_ConditionID]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_ConditionID] FOREIGN KEY([ConditionID])
REFERENCES [dbo].[DIC_Conditions_tb] ([TID])
GO
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_ConditionID]
GO
/****** Object:  ForeignKey [FK_Orders_EquipmentID]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_EquipmentID] FOREIGN KEY([EquipmentID])
REFERENCES [dbo].[DIC_Equipments_tb] ([TID])
GO
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_EquipmentID]
GO
/****** Object:  ForeignKey [FK_Orders_SellerID]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_SellerID] FOREIGN KEY([SellerID])
REFERENCES [dbo].[DIC_Sellers_tb] ([TID])
GO
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_SellerID]
GO
/****** Object:  ForeignKey [FK_Orders_StockListID]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_StockListID] FOREIGN KEY([StockListID])
REFERENCES [dbo].[DIC_StockList_tb] ([TID])
GO
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_StockListID]
GO
/****** Object:  ForeignKey [FK_Orders_SubdivisionID]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[Orders_tb]  WITH CHECK ADD  CONSTRAINT [FK_Orders_SubdivisionID] FOREIGN KEY([SubdivisionID])
REFERENCES [dbo].[DIC_Subdivisions_tb] ([TID])
GO
ALTER TABLE [dbo].[Orders_tb] CHECK CONSTRAINT [FK_Orders_SubdivisionID]
GO
/****** Object:  ForeignKey [FK_Params_OrderID]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[Params_tb]  WITH CHECK ADD  CONSTRAINT [FK_Params_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Params_tb] CHECK CONSTRAINT [FK_Params_OrderID]
GO
/****** Object:  ForeignKey [FK_Params_ParamID]    Script Date: 10/26/2020 05:30:34 ******/
ALTER TABLE [dbo].[Params_tb]  WITH CHECK ADD  CONSTRAINT [FK_Params_ParamID] FOREIGN KEY([ParamID])
REFERENCES [dbo].[DIC_Params_tb] ([TID])
GO
ALTER TABLE [dbo].[Params_tb] CHECK CONSTRAINT [FK_Params_ParamID]
GO
/****** Object:  ForeignKey [FK_PaymentChanges_OrderID]    Script Date: 10/26/2020 05:30:35 ******/
ALTER TABLE [dbo].[PaymentChanges_tb]  WITH CHECK ADD  CONSTRAINT [FK_PaymentChanges_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[PaymentChanges_tb] CHECK CONSTRAINT [FK_PaymentChanges_OrderID]
GO
/****** Object:  ForeignKey [FK_PaymentChanges_PaymentID]    Script Date: 10/26/2020 05:30:35 ******/
ALTER TABLE [dbo].[PaymentChanges_tb]  WITH CHECK ADD  CONSTRAINT [FK_PaymentChanges_PaymentID] FOREIGN KEY([PaymentID])
REFERENCES [dbo].[Payments_tb] ([TID])
GO
ALTER TABLE [dbo].[PaymentChanges_tb] CHECK CONSTRAINT [FK_PaymentChanges_PaymentID]
GO
/****** Object:  ForeignKey [FK_Payments_OrderID]    Script Date: 10/26/2020 05:30:35 ******/
ALTER TABLE [dbo].[Payments_tb]  WITH CHECK ADD  CONSTRAINT [FK_Payments_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Payments_tb] CHECK CONSTRAINT [FK_Payments_OrderID]
GO
/****** Object:  ForeignKey [FK_Payments_PaymentID]    Script Date: 10/26/2020 05:30:35 ******/
ALTER TABLE [dbo].[Payments_tb]  WITH CHECK ADD  CONSTRAINT [FK_Payments_PaymentID] FOREIGN KEY([PaymentID])
REFERENCES [dbo].[DIC_Payments_tb] ([TID])
GO
ALTER TABLE [dbo].[Payments_tb] CHECK CONSTRAINT [FK_Payments_PaymentID]
GO
/****** Object:  ForeignKey [FK_Reviewers_OrderID]    Script Date: 10/26/2020 05:30:35 ******/
ALTER TABLE [dbo].[Reviewers_tb]  WITH CHECK ADD  CONSTRAINT [FK_Reviewers_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Reviewers_tb] CHECK CONSTRAINT [FK_Reviewers_OrderID]
GO
/****** Object:  ForeignKey [FK_Reviews_OrderID]    Script Date: 10/26/2020 05:30:35 ******/
ALTER TABLE [dbo].[Reviews_tb]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Reviews_tb] CHECK CONSTRAINT [FK_Reviews_OrderID]
GO
/****** Object:  ForeignKey [FK_Unreads_OrderID]    Script Date: 10/26/2020 05:30:35 ******/
ALTER TABLE [dbo].[Unreads_tb]  WITH CHECK ADD  CONSTRAINT [FK_Unreads_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Unreads_tb] CHECK CONSTRAINT [FK_Unreads_OrderID]
GO
