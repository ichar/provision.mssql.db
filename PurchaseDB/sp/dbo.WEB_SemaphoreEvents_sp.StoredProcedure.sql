USE [PurchaseDB]
GO
/****** Object:  StoredProcedure [dbo].[WEB_SemaphoreEvents_sp]    Script Date: 29.01.2022 8:11:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================
-- Author:      Kharlamov
-- Create date: 20200129
-- Description: Semaphore of PurchaseDB Events 
-- ============================================

CREATE PROCEDURE [dbo].[WEB_SemaphoreEvents_sp] 
    @p_Mode        int,
    @p_OrderLogID  int,
    @p_ReviewLogID int,
    @p_LogDateTime datetime,
    @p_OUT         varchar(100) OUTPUT
AS
BEGIN
    SET NOCOUNT ON

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
