USE [SaleDB]
GO
/****** Object:  StoredProcedure [dbo].[SET_Status_sp]    Script Date: 29.01.2022 8:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- REGISTER NEW PROVISION REVIEW
-- -----------------------------
--   @p_OrderID      -- Order ID
--   @p_Login        -- login of reviewer
--   @p_Status       -- status of reviewer: 2 - accepted, 3 - rejected, 4 - confirm
--
CREATE PROCEDURE [dbo].[SET_Status_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_Login            varchar(50),
    @p_Status           int,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        UPDATE [dbo].[Orders_tb] SET Status=@p_Status WHERE TID=@p_OrderID

        if @p_Status = 5 begin
            UPDATE [dbo].[OrderDates_tb] SET Delivered=NULL WHERE OrderID=@p_OrderID
            delete from [dbo].[Reviews_tb] where OrderID=@p_OrderID and Status in (8)
        end
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Статус', case @p_Status 
                when 0 then 'В работе'
                when 1 then 'На согласовании'
                when 2 then 'СОГЛАСОВАНО'
                when 3 then 'ОТКАЗАНО'
                when 4 then 'ТРЕБУЕТСЯ ОБОСНОВАНИЕ'
                when 5 then 'На исполнении'
                when 6 then 'ИСПОЛНЕНО'
                when 7 then 'В архиве'
                when 8 then ''
                when 9 then 'Корзина'
                else '...'
                end
                )

        set @p_Output = 'Status changed'
    end else begin
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@p_Status as varchar)

    if @p_Mode = 0
        SELECT @p_OrderID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[SET_Status_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
