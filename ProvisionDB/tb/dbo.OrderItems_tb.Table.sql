USE [ProvisionDB]
GO
/****** Object:  Table [dbo].[OrderItems_tb]    Script Item: 07/21/2019 03:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderItems_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Login] [varchar](50) NULL,
	[Item] [varchar](250) NULL,
	[Qty] [int] NULL,
	[Total] [money] NULL,
	[Tax] [money] NULL,
	[RD] [datetime] NULL,
 CONSTRAINT [PK_OrderItems_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[OrderItems_tb]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[OrderItems_tb] CHECK CONSTRAINT [FK_OrderItems_OrderID]
GO
