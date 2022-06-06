USE [PurchaseDB]
GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Order_sp]    Script Date: 29.01.2022 8:11:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- REGISTER NEW PROVISION ORDER
-- ----------------------------
--   @p_Mode         -- mode of review
--
CREATE PROCEDURE [dbo].[REGISTER_Order_sp]
    @p_Mode             int,
    @p_Login            varchar(50),
    @p_Article          varchar(500),
    @p_Qty              int,
    @p_Purpose          varchar(2000),
    @p_Price            float,
    @p_Currency         varchar(10),
    @p_Total            float,
    @p_Tax              float,
    @p_Subdivision      varchar(150),
    @p_Sector           varchar(150),
    @p_Category         varchar(50),
    @p_Equipment        varchar(2000),
    @p_Seller           varchar(2000),
    @p_Condition        varchar(50),
    @p_Account          varchar(200),
    @p_URL              varchar(200),
    @p_DueDate          varchar(10),
    @p_EditedBy         varchar(50),
    @p_Status           int,
    @p_IsNoPrice        int,
    @p_MD               int,
    @p_RowSpan          int,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_TID              int,
        @l_Login            varchar(50),
        @l_OrderID          int,
        @l_SubdivisionID    int,
        @l_SectorID         int,
        @l_CategoryID       int,
        @l_SellerID         int,
        @l_EquipmentID      int,
        @l_ConditionID      int,
        @l_ParamID          int,
        @l_now              datetime

    set @l_now = getdate()
    --
    --    Check Subdivision exists
    --
    exec dbo.CHECK_Subdivision_sp 1, @p_Subdivision, @l_SubdivisionID output
    --
    --    Check Sector exists
    --
    exec dbo.CHECK_Sector_sp 1, @p_Sector, @l_SectorID output
    --
    --    Check Category exists
    --
    exec dbo.CHECK_Category_sp 1, @p_Category, @p_MD, @l_CategoryID output
    --
    --    Check Equipment exists
    --
    exec dbo.CHECK_Equipment_sp 1, @l_SubdivisionID, @p_Equipment, @l_EquipmentID output
    --
    --    Check Condition exists
    --
    if @p_IsNoPrice = 0
        exec dbo.CHECK_Condition_sp 1, @p_Condition, @l_ConditionID output
    --
    --    Check Seller exists
    --
    exec dbo.CHECK_Seller_sp 1, @p_Seller, @p_MD, @l_SellerID output

    declare 
        @exists bit = null

    select @exists=1, @l_OrderID=TID from [dbo].[Orders_tb] where 
        SubdivisionID=@l_SubdivisionID and 
        Article=@p_Article and 
        Qty=@p_Qty and 
        Login=@p_Login and 
        Status=@p_Status and 
        Purpose=@p_Purpose

    set @p_Output = ''

    if @exists = 1
        set @p_Output = 'Exists'

    else if @exists is null
    begin
        /*
        declare @l_min int, @l_max int
        set @l_min = case when @p_MD < 10 then 0 else (@p_MD*100000) end
        set @l_max = (@p_MD+1)*100000
        select top 1 @l_TID=TID from [dbo].[Orders_tb] where TID > @l_min and TID < @l_max order by TID desc
        set @l_TID = case when @l_TID is null then @l_min+1 else @l_TID+1 end
        */

        if @p_IsNoPrice = 1
            INSERT INTO [dbo].[Orders_tb](
                SubdivisionID,
                SectorID,
                CategoryID,
                EquipmentID,
                SellerID,
                Login,
                Article,
                Qty,
                Purpose,
                URL,
                Status,
                EditedBy,
                MD,
                RowSpan,
                RD
            ) VALUES (
                @l_SubdivisionID,
                @l_SectorID,
                @l_CategoryID,
                @l_EquipmentID,
                @l_SellerID,
                @p_Login,
                @p_Article,
                @p_Qty,
                @p_Purpose,
                @p_URL,
                0,
                @p_EditedBy,
                @p_MD,
                @p_RowSpan,
                @l_now
            )
        else
            INSERT INTO [dbo].[Orders_tb](
                SubdivisionID,
                SectorID,
                CategoryID,
                EquipmentID,
                ConditionID,
                SellerID,
                Login,
                Article,
                Qty,
                Purpose,
                Price,
                Currency,
                Total,
                Tax,
                Account,
                URL,
                Status,
                EditedBy,
                MD,
                RowSpan,
                RD
            ) VALUES (
                @l_SubdivisionID,
                @l_SectorID,
                @l_CategoryID,
                @l_EquipmentID,
                @l_ConditionID,
                @l_SellerID,
                @p_Login,
                @p_Article,
                @p_Qty,
                @p_Purpose,
                @p_Price,
                @p_Currency,
                cast(@p_Total as money),
                cast(@p_Tax as money),
                @p_Account,
                @p_URL,
                0,
                @p_EditedBy,
                @p_MD,
                @p_RowSpan,
                @l_now
            )

        if @@error != 0
            raiserror('ошибка добавления документа',16,1)

        select @l_TID = CAST(scope_identity() AS int)

        set @l_Login = @p_EditedBy

        set @l_OrderID = @l_TID

        INSERT INTO [dbo].[OrderDates_tb]
            (OrderID, Created) 
        VALUES 
            (@l_OrderID, @l_now)

        INSERT INTO [dbo].[Reviewers_tb]
            (OrderID, Login) 
        VALUES 
            (@l_OrderID,  @p_Login),
            (@l_OrderID,  @p_EditedBy)

        DECLARE @param varchar(20) = case @p_MD when 20 then 'Срок действия' else 'Срок исполнения' end

        if [dbo].[CHECK_IsEmpty_fn](@p_DueDate) = 0
            EXEC [dbo].[ADD_Param_sp] 1, @l_OrderID, 0, 0, @p_EditedBy, @param, @p_DueDate, @p_MD, null
        /*
        set @param = 'Заказчик'
        EXEC [dbo].[ADD_Param_sp] 1, @l_OrderID, 0, 0, @p_EditedBy, @param, @p_Login, null
        */
        set @p_Subdivision = [dbo].[GET_SplittedItem_fn](@p_Subdivision, '|', 0)
        set @p_Sector = [dbo].[GET_SplittedItem_fn](@p_Sector, '|', 0)
        set @p_Category = [dbo].[GET_SplittedItem_fn](@p_Category, '|', 0)
        set @p_Equipment = [dbo].[GET_SplittedItem_fn](@p_Equipment, '|', 0)
        set @p_Seller = [dbo].[GET_SplittedItem_fn](@p_Seller, '|', 0)
        set @p_Condition = [dbo].[GET_SplittedItem_fn](@p_Condition, '|', 0)
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@l_OrderID, @l_Login, 'НАИМЕНОВАНИЕ ДОКУМЕНТА', @p_Article),
            (@l_OrderID, @l_Login, 'СОДЕРЖАНИЕ', @p_Purpose)

        if len(@p_Equipment) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Руководитель', @p_Equipment)

        if len(@p_Category) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Категория документа', @p_Category)

        if len(@p_Subdivision) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'ПОДРАЗДЕЛЕНИЕ', @p_Subdivision)

        if len(@p_Account) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Регистрационный номер', @p_Account)

        if len(@p_Login) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Автор документа', @p_Login)

        set @p_Output = 'Registered'
    end else begin
        set @l_OrderID = 0
        set @p_Output = 'Invalid' 
            + ':' + case when @l_SubdivisionID is null then 'NULL' else cast(@l_SubdivisionID as varchar) end
            + ':' + case when @l_SellerID is null then 'NULL' else cast(@l_SellerID as varchar) end
    end

    set @p_Output = @p_Output + ':' + cast(@l_OrderID as varchar)

    if @p_Mode = 0
        SELECT @l_OrderID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[REGISTER_Order_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END




GO
