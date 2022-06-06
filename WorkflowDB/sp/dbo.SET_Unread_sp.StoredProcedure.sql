USE [WorkflowDB]
GO
/****** Object:  StoredProcedure [dbo].[SET_Unread_sp]    Script Date: 24.01.2022 14:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- SET UNREAD FLAG
-- ---------------
--   @p_OrderID      -- Order ID
--   @p_Logins       -- users login list, string with delimeter '|'
--
CREATE PROCEDURE [dbo].[SET_Unread_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_Logins           varchar(250),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_Login        varchar(50),
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        INSERT INTO [dbo].[Unreads_tb]
        select @p_OrderID as OrderID, item as Login from [dbo].[GET_SplittedStrings_fn](@p_Logins, '|')

        set @p_Output = 'Done'
    end else begin
        set @p_Output = 'Invalid'
    end

    if @p_Mode = 0
        SELECT @p_OrderID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[SET_Unread_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
