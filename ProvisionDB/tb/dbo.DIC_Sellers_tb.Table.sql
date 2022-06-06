USE [ProvisionDB]
GO
/****** Object:  Table [dbo].[DIC_Sellers_tb]    Script Date: 31.03.2022 14:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIC_Sellers_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Title] [varchar](250) NULL,
	[Address] [varchar](1000) NULL,
	[Code] [varchar](20) NULL,
	[Type] [int] NULL,
	[Contact] [varchar](200) NULL,
	[URL] [varchar](200) NULL,
	[Phone] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[EditedBy] [varchar](50) NULL,
	[RD] [datetime] NULL,
	[MD] [int] NULL,
 CONSTRAINT [PK_Sellers] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_Sellers_Name]    Script Date: 31.03.2022 14:27:54 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_Sellers_Name] ON [dbo].[DIC_Sellers_tb]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
