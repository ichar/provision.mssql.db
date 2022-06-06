USE [ProvisionDB]
GO
/****** Object:  Table [dbo].[Orders_Log_tb]    Script Date: 29.01.2020 12:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders_Log_tb](
	[LID] [int] IDENTITY(1,1) NOT NULL,
	[TID] [int] NOT NULL,
	[Status] [int] NULL,
	[EditedBy] [varchar](50) NULL,
	[RD] [datetime] NULL,
	[Oper] [char](1) NOT NULL,
 CONSTRAINT [PK_Orders_Log_LID] PRIMARY KEY CLUSTERED 
(
	[LID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reviews_Log_tb]    Script Date: 29.01.2020 12:26:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[WEB_SemaphoreEvents_sp]    Script Date: 29.01.2020 12:26:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================
-- Author:      Kharlamov
-- Create date: 20200129
-- Description: Semaphore of ProvisionDB Events 
-- ============================================

CREATE PROCEDURE [dbo].[WEB_SemaphoreEvents_sp] 
    @p_Mode        int,
    @p_OrderLogID  int,
    @p_ReviewLogID int,
    @p_LogDateTime datetime,
    @p_OUT         varchar(100) OUTPUT
AS
BEGIN
    DECLARE 
        @l_current_order_log_id  int,
        @l_current_review_log_id int

    select top 1 @l_current_order_log_id = LID from [dbo].[Orders_Log_tb] order by LID desc
    select top 1 @l_current_review_log_id = LID from [dbo].[Reviews_Log_tb] order by LID desc

    if @p_Mode = 0
        SELECT @l_current_order_log_id, @l_current_review_log_id FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[WEB_SemaphoreEvents_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else if @p_Mode = 1
        select 
            cast(LID as varchar) + ':0' as LID,
            Status,
            Oper
        from [dbo].[Orders_Log_tb] 
        where LID > @p_OrderLogID
        UNION
        select 
            '0:' + cast(LID as varchar) as LID,
            Status,
            Oper
        from [dbo].[Reviews_Log_tb] 
        where LID > @p_ReviewLogID
        order by LID
END

GO
/****** Object:  Trigger [dbo].[Orders_Log_Del_trg]    Script Date: 29.01.2020 12:26:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Orders_Log_Del_trg] on [dbo].[Orders_tb]
for delete
as
  INSERT INTO [dbo].[Orders_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [EditedBy], [RD], 'D' from deleted

GO
/****** Object:  Trigger [dbo].[Orders_Log_Ins_trg]    Script Date: 29.01.2020 12:26:14 ******/
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
/****** Object:  Trigger [dbo].[Orders_Log_Upd_trg]    Script Date: 29.01.2020 12:26:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Orders_Log_Upd_trg] on [dbo].[Orders_tb]
for update
as
  INSERT INTO [dbo].[Orders_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [EditedBy], [RD], 'U' from inserted

GO
/****** Object:  Trigger [dbo].[Reviews_Log_Del_trg]    Script Date: 29.01.2020 12:26:14 ******/
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
/****** Object:  Trigger [dbo].[Reviews_Log_Ins_trg]    Script Date: 29.01.2020 12:26:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Reviews_Log_Ins_trg] on [dbo].[Reviews_tb]
for insert
as
  INSERT INTO [dbo].[Reviews_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [Login], [RD], 'I' from inserted

GO
/****** Object:  Trigger [dbo].[Reviews_Log_Upd_trg]    Script Date: 29.01.2020 12:26:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Reviews_Log_Upd_trg] on [dbo].[Reviews_tb]
for update
as
  INSERT INTO [dbo].[Reviews_Log_tb]
  ([TID], [Status], [EditedBy], [RD], [Oper])
  select [TID], [Status], [Login], [RD], 'U' from inserted

GO
