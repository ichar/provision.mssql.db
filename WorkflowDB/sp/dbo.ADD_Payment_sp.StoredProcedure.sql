USE [WorkflowDB]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Payment_sp]    Script Date: 24.01.2022 14:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- ADD NEW PROVISION PAYMENT
-- -------------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[ADD_Payment_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_PaymentID        int,
    @p_Login            varchar(50),
    @p_NewPayment       varchar(50),
    @p_PaymentDate      datetime,
    @p_Total            float,
    @p_Tax              float,
    @p_Currency         varchar(10),
    @p_Rate             float,
    @p_Status           int,
    @p_Comment          varchar(1000),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_TID          int = null,
        @l_PaymentID    int = null,
        @l_PaymentName  varchar(50),
        @l_Value        varchar(100),
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        if @p_PaymentID is NULL or @p_PaymentID = 0 begin
            select @l_PaymentID = TID from [dbo].[DIC_Payments_tb] where Name=@p_NewPayment
            if @l_PaymentID is NULL begin
                insert into [dbo].[DIC_Payments_tb](Name) values(@p_NewPayment)
                select @l_PaymentID = CAST(scope_identity() AS int)
            end
        end else
            set @l_PaymentID = @p_PaymentID

        if @p_ID > 0 begin
            UPDATE [dbo].[Payments_tb] SET
                OrderID=@p_OrderID,
                PaymentID=@l_PaymentID,
                Login=@p_Login,
                PaymentDate=@p_PaymentDate,
                Total=@p_Total,
                Tax=@p_Tax,
                Currency=@p_Currency,
                Rate=@p_Rate,
                Status=@p_Status,
                Comment=@p_Comment,
                RD=@l_now
            WHERE TID=@p_ID

            set @l_TID = @p_ID
            set @p_Output = 'Updated'
        end else begin
            INSERT INTO [dbo].[Payments_tb](
                OrderID,
                PaymentID,
                Login,
                PaymentDate,
                Total,
                Tax,
                Currency,
                Rate,
                Status,
                Comment,
                RD
            ) VALUES (
                @p_OrderID,
                @l_PaymentID,
                @p_Login,
                case when [dbo].[CHECK_IsEmpty_fn](@p_PaymentDate) = 0 then @p_PaymentDate else @l_now end,
                @p_Total,
                @p_Tax,
                @p_Currency,
                @p_Rate,
                @p_Status,
                @p_Comment,
                @l_now
            )
    
            select @l_TID = CAST(scope_identity() AS int)
            set @p_Output = 'Registered'
        end
        --
        -- Get Payment name and value
        --
        select top 1 @l_PaymentName = Purpose, @l_Value = 
            'Дата: '   + cast(PaymentDate as varchar) + '; ' + 
            'Сумма: '  + cast(Total as varchar) + '; ' + 
            'НДС: '    + cast(Tax as varchar) + '; ' + 
            'Валюта: ' + Currency + '; ' + 
            'Курс: '   + cast(Rate as varchar) + '; ' + 
            'Статус:'  + cast(Status as varchar)
        from [dbo].[WEB_OrderPayments_vw] where TID=@l_TID
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Платежи:' + @l_PaymentName, @l_Value + case when @p_Comment > '' then ' [' + @p_Comment + ']' else '' end)
        --
        -- Add to Payment Changes log
        --
        INSERT INTO [dbo].[PaymentChanges_tb](
            PaymentID, 
            OrderID, 
            Login, 
            Status, 
            RD
        ) VALUES (
            @l_TID,
            @p_OrderID,
            @p_Login,
            @p_Status,
            @l_now
        )

    end else begin
        set @l_TID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_TID as varchar) + ':' + cast(@l_PaymentID as varchar)

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[ADD_Payment_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
