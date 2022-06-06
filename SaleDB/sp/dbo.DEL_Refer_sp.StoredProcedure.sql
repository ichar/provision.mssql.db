USE [SaleDB]
GO
/****** Object:  StoredProcedure [dbo].[DEL_Refer_sp]    Script Date: 29.01.2022 8:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- DEL NEW PROVISION REFER
-- ----------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[DEL_Refer_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_ReferID          int,
    @p_Login            varchar(50),
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

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1 and @p_ID > 0
        select top 1 @l_TID=TID from [dbo].[OrderRefers_tb] where OrderID=@p_OrderID and TID=@p_ID

    if @l_TID > 0
    begin
        set @l_ReferID = @p_ReferID
        --
        -- Get Refer name and value
        --
        select top 1 @l_ReferName=Name from [dbo].[DIC_Refers_tb] where TID=@l_ReferID

        DELETE FROM [dbo].[OrderRefers_tb] WHERE TID=@l_TID
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Удалено:[' + @l_ReferName + ']', @p_ID)

        set @p_Output = 'Removed'
    end else begin
        set @p_Output = 'Invalid'
    end

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[DEL_Refer_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
