USE [ProvisionDB]
GO
/****** Object:  Table [dbo].[OrderDates_tb]    Script Date: 31.03.2022 14:27:54 ******/
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
	[FinishDueDate] [datetime] NULL,
	[AuditDate] [datetime] NULL,
	[Validated] [datetime] NULL,
	[Facsimile] [varchar](50) NULL,
 CONSTRAINT [PK_OrderDates_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [WX_OrderDates_OrderID]    Script Date: 31.03.2022 14:27:54 ******/
CREATE NONCLUSTERED INDEX [WX_OrderDates_OrderID] ON [dbo].[OrderDates_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDates_tb]  WITH CHECK ADD  CONSTRAINT [FK_OrderDates_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[OrderDates_tb] CHECK CONSTRAINT [FK_OrderDates_OrderID]
GO
