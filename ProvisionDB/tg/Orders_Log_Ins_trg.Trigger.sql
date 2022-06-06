USE [ProvisionDB]
GO
/****** Object:  Trigger [Orders_Log_Ins_trg]    Script Date: 10/26/2020 05:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Orders_Log_Ins_trg] on [dbo].[Orders_tb]
for insert
as
  INSERT INTO [dbo].[Orders_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [EditedBy], [RD], 'I' from inserted
GO
