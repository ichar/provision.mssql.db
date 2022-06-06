USE [WorkflowDB]
GO
/****** Object:  StoredProcedure [dbo].[DEL_Param_sp]    Script Date: 24.01.2022 14:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- DEL NEW PROVISION PAYMENT
-- -------------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[DEL_Param_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_ParamID          int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_TID          int = null,
        @l_ParamName    varchar(50),
        @l_Value        varchar(500),
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1 and @p_ID > 0
        select top 1 @l_TID=TID from [dbo].[Params_tb] where OrderID=@p_OrderID and TID=@p_ID

    if @l_TID > 0
    begin
        select top 1 @l_ParamName=Name, @l_Value=[Value] from [dbo].[WEB_OrderParams_vw] where TID=@l_TID
        set @l_Value = [dbo].[Strip_fn](@l_Value)

        if @l_ParamName = 'Роль: рецензент' and @l_Value > ''
            DELETE FROM [dbo].[Reviewers_tb] WHERE OrderID=@p_OrderID and Login=@l_Value

        DELETE FROM [dbo].[Params_tb] WHERE TID=@l_TID
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Удалено:[' + @l_ParamName + ']', @l_Value)

        set @p_Output = 'Removed'
    end else begin
        set @p_Output = 'Invalid'
    end

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[DEL_Param_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
