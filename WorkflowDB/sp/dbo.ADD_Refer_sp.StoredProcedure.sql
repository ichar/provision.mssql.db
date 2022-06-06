USE [WorkflowDB]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Refer_sp]    Script Date: 24.01.2022 14:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- ADD NEW PROVISION REFER
-- -----------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[ADD_Refer_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_ReferID          int,
    @p_Login            varchar(50),
    @p_NewRefer         varchar(50),
    @p_Value            int,
    @p_Note             varchar(1000),
    @p_MD               int,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_ReferID      int = null,
        @l_TID          int = null,
        @l_ReferName    varchar(50),
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_Value

    if @exists = 1
    begin
        --
        -- Check Refers Reference
        --
        if @p_ReferID is null or @p_ReferID = 0 begin
            select @l_ReferID=TID from [dbo].[DIC_Refers_tb] where Name=@p_NewRefer and (MD=@p_MD or MD is null)
            if @l_ReferID is null begin
                INSERT INTO [dbo].[DIC_Refers_tb](Name, MD) VALUES(@p_NewRefer, @p_MD)
                select @l_ReferID = CAST(scope_identity() AS int)
            end
        end else
            set @l_ReferID = @p_ReferID
        --
        -- Get Refer name and value
        --
        select top 1 @l_ReferName=Name from [dbo].[DIC_Refers_tb] where TID=@l_ReferID
        --
        -- Check if this is OrderRefer line (like as Params extentions)
        --
        set @exists = 0

        if @exists = 0 begin
            if @p_ID = 0
                set @l_TID = 0
            else
                set @l_TID = @p_ID
        end

        if @l_TID > 0 begin
            UPDATE [dbo].[OrderRefers_tb] SET
                OrderID=@p_OrderID,
                ReferID=@l_ReferID,
                OrderReferID=@p_Value,
                Login=@p_Login,
                Note=@p_Note,
                RD=@l_now
            WHERE TID=@l_TID

            set @p_Output = 'Updated'
        end else begin
            INSERT INTO [dbo].[OrderRefers_tb](
                OrderID,
                ReferID,
                OrderReferID,
                Login,
                Note,
                RD
            ) VALUES (
                @p_OrderID,
                @l_ReferID,
                @p_Value,
                @p_Login,
                @p_Note,
                @l_now
            )

            select @l_TID = CAST(scope_identity() AS int)
            set @p_Output = 'Registered'
        end
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, '—сылки:' + @l_ReferName, @p_Value)

        if @@error != 0
            raiserror('ошибка обработки',16,1)
    end else begin
        set @l_TID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_TID as varchar) + ':' + cast(@l_ReferID as varchar)

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[ADD_Refer_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
