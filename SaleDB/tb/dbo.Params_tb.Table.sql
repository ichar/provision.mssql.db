USE [SaleDB]
GO
/****** Object:  Table [dbo].[Params_tb]    Script Date: 29.01.2022 8:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Params_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ParamID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Value] [varchar](500) NULL,
	[RD] [datetime] NULL,
 CONSTRAINT [PK_Params_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [WX_Params_OrderID]    Script Date: 29.01.2022 8:08:48 ******/
CREATE NONCLUSTERED INDEX [WX_Params_OrderID] ON [dbo].[Params_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [WX_Params_ParamID]    Script Date: 29.01.2022 8:08:48 ******/
CREATE NONCLUSTERED INDEX [WX_Params_ParamID] ON [dbo].[Params_tb]
(
	[ParamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Params_tb] ADD  CONSTRAINT [DF_Params_RD]  DEFAULT (getdate()) FOR [RD]
GO
ALTER TABLE [dbo].[Params_tb]  WITH CHECK ADD  CONSTRAINT [FK_Params_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders_tb] ([TID])
GO
ALTER TABLE [dbo].[Params_tb] CHECK CONSTRAINT [FK_Params_OrderID]
GO
ALTER TABLE [dbo].[Params_tb]  WITH CHECK ADD  CONSTRAINT [FK_Params_ParamID] FOREIGN KEY([ParamID])
REFERENCES [dbo].[DIC_Params_tb] ([TID])
GO
ALTER TABLE [dbo].[Params_tb] CHECK CONSTRAINT [FK_Params_ParamID]
GO
