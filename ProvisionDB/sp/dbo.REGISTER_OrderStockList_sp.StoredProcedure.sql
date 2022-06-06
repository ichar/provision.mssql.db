USE [ProvisionDB]
GO
/****** Object:  StoredProcedure [dbo].[REGISTER_OrderStockList_sp]    Script Date: 01.08.2019 17:34:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- REGISTER NEW PROVISION STOCKLIST STATE
-- --------------------------------------
--   @p_OrderID      -- Order ID
--   @p_Login        -- login of reviewer
--   @p_ID           -- ID StockList Reference
--
ALTER PROCEDURE [dbo].[REGISTER_OrderStockList_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_Login            varchar(50),
    @p_ID               int,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_StockListID  int = null,
        @l_Value        varchar(100),
        @l_now          datetime

    set @p_Output = ''
    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID
    select @l_StockListID=TID, @l_Value=NodeCode from [dbo].[DIC_StockList_tb] where TID=@p_ID

    if @l_StockListID is not null and dbo.CHECK_IsEmpty_fn(@l_Value) = 0 and @exists = 1
    begin
        UPDATE [dbo].[Orders_tb] SET
            StockListID=@l_StockListID
            --EditedBy=@p_Login,
            --RD=@l_now
        WHERE TID=@p_OrderID

        if @@error != 0
            raiserror('ошибка обновления класса товара',16,1)
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Класс товара', @l_Value)

        if @@error != 0
            raiserror('ошибка обработки',16,1)

        set @p_Output = 'Registered'
    end else begin
        set @l_StockListID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_StockListID as varchar)

    if @p_Mode = 0
        SELECT @l_StockListID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[REGISTER_OrderStockList_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END

GO
