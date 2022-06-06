USE [PurchaseDB]
GO
/****** Object:  Table [dbo].[Reviewers_tb]    Script Date: 29.01.2022 8:11:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviewers_tb](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Reviewers_TID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [WX_Reviewers_OrderID]    Script Date: 29.01.2022 8:11:56 ******/
CREATE NONCLUSTERED INDEX [WX_Reviewers_OrderID] ON [dbo].[Reviewers_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Reviewers_tb]  WITH CHECK ADD  CONSTRAINT [FK_Reviewers_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Reviewers_tb] CHECK CONSTRAINT [FK_Reviewers_OrderID]
GO
