USE [ProvisionDB]
GO
/****** Object:  Table [dbo].[DIC_StockList_tb]    Script Date: 18.12.2019 13:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DIC_StockList_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Title] [varchar](250) NULL,
	[ShortName] [varchar](50) NOT NULL,
	[NodeLevel] [int] NULL,
	[NodeCode] [varchar](100) NOT NULL,
	[RefCode1C] [varchar](20) NULL,
	[Comment] [varchar](1000) NOT NULL,
	[EditedBy] [varchar](50) NULL,
	[RD] [datetime] NULL CONSTRAINT [DF_DIC_StockList_RD]  DEFAULT (getdate()),
 CONSTRAINT [PK_DIC_StockList_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[DIC_StockList_tb] ON 

INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (1, N'Оборудование', NULL, N'', 1, N'0000', N'00000001644', N'Основное производство', NULL, CAST(N'2019-12-18 09:25:01.717' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (2, N'Сырье', NULL, N'', 1, N'0001', N'00000003570', N'Основное производство', NULL, CAST(N'2019-12-18 09:25:15.860' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (3, N'Материалы', NULL, N'', 1, N'0002', N'000003000', N'Основное производство', NULL, CAST(N'2019-12-18 09:25:37.747' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (4, N'Комплектующие', NULL, N'', 1, N'0003', N'000004000', N'Основное производство', NULL, CAST(N'2019-12-18 09:25:56.407' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (5, N'Компьютерная техника', NULL, N'', 1, N'0004', N'000005000', N'', NULL, CAST(N'2019-12-18 09:26:20.393' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (6, N'Орг.техника', NULL, N'', 1, N'0005', N'000006000', N'', NULL, CAST(N'2019-12-18 09:26:44.067' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (7, N'Услуги', NULL, N'', 1, N'0006', N'000007000', N'', NULL, CAST(N'2019-12-18 09:27:02.453' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (8, N'Бытовая техника', NULL, N'', 1, N'0007', N'000008000', N'', NULL, CAST(N'2019-12-18 09:27:20.510' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (9, N'Предметы обихода', NULL, N'', 1, N'0008', N'000009000', N'', NULL, CAST(N'2019-12-18 09:27:42.500' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (10, N'Компьютеры', NULL, N'', 2, N'0004.0000', N'', N'', NULL, CAST(N'2019-12-18 09:28:54.653' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (11, N'Комплектующие', NULL, N'', 2, N'0004.0001', N'', N'', NULL, CAST(N'2019-12-18 09:29:03.890' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (12, N'ПК', NULL, N'', 3, N'0004.0000.0000', N'', N'', NULL, CAST(N'2019-12-18 09:29:20.283' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (13, N'Сервер', NULL, N'', 3, N'0004.0000.0001', N'', N'', NULL, CAST(N'2019-12-18 09:29:29.003' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (14, N'Ноутбук', NULL, N'', 3, N'0004.0000.0002', N'', N'', NULL, CAST(N'2019-12-18 09:29:36.913' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (15, N'Моноблок', NULL, N'', 3, N'0004.0000.0003', N'', N'', NULL, CAST(N'2019-12-18 09:29:45.553' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (16, N'Периферия', NULL, N'', 2, N'0004.0002', N'', N'', NULL, CAST(N'2019-12-18 09:30:31.157' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (17, N'ОЗУ', NULL, N'', 3, N'0004.0001.0000', N'', N'', NULL, CAST(N'2019-12-18 09:31:06.797' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (18, N'Материнская плата', NULL, N'', 3, N'0004.0001.0001', N'', N'', NULL, CAST(N'2019-12-18 09:31:18.507' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (19, N'Диски', NULL, N'', 3, N'0004.0001.0002', N'', N'', NULL, CAST(N'2019-12-18 09:31:32.340' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (20, N'HDD', NULL, N'', 4, N'0004.0001.0002.0000', N'', N'', NULL, CAST(N'2019-12-18 09:32:11.570' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (21, N'SSD', NULL, N'', 4, N'0004.0001.0002.0001', N'', N'', NULL, CAST(N'2019-12-18 09:32:17.733' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (22, N'FlashDisk', NULL, N'', 4, N'0004.0001.0002.0002', N'', N'', NULL, CAST(N'2019-12-18 09:32:28.580' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (23, N'Сетевое оборудование', NULL, N'', 3, N'0004.0001.0003', N'', N'', NULL, CAST(N'2019-12-18 09:33:12.957' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (24, N'Бумага', NULL, N'', 2, N'0001.0000', N'00000003354', N'', NULL, CAST(N'2019-12-18 09:58:53.527' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (25, N'Голограмма', NULL, N'', 2, N'0001.0001', N'00000003351', N'', NULL, CAST(N'2019-12-18 09:59:14.770' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (26, N'Краска', NULL, N'', 2, N'0001.0002', N'00000003353', N'', NULL, CAST(N'2019-12-18 09:59:31.950' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (27, N'Ламинат', NULL, N'', 2, N'0001.0003', N'00000003348', N'', NULL, CAST(N'2019-12-18 09:59:52.103' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (28, N'Магнитная полоса', NULL, N'', 2, N'0001.0004', N'00000003349', N'', NULL, CAST(N'2019-12-18 10:00:06.157' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (29, N'Пластик', NULL, N'', 2, N'0001.0005', N'00000003347', N'', NULL, CAST(N'2019-12-18 10:00:24.803' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (30, N'Полоса для подписи', NULL, N'', 2, N'0001.0006', N'00000003352', N'', NULL, CAST(N'2019-12-18 10:00:40.700' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (31, N'Преламинат', NULL, N'', 2, N'0001.0007', N'00000003360', N'', NULL, CAST(N'2019-12-18 10:00:58.987' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (32, N'Чипы и расходники', NULL, N'', 2, N'0001.0008', N'00000003350', N'', NULL, CAST(N'2019-12-18 10:01:16.650' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (33, N'Карта белая', NULL, N'', 3, N'0001.0008.0000', N'', N'', NULL, CAST(N'2019-12-18 10:04:08.730' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (34, N'Чип-модуль', NULL, N'', 3, N'0001.0008.0001', N'', N'', NULL, CAST(N'2019-12-18 10:04:58.410' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (35, N'KONA', NULL, N'', 4, N'0001.0008.0001.0000', N'', N'', NULL, CAST(N'2019-12-18 10:05:36.753' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (36, N'G&D Convego', NULL, N'', 4, N'0001.0008.0001.0001', N'', N'', NULL, CAST(N'2019-12-18 10:06:04.683' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (37, N'Optelio', NULL, N'', 4, N'0001.0008.0001.0002', N'', N'', NULL, CAST(N'2019-12-18 10:06:25.160' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (38, N'Secora Pay', NULL, N'', 4, N'0001.0008.0001.0003', N'', N'', NULL, CAST(N'2019-12-18 10:06:44.300' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (39, N'101', NULL, N'', 5, N'0001.0008.0001.0000.0000', N'', N'', NULL, CAST(N'2019-12-18 10:08:18.957' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (40, N'121', NULL, N'', 5, N'0001.0008.0001.0000.0001', N'', N'', NULL, CAST(N'2019-12-18 10:08:28.993' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (41, N'132', NULL, N'', 5, N'0001.0008.0001.0000.0002', N'', N'', NULL, CAST(N'2019-12-18 10:08:38.620' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (42, N'151S', NULL, N'', 5, N'0001.0008.0001.0000.0003', N'', N'', NULL, CAST(N'2019-12-18 10:08:52.123' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (43, N'2 C2200S', NULL, N'', 5, N'0001.0008.0001.0000.0004', N'', N'', NULL, CAST(N'2019-12-18 10:09:16.027' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (44, N'2 C2304', NULL, N'', 5, N'0001.0008.0001.0000.0005', N'', N'', NULL, CAST(N'2019-12-18 10:09:35.910' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (45, N'2 D1025', NULL, N'', 5, N'0001.0008.0001.0000.0006', N'', N'', NULL, CAST(N'2019-12-18 10:09:51.730' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (46, N'2 D1040', NULL, N'', 5, N'0001.0008.0001.0000.0007', N'', N'', NULL, CAST(N'2019-12-18 10:10:08.973' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (47, N'2 D1080', NULL, N'', 5, N'0001.0008.0001.0000.0008', N'', N'', NULL, CAST(N'2019-12-18 10:10:26.140' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (48, N'2 D1081', NULL, N'', 5, N'0001.0008.0001.0000.0009', N'', N'', NULL, CAST(N'2019-12-18 10:11:08.047' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (49, N'2 D2320', NULL, N'', 5, N'0001.0008.0001.0000.0010', N'', N'', NULL, CAST(N'2019-12-18 10:23:34.730' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (50, N'2200 MIR', NULL, N'', 5, N'0001.0008.0001.0000.0011', N'', N'', NULL, CAST(N'2019-12-18 10:24:01.870' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (51, N'D2320 8pin', NULL, N'', 5, N'0001.0008.0001.0000.0012', N'', N'', NULL, CAST(N'2019-12-18 10:24:47.507' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (52, N'233', NULL, N'', 5, N'0001.0008.0001.0000.0013', N'', N'', NULL, CAST(N'2019-12-18 10:25:15.180' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (53, N'251', NULL, N'', 5, N'0001.0008.0001.0000.0014', N'', N'', NULL, CAST(N'2019-12-18 10:25:27.533' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (54, N'251S', NULL, N'', 5, N'0001.0008.0001.0000.0015', N'', N'', NULL, CAST(N'2019-12-18 10:25:34.717' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (55, N'261', NULL, N'', 5, N'0001.0008.0001.0000.0016', N'', N'', NULL, CAST(N'2019-12-18 10:25:58.907' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (56, N'4.8', NULL, N'', 6, N'0001.0008.0001.0001.0000.0000', N'', N'', NULL, CAST(N'2019-12-18 10:26:38.733' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (57, N'6.2', NULL, N'', 6, N'0001.0008.0001.0001.0000.0001', N'', N'', NULL, CAST(N'2019-12-18 10:26:53.370' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (58, N'6.45', NULL, N'', 6, N'0001.0008.0001.0001.0000.0002', N'', N'', NULL, CAST(N'2019-12-18 10:27:02.637' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (59, N'7.2', NULL, N'', 6, N'0001.0008.0001.0001.0000.0003', N'', N'', NULL, CAST(N'2019-12-18 10:27:17.210' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (60, N'M40-08D-040', NULL, N'', 6, N'0001.0008.0001.0001.0000.0004', N'', N'', NULL, CAST(N'2019-12-18 10:27:38.403' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (61, N'V14-M40-04S-030', NULL, N'', 6, N'0001.0008.0001.0001.0000.0005', N'', N'', NULL, CAST(N'2019-12-18 10:28:02.747' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (62, N'V14-M40-10D-010', NULL, N'', 6, N'0001.0008.0001.0001.0000.0006', N'', N'', NULL, CAST(N'2019-12-18 10:28:20.047' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (63, N'V14-M40-8D-040', NULL, N'', 6, N'0001.0008.0001.0001.0000.0007', N'', N'', NULL, CAST(N'2019-12-18 10:28:46.170' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (64, N'V15-04S-020', NULL, N'', 6, N'0001.0008.0001.0001.0000.0008', N'', N'', NULL, CAST(N'2019-12-18 10:29:03.663' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (68, N'Element', NULL, N'', 5, N'0001.0008.0001.0001.0000', N'', N'', NULL, CAST(N'2019-12-18 10:35:52.673' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (69, N'Join', NULL, N'', 5, N'0001.0008.0001.0001.0001', N'', N'', NULL, CAST(N'2019-12-18 10:48:46.373' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (70, N'3.45', NULL, N'', 6, N'0001.0008.0001.0001.0001.0000', N'', N'', NULL, CAST(N'2019-12-18 10:49:35.630' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (71, N'4.42 DI', NULL, N'', 6, N'0001.0008.0001.0001.0001.0001', N'', N'', NULL, CAST(N'2019-12-18 10:49:57.473' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (72, N'4.45 DI', NULL, N'', 6, N'0001.0008.0001.0001.0001.0002', N'', N'', NULL, CAST(N'2019-12-18 10:50:05.410' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (73, N'4.65 DI', NULL, N'', 6, N'0001.0008.0001.0001.0001.0003', N'', N'', NULL, CAST(N'2019-12-18 10:50:17.877' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (74, N'4.65 MA1-10D-8150', NULL, N'', 6, N'0001.0008.0001.0001.0001.0004', N'', N'', NULL, CAST(N'2019-12-18 10:50:40.987' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (75, N'4.65 MA1-34D', NULL, N'', 6, N'0001.0008.0001.0001.0001.0005', N'', N'', NULL, CAST(N'2019-12-18 10:51:02.640' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (76, N'4.65 V15-40D', NULL, N'', 6, N'0001.0008.0001.0001.0001.0006', N'', N'', NULL, CAST(N'2019-12-18 10:51:27.840' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (77, N'DI 4.80 MA1-MD', NULL, N'', 6, N'0001.0008.0001.0001.0001.0007', N'', N'', NULL, CAST(N'2019-12-18 10:52:48.683' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (78, N'DI 4.80 NON-LD', NULL, N'', 6, N'0001.0008.0001.0001.0001.0008', N'', N'', NULL, CAST(N'2019-12-18 10:53:15.763' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (79, N'DI 4.80 V15-MD', NULL, N'', 6, N'0001.0008.0001.0001.0001.0009', N'', N'', NULL, CAST(N'2019-12-18 10:53:38.057' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (80, N'S', NULL, N'', 5, N'0001.0008.0001.0003.0000', N'', N'', NULL, CAST(N'2019-12-18 10:54:34.260' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (81, N'SCA', NULL, N'', 5, N'0001.0008.0001.0003.0001', N'', N'', NULL, CAST(N'2019-12-18 10:54:43.290' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (82, N'SLJ32PDE080X2 COM8.4', NULL, N'', 5, N'0001.0008.0001.0003.0002', N'', N'', NULL, CAST(N'2019-12-18 10:55:09.093' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (83, N'American Express', NULL, N'', 3, N'0001.0006.0000', N'', N'', NULL, CAST(N'2019-12-18 12:43:56.190' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (84, N'Maestro', NULL, N'', 3, N'0001.0006.0001', N'', N'', NULL, CAST(N'2019-12-18 12:44:18.193' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (85, N'MasterCard', NULL, N'', 3, N'0001.0006.0002', N'', N'', NULL, CAST(N'2019-12-18 12:44:36.203' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (86, N'Union Card', NULL, N'', 3, N'0001.0006.0003', N'', N'', NULL, CAST(N'2019-12-18 12:44:55.507' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (87, N'VISA', NULL, N'', 3, N'0001.0006.0004', N'', N'', NULL, CAST(N'2019-12-18 12:45:06.797' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (88, N'МИР', NULL, N'', 3, N'0001.0006.0005', N'', N'', NULL, CAST(N'2019-12-18 12:45:17.130' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (89, N'Русский стандарт', NULL, N'', 3, N'0001.0006.0006', N'', N'', NULL, CAST(N'2019-12-18 12:45:37.130' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (90, N'JCB', NULL, N'', 3, N'0001.0006.0007', N'', N'', NULL, CAST(N'2019-12-18 12:45:49.710' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (91, N'China UnionPay', NULL, N'', 3, N'0001.0006.0008', N'', N'', NULL, CAST(N'2019-12-18 12:46:05.897' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (92, N'ВЕРИЛИОН Vericard', NULL, N'', 3, N'0001.0005.0000', N'', N'', NULL, CAST(N'2019-12-18 12:47:43.047' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (93, N'BILCARE SICOFFSET', NULL, N'', 3, N'0001.0005.0001', N'', N'', NULL, CAST(N'2019-12-18 12:48:14.907' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (94, N'Спринтекс', NULL, N'', 3, N'0001.0005.0002', N'', N'', NULL, CAST(N'2019-12-18 12:48:45.407' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (95, N'COMPOSECURE', NULL, N'', 3, N'0001.0005.0003', N'', N'', NULL, CAST(N'2019-12-18 12:49:05.463' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (96, N'GALLAZZI', NULL, N'', 3, N'0001.0005.0004', N'', N'', NULL, CAST(N'2019-12-18 12:49:25.587' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (97, N'Tianjin Boyuan', NULL, N'', 3, N'0001.0005.0005', N'', N'', NULL, CAST(N'2019-12-18 12:49:41.883' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (98, N'SMART LAYER', NULL, N'', 3, N'0001.0005.0006', N'', N'', NULL, CAST(N'2019-12-18 12:50:12.530' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (99, N'CFC', NULL, N'', 3, N'0001.0005.0007', N'', N'', NULL, CAST(N'2019-12-18 12:50:26.553' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (100, N'Vericard PVC', NULL, N'', 3, N'0001.0005.0008', N'', N'', NULL, CAST(N'2019-12-18 12:50:46.210' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (101, N'KAPPUS', NULL, N'', 3, N'0001.0005.0009', N'', N'', NULL, CAST(N'2019-12-18 12:51:13.060' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (102, N'American Express', NULL, N'', 3, N'0001.0001.0000', N'', N'', NULL, CAST(N'2019-12-18 12:52:52.483' AS DateTime))
GO
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (103, N'Apco', NULL, N'', 3, N'0001.0001.0001', N'', N'', NULL, CAST(N'2019-12-18 12:53:07.250' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (104, N'China UnionPay', NULL, N'', 3, N'0001.0001.0002', N'', N'', NULL, CAST(N'2019-12-18 12:53:22.630' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (105, N'JCB', NULL, N'', 3, N'0001.0001.0003', N'', N'', NULL, CAST(N'2019-12-18 12:53:37.800' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (106, N'MasterCard', NULL, N'', 3, N'0001.0001.0004', N'', N'', NULL, CAST(N'2019-12-18 12:53:45.383' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (107, N'VIP', NULL, N'', 3, N'0001.0001.0005', N'', N'', NULL, CAST(N'2019-12-18 12:53:57.347' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (108, N'VISA', NULL, N'', 3, N'0001.0001.0006', N'', N'', NULL, CAST(N'2019-12-18 12:54:02.883' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (109, N'МИР', NULL, N'', 3, N'0001.0001.0007', N'', N'', NULL, CAST(N'2019-12-18 12:54:20.213' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (110, N'Инвентарь и хоз. принадлежности', NULL, N'', 1, N'0009', N'00000000903', N'', NULL, CAST(N'2019-12-18 12:56:22.460' AS DateTime))
INSERT [dbo].[DIC_StockList_tb] ([TID], [Name], [Title], [ShortName], [NodeLevel], [NodeCode], [RefCode1C], [Comment], [EditedBy], [RD]) VALUES (111, N'ЗИП', NULL, N'', 1, N'0010', N'', N'Основное производство', NULL, CAST(N'2019-12-18 12:58:14.917' AS DateTime))
SET IDENTITY_INSERT [dbo].[DIC_StockList_tb] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_StockList_Name]    Script Date: 18.12.2019 13:06:19 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_StockList_Name] ON [dbo].[DIC_StockList_tb]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_StockList_NodeCode]    Script Date: 18.12.2019 13:06:19 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DIC_StockList_NodeCode] ON [dbo].[DIC_StockList_tb]
(
	[NodeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DIC_StockList_NodeLevel]    Script Date: 18.12.2019 13:06:19 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_StockList_NodeLevel] ON [dbo].[DIC_StockList_tb]
(
	[NodeLevel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DIC_StockList_ShortName]    Script Date: 18.12.2019 13:06:19 ******/
CREATE NONCLUSTERED INDEX [IX_DIC_StockList_ShortName] ON [dbo].[DIC_StockList_tb]
(
	[ShortName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
