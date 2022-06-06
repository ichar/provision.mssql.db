USE [SaleDB]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Item_sp]    Script Date: 29.01.2022 8:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- ADD NEW PROVISION ORDER ITEM
-- ----------------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[ADD_Item_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_VendorID         int,
    @p_Login            varchar(50),
    @p_Name             varchar(250),
    @p_Qty              int,
    @p_Units            varchar(20),
    @p_Total            float,
    @p_Tax              float,
    @p_Currency         varchar(10),
    @p_Account          varchar(100),
    @p_Vendor           varchar(100),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_TID          int = null,
        @l_ItemName     varchar(250),
        @l_Value        varchar(200),
        @l_VendorID     int,
        @l_Vendor       varchar(100),
        @l_now          datetime

    set @l_now = getdate()
    --
    --    Check Vendor exists
    --
    exec dbo.CHECK_Vendor_sp 1, @p_VendorID, @p_Vendor, @l_VendorID output

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        if @p_ID > 0 begin
            declare
                @l_old_VendorID int = null,
                @l_old_exists bit = 0

            select @l_old_VendorID=VendorID FROM [dbo].[Items_tb] WHERE TID=@p_ID

            UPDATE [dbo].[Items_tb] SET
                OrderID=@p_OrderID,
                VendorID=@l_VendorID,
                Login=@p_Login,
                Name=@p_Name,
                Qty=@p_Qty,
                Units=@p_Units,
                Total=cast(@p_Total as money),
                Tax=cast(@p_Tax as money),
                Currency=@p_Currency,
                Account=@p_Account,
                RD=@l_now
            WHERE TID=@p_ID
            --
            -- Check & Remove DIC Vendor item if not exists
            --
            if @l_old_VendorID > 0 and @l_VendorID != @l_old_VendorID begin
                select @l_old_exists=1 from [dbo].[Items_tb] where VendorID=@l_old_VendorID

                if @l_old_exists != 1
                    DELETE FROM [dbo].[DIC_Vendors_tb] WHERE TID=@l_old_VendorID
            end

            set @l_TID = @p_ID
            set @p_Output = 'Updated'
        end else begin
            INSERT INTO [dbo].[Items_tb](
                OrderID,
                VendorID,
                Login,
                Name,
                Qty,
                Units,
                Total,
                Tax,
                Currency,
                Account,
                RD
            ) VALUES (
                @p_OrderID,
                @l_VendorID,
                @p_Login,
                @p_Name,
                @p_Qty,
                @p_Units,
                cast(@p_Total as money),
                cast(@p_Tax as money),
                @p_Currency,
                @p_Account,
                @l_now
            )

            select @l_TID = CAST(scope_identity() AS int)
            set @p_Output = 'Registered'
        end
        --
        -- Get Item name and value
        --
        select top 1 @l_ItemName = Name, @l_Value = 
            cast(Qty as varchar) + ':' + 
            Units + ':' + 
            cast(Total as varchar) + ':' + 
            cast(Tax as varchar) + ':' + 
            cast(Currency as varchar) + ':' + 
            cast(Account as varchar) + ':' + 
            cast(Vendor as varchar)
        from [dbo].[WEB_OrderItems_vw] where TID=@l_TID
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, '—чет:' + @l_ItemName, @l_Value)
    end else begin
        set @l_TID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_TID as varchar) + ':' + cast(@l_VendorID as varchar)

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[ADD_Item_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
