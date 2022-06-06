USE [PurchaseDB]
GO
/****** Object:  Table [dbo].[DIC_Equipments_tb]    Script Date: 29.01.2022 8:11:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIC_Equipments_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[SubdivisionID] [int] NOT NULL,
	[Name] [varchar](1000) NULL,
	[Title] [varchar](1000) NULL,
 CONSTRAINT [PK_Equipments] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_Equipments_Title]    Script Date: 29.01.2022 8:11:56 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_Equipments_Title] ON [dbo].[DIC_Equipments_tb]
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DIC_Equipments_tb]  WITH CHECK ADD  CONSTRAINT [FK_DIC_Equipments_SubdivisionID] FOREIGN KEY([SubdivisionID])
REFERENCES [dbo].[DIC_Subdivisions_tb] ([TID])
GO
ALTER TABLE [dbo].[DIC_Equipments_tb] CHECK CONSTRAINT [FK_DIC_Equipments_SubdivisionID]
GO
