USE [PersonalDB]
GO
/****** Object:  Table [dbo].[Decrees_tb]    Script Date: 14.10.2021 10:53:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Decrees_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[ReviewID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Status] [int] NULL,
	[DueDate] [datetime] NULL,
	[RD] [datetime] NULL,
	[ReportID] [int] NULL,
 CONSTRAINT [PK_Decrees_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [WX_Decrees_ReviewID]    Script Date: 14.10.2021 10:53:59 ******/
CREATE NONCLUSTERED INDEX [WX_Decrees_ReviewID] ON [dbo].[Decrees_tb]
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Decrees_tb] ADD  CONSTRAINT [DF_Decrees_RD]  DEFAULT (getdate()) FOR [RD]
GO
ALTER TABLE [dbo].[Decrees_tb]  WITH CHECK ADD  CONSTRAINT [FK_Decrees_ReviewID] FOREIGN KEY([ReviewID])
REFERENCES [dbo].[Reviews_tb] ([TID])
GO
ALTER TABLE [dbo].[Decrees_tb] CHECK CONSTRAINT [FK_Decrees_ReviewID]
GO
