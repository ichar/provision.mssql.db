USE [PurchaseDB]
GO
/****** Object:  StoredProcedure [dbo].[DEL_Payment_sp]    Script Date: 29.01.2022 8:11:56 ******/
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
CREATE PROCEDURE [dbo].[DEL_Payment_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_PaymentID        int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_TID          int = null,
        @l_PaymentName  varchar(50),
        @l_Value        varchar(100),
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1 and @p_ID > 0
        select @l_TID=TID from [dbo].[Payments_tb] where TID=@p_ID

    if @l_TID > 0
    begin
        --
        -- Get Payment name and value
        --
        select top 1 @l_PaymentName = Purpose, @l_Value = 
            'Дата: '  + cast(PaymentDate as varchar) + '; ' + 
            'Сумма: ' + cast(Total as varchar) + '; ' + 
            'НДС: '   + cast(Tax as varchar) + '; ' + 
            'Статус:' + cast(Status as varchar)
        from [dbo].[WEB_OrderPayments_vw] where TID=@l_TID

        DELETE FROM [dbo].[PaymentChanges_tb] WHERE PaymentID=@l_TID
        DELETE FROM [dbo].[Payments_tb] WHERE TID=@l_TID
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Удалено:[' + @l_PaymentName + ']', @l_Value)
        
        set @p_Output = 'Removed'
    end else begin
        set @p_Output = 'Invalid'
    end

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[DEL_Payment_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
