USE [PurchaseDB]
GO
/****** Object:  StoredProcedure [dbo].[DELETE_Order_sp]    Script Date: 29.01.2022 8:11:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DELETE_Order_sp] 
    @p_Mode             int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_OrderID          int,
        @l_Status           int,
        @l_Name             varchar(50),
        @l_now              datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1, @l_Status=Status from [dbo].[Orders_tb] where TID=@p_ID

    set @p_Output = ''

    if @exists = 1
    begin
        if @l_Status = 9 begin
            DELETE FROM [storage].[dbo].[OrderDocuments_tb] WHERE OrderID=@p_ID

            DELETE FROM [dbo].[Decrees_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Params_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Items_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[PaymentChanges_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Payments_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Comments_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Reviewers_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Reviews_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[OrderDates_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[OrderChanges_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Unreads_tb] WHERE OrderID=@p_ID

            DELETE FROM [dbo].[Orders_tb] WHERE TID=@p_ID
        end else begin
            UPDATE [dbo].[Decrees_tb] SET Status=3 WHERE OrderID=@p_ID
            UPDATE [dbo].[Orders_tb] SET Status=9 WHERE TID=@p_ID

            set @l_Name = 'Корзина'
            --
            -- Add to Order Changes log
            --
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@p_ID, @p_Login, @l_Name, '')
        end

        select @l_OrderID = @p_ID
        set @p_Output = 'Removed'
    end else begin
        set @l_OrderID = 0
        set @p_Output = 'Invalid' 
            + ':' + cast(@exists as varchar)
    end

    set @p_Output = @p_Output + ':' + cast(@l_OrderID as varchar)

    if @p_Mode = 0
        SELECT @l_OrderID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[DELETE_Order_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END




GO
