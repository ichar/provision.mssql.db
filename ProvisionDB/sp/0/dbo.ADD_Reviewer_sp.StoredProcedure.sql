USE [ProvisionDB]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Reviewer_sp]    Script Date: 03.09.2019 16:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- ADD NEW PROVISION REVIEWER
-- --------------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[ADD_Reviewer_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_Login            varchar(50),
    @p_Value            varchar(50),
    @p_MD               int,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_TID          int = null,
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        set @p_Value = [dbo].[Strip_fn](@p_Value)
        --
        -- Check if this is Reviewer line
        --
        set @exists = 0

        if [dbo].[CHECK_IsEmpty_fn](@p_Value) = 0 begin
            select @exists=1 from [dbo].[Reviewers_tb] where OrderID=@p_OrderID and Login=@p_Value

            if @exists = 0
                INSERT INTO [dbo].[Reviewers_tb] VALUES (
                    @p_OrderID,
                    @p_Value
                )

            select @l_TID = CAST(scope_identity() AS int)
            set @p_Output = 'Registered'
        end
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Назначен рецензент', @p_Value)

        if @@error != 0
            raiserror('ошибка обработки',16,1)
    end else begin
        set @l_TID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_TID as varchar)

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[ADD_Reviewer_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END

GO
