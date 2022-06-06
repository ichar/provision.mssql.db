USE [PurchaseDB]
GO
/****** Object:  StoredProcedure [dbo].[SET_OrderFacsimile_sp]    Script Date: 29.01.2022 8:11:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SET_OrderFacsimile_sp] 
    @p_Mode             int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Facsimile        varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_OrderID          int,
        @l_now              datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_ID

    set @p_Output = ''

    if @exists = 1
    begin
        UPDATE [dbo].[OrderDates_tb] SET Facsimile=@p_Facsimile WHERE OrderID=@p_ID

        if @@error != 0
            raiserror('Ó¯Ë·Í‡ Ó·‡·ÓÚÍË',16,1)

        select @l_OrderID = @p_ID
        set @p_Output = 'Updated'
    end else begin
        set @l_OrderID = 0
        set @p_Output = 'Invalid' 
            + ':' + cast(@exists as varchar)
    end
    
    if @l_OrderID > 0
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@l_OrderID, @p_Login, '‘¿ —»Ã»À≈', @p_Facsimile)

    set @p_Output = @p_Output + ':' + cast(@l_OrderID as varchar)

    if @p_Mode = 0
        SELECT @l_OrderID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[SET_OrderFacsimile_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
