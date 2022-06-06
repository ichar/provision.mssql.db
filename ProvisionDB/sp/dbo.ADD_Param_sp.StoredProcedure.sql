USE [ProvisionDB]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Param_sp]    Script Date: 03.09.2019 16:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- ADD NEW PROVISION PARAM
-- -----------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
ALTER PROCEDURE [dbo].[ADD_Param_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_ParamID          int,
    @p_Login            varchar(50),
    @p_NewParam         varchar(50),
    @p_Value            varchar(500),
    @p_MD               int,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_ParamID      int = null,
        @l_TID          int = null,
        @l_ParamName    varchar(50),
        @l_ParamCode    varchar(10),
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        --
        -- Check Params Reference
        --
        if @p_ParamID is null or @p_ParamID = 0 begin
            select @l_ParamID=TID from [dbo].[DIC_Params_tb] where Name=@p_NewParam and (MD=@p_MD or MD is null)
            if @l_ParamID is null begin
                INSERT INTO [dbo].[DIC_Params_tb](Name, MD) VALUES(@p_NewParam, @p_MD)
                select @l_ParamID = CAST(scope_identity() AS int)
            end
        end else
            set @l_ParamID = @p_ParamID
        --
        -- Get Param name and value
        --
        select top 1 @l_ParamName=Name, @l_ParamCode=Code from [dbo].[DIC_Params_tb] where TID=@l_ParamID
        set @p_Value = [dbo].[Strip_fn](@p_Value)
        --
        -- Check if this is Reviewer line
        --
        set @exists = 0

        if @l_ParamCode = 'RW' and [dbo].[CHECK_IsEmpty_fn](@p_Value) = 0 begin
            select @exists=1 from [dbo].[Reviewers_tb] where OrderID=@p_OrderID and Login=@p_Value

            if @exists = 0
                INSERT INTO [dbo].[Reviewers_tb] VALUES (
                    @p_OrderID,
                    @p_Value
                )

            set @l_TID = null
            set @exists = 1
        end

        else if @l_ParamCode = 'AC' and [dbo].[CHECK_IsEmpty_fn](@p_Value) = 0
            UPDATE [dbo].[Orders_tb] SET Account=@p_Value where TID=@p_OrderID

        else if @l_ParamCode = 'DE' and [dbo].[CHECK_IsEmpty_fn](@p_Value) = 0
            UPDATE [dbo].[OrderDates_tb] SET FinishDueDate=@p_Value where OrderID=@p_OrderID

        if @exists = 0 begin
            if @p_ID = 0 and @p_MD < 10
                select top 1 @l_TID=TID from [dbo].[Params_tb] where OrderID=@p_OrderID and ParamID=@l_ParamID
            else
                set @l_TID = @p_ID
        end

        if @l_TID > 0 begin
            UPDATE [dbo].[Params_tb] SET
                OrderID=@p_OrderID,
                ParamID=@l_ParamID,
                Login=@p_Login,
                Value=@p_Value,
                RD=@l_now
            WHERE TID=@l_TID

            set @p_Output = 'Updated'
        end else begin
            INSERT INTO [dbo].[Params_tb](
                OrderID,
                ParamID,
                Login,
                Value,
                RD
            ) VALUES (
                @p_OrderID,
                @l_ParamID,
                @p_Login,
                @p_Value,
                @l_now
            )

            select @l_TID = CAST(scope_identity() AS int)
            set @p_Output = 'Registered'
        end
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Параметры:' + @l_ParamName, @p_Value)

        if @@error != 0
            raiserror('ошибка обработки',16,1)
    end else begin
        set @l_TID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_TID as varchar) + ':' + cast(@l_ParamID as varchar)

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[ADD_Param_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END

GO
