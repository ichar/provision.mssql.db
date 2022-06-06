USE [ProvisionDB]
GO
/****** Object:  Table [dbo].[OrderDocuments_tb]    Script Date: 25.08.2021 12:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	[RD] [datetime] NULL,
	[ForAudit] [bit] NULL,
 CONSTRAINT [PK_OrderDocuments_tb] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [WX_OrderDocuments_OrderID]    Script Date: 25.08.2021 12:16:41 ******/
CREATE NONCLUSTERED INDEX [WX_OrderDocuments_OrderID] ON [dbo].[OrderDocuments_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [WX_OrderDocuments_UID]    Script Date: 25.08.2021 12:16:41 ******/
CREATE UNIQUE NONCLUSTERED INDEX [WX_OrderDocuments_UID] ON [dbo].[OrderDocuments_tb]
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDocuments_tb] ADD  CONSTRAINT [DF_OrderDocuments_RD]  DEFAULT (getdate()) FOR [RD]
GO
ALTER TABLE [dbo].[OrderDocuments_tb]  WITH CHECK ADD  CONSTRAINT [FK_OrderDocuments_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[OrderDocuments_tb] CHECK CONSTRAINT [FK_OrderDocuments_OrderID]
GO
