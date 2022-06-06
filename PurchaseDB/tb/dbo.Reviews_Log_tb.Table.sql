USE [PurchaseDB]
GO
/****** Object:  Table [dbo].[Reviews_Log_tb]    Script Date: 29.01.2022 8:11:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
