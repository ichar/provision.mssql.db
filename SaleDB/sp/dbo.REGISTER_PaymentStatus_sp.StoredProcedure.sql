USE [SaleDB]
GO
/****** Object:  StoredProcedure [dbo].[REGISTER_PaymentStatus_sp]    Script Date: 29.01.2022 8:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[REGISTER_PaymentStatus_sp] 
    @p_Mode             int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Status           int,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_PaymentID    int = null,
        @l_OrderID      int = null,
        @l_PaymentDate  datetime,
        @l_PaymentName  varchar(50),
        @l_Value        varchar(100),
        @l_today        datetime,
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @l_OrderID=OrderID, @l_PaymentDate=PaymentDate from [dbo].[Payments_tb] where TID=@p_ID

    set @p_Output = ''

    if @l_OrderID > 0
    begin
        set @l_today = convert(varchar(10), getdate(), 120)
        if @l_PaymentDate < @l_today and @p_Status = 2
            set @l_PaymentDate = @l_today

        UPDATE [dbo].[Payments_tb] SET
            Status=@p_Status,
            PaymentDate=@l_PaymentDate
        WHERE TID=@p_ID
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
        from [dbo].[WEB_OrderPayments_vw] where TID=@p_ID
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@l_OrderID, @p_Login, 'Платежи:' + @l_PaymentName, @l_Value)
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
            @p_ID,
            @l_OrderID,
            @p_Login,
            @p_Status,
            @l_now
        )

        set @l_PaymentID = @p_ID
        set @p_Output = 'Refreshed'
    end else begin
        set @l_PaymentID = 0
        set @p_Output = 'Invalid' 
            + ':' + case when @l_PaymentID is null then 'NULL' else cast(@l_PaymentID as varchar) end
            + ':' + cast(@exists as varchar)
    end

    set @p_Output = @p_Output + ':' + cast(@l_PaymentID as varchar) + ':' + convert(varchar(10), @l_PaymentDate, 120)

    if @p_Mode = 0
        SELECT @l_PaymentID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[REGISTER_PaymentStatus_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
