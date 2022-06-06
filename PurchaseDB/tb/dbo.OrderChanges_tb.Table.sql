USE [PurchaseDB]
GO
/****** Object:  Table [dbo].[OrderChanges_tb]    Script Date: 29.01.2022 8:11:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderChanges_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Name] [varchar](500) NULL,
	[Value] [varchar](8000) NULL,
	[RD] [datetime] NULL,
 CONSTRAINT [PK_OrderChanges_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [WX_OrderChanges_OrderID]    Script Date: 29.01.2022 8:11:56 ******/
CREATE NONCLUSTERED INDEX [WX_OrderChanges_OrderID] ON [dbo].[OrderChanges_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderChanges_tb] ADD  CONSTRAINT [DF_OrderChanges_RD]  DEFAULT (getdate()) FOR [RD]
GO
ALTER TABLE [dbo].[OrderChanges_tb]  WITH CHECK ADD  CONSTRAINT [FK_OrderChanges_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[OrderChanges_tb] CHECK CONSTRAINT [FK_OrderChanges_OrderID]
GO
