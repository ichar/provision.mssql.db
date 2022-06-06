USE [WorkflowDB]
GO
/****** Object:  StoredProcedure [dbo].[DEL_Item_sp]    Script Date: 24.01.2022 14:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- DEL NEW PROVISION ORDER ITEM
-- ----------------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[DEL_Item_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_TID          int = null,
        @l_ItemName     varchar(250),
        @l_Value        varchar(200),
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1 and @p_ID > 0
        select @l_TID=TID from [dbo].[Items_tb] where TID=@p_ID

    if @l_TID > 0
    begin
        --
        -- Get Item name and value
        --
        select top 1 @l_ItemName = Name, @l_Value = 
            cast(Qty as varchar) + ':' + 
            Units + ':' + 
            cast(Total as varchar) + ':' + 
            cast(Tax as varchar) + ':' + 
            cast(Currency as varchar) + ':' + 
            cast(Account as varchar) 
        from [dbo].[WEB_OrderItems_vw] where TID=@l_TID

        DELETE FROM [dbo].[Items_tb] WHERE TID=@l_TID
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Удалено:[' + @l_ItemName + ']', @l_Value)
        
        set @p_Output = 'Removed'
    end else begin
        set @p_Output = 'Invalid'
    end

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[DEL_Item_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
