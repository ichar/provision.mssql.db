USE [ProvisionDB]
GO
/****** Object:  Trigger [Reviews_Log_Del_trg]    Script Date: 10/26/2020 05:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Reviews_Log_Del_trg] on [dbo].[Reviews_tb]
for delete
as
  INSERT INTO [dbo].[Reviews_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [Login], [RD], 'D' from deleted
GO
