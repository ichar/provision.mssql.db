USE [PurchaseDB]
GO
/****** Object:  Table [dbo].[Comments_tb]    Script Date: 29.01.2022 8:11:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[CommentID] [int] NULL,
	[Login] [varchar](50) NOT NULL,
	[Note] [varchar](1000) NULL,
	[RD] [datetime] NULL,
 CONSTRAINT [PK_Comments_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [WX_Comments_CommentID]    Script Date: 29.01.2022 8:11:56 ******/
CREATE NONCLUSTERED INDEX [WX_Comments_CommentID] ON [dbo].[Comments_tb]
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Comments_OrderID]    Script Date: 29.01.2022 8:11:56 ******/
CREATE NONCLUSTERED INDEX [WX_Comments_OrderID] ON [dbo].[Comments_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments_tb] ADD  CONSTRAINT [DF_Comments_RD]  DEFAULT (getdate()) FOR [RD]
GO
ALTER TABLE [dbo].[Comments_tb]  WITH CHECK ADD  CONSTRAINT [FK_Comments_CommentID] FOREIGN KEY([CommentID])
REFERENCES [dbo].[DIC_Comments_tb] ([TID])
GO
ALTER TABLE [dbo].[Comments_tb] CHECK CONSTRAINT [FK_Comments_CommentID]
GO
ALTER TABLE [dbo].[Comments_tb]  WITH CHECK ADD  CONSTRAINT [FK_Comments_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Comments_tb] CHECK CONSTRAINT [FK_Comments_OrderID]
GO
