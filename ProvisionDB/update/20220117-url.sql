USE [ProvisionDB]
GO
alter table [dbo].[Orders_tb] alter column [URL] [varchar](800) NULL

GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Order_sp]    Script Date: 17.01.2022 12:22:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- REGISTER NEW PROVISION ORDER
-- ----------------------------
--   @p_Mode         -- mode of review
--
ALTER PROCEDURE [dbo].[REGISTER_Order_sp]
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
    @p_URL              varchar(800),
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
        declare @l_min int, @l_max int
        set @l_min = case when @p_MD < 10 then 0 else (@p_MD*100000) end
        set @l_max = (@p_MD+1)*100000
        select top 1 @l_TID=TID from [dbo].[Orders_tb] where TID > @l_min and TID < @l_max order by TID desc
        set @l_TID = case when @l_TID is null then @l_min+1 else @l_TID+1 end

        if @p_IsNoPrice = 1
            INSERT INTO [dbo].[Orders_tb](
                TID,
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
                @l_TID,
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
                TID,
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
                @l_TID,
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

        set @l_Login = @p_EditedBy
        set @l_OrderID = @l_TID

        INSERT INTO [dbo].[OrderDates_tb](
            OrderID, 
            Created
        ) VALUES (
            @l_OrderID,
            @l_now
        )

        INSERT INTO [dbo].[Reviewers_tb](
            OrderID, 
            Login
        ) VALUES (
            @l_OrderID,
            @p_Login
        )

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
            (@l_OrderID, @l_Login, 'НАИМЕНОВАНИЕ ТОВАРА', @p_Article),
            (@l_OrderID, @l_Login, 'Кол-во (шт)', cast(@p_Qty as varchar)),
            (@l_OrderID, @l_Login, 'Обоснование', @p_Purpose),
            (@l_OrderID, @l_Login, 'URL', @p_URL)

        if @p_Price > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Цена за единицу', cast(@p_Price as varchar))

        if len(@p_Currency) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Валюта платежа', @p_Currency)

        if @p_Total > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'СУММА', [dbo].[CONVERT_Money_fn](@p_Total))

        if len(@p_Equipment) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Описание', @p_Equipment)

        if len(@p_Condition) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Условия оплаты', @p_Condition)

        if len(@p_Seller) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'ПОСТАВЩИК', @p_Seller)

        if len(@p_Category) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Категория', @p_Category)

        if len(@p_Subdivision) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'ПОТРЕБИТЕЛЬ', @p_Subdivision)

        if len(@p_Sector) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Участок производства', @p_Sector)

        if len(@p_Account) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Номер счета', @p_Account)

        if len(@p_Login) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Заказчик', @p_Login)

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
/****** Object:  StoredProcedure [dbo].[UPDATE_Order_sp]    Script Date: 17.01.2022 12:22:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[UPDATE_Order_sp] 
    @p_Mode             int,
    @p_ID               int,
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
    @p_URL              varchar(800),
    @p_DueDate          varchar(10),
    @p_EditedBy         varchar(50),
    @p_IsNoPrice        int,
    @p_MD               int,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_OrderID          int,
        @l_ParamID          int,
        @l_SubdivisionID    int,
        @l_SectorID         int,
        @l_CategoryID       int,
        @l_SellerID         int,
        @l_EquipmentID      int,
        @l_ConditionID      int,
        @l_DueDate          varchar(10),
        @l_now              datetime

    DECLARE
        @c_Author           varchar(50), 
        @c_Article          varchar(500), 
        @c_Qty              int, 
        @c_Price            float, 
        @c_Currency         varchar(10), 
        @c_Total            money, 
        @c_Purpose          varchar(2000), 
        @c_Condition        varchar(50), 
        @c_Account          varchar(200), 
        @c_URL              varchar(800), 
        @c_Equipment        varchar(1000), 
        @c_Subdivision      varchar(50), 
        @c_Sector           varchar(50), 
        @c_Category         varchar(50), 
        @c_Seller           varchar(100)

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

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_ID

    set @p_Output = ''

    if dbo.CHECK_IsEmpty_fn(@l_SubdivisionID) = 0 and @exists = 1
    begin
        select 
            @c_Author=Author, @c_Article=Article, @c_Qty=Qty, @c_Price=Price, @c_Currency=Currency, @c_Total=Total, @c_Purpose=Purpose, 
            @c_Sector=Sector, @c_Category=Category, @c_Condition=Condition, @c_Equipment=Equipment, @c_Account=Account, @c_Subdivision=Subdivision, @c_Seller=Seller, @c_URL=URL
        from [dbo].[WEB_Orders_vw] where TID=@p_ID

        if @p_IsNoPrice = 1
            UPDATE [dbo].[Orders_tb] SET
                SubdivisionID=@l_SubdivisionID,
                SectorID=@l_SectorID,
                CategoryID=@l_CategoryID,
                EquipmentID=@l_EquipmentID,
                SellerID=@l_SellerID,
                Login=@p_Login,
                Article=@p_Article,
                Qty=@p_Qty,
                Purpose=@p_Purpose,
                Account=@p_Account,
                URL=@p_URL,
                EditedBy=@p_EditedBy,
                RD=@l_now
            WHERE TID=@p_ID
        else
            UPDATE [dbo].[Orders_tb] SET
                SubdivisionID=@l_SubdivisionID,
                SectorID=@l_SectorID,
                CategoryID=@l_CategoryID,
                EquipmentID=@l_EquipmentID,
                ConditionID=@l_ConditionID,
                SellerID=@l_SellerID,
                Login=@p_Login,
                Article=@p_Article,
                Qty=@p_Qty,
                Purpose=@p_Purpose,
                Account=@p_Account,
                URL=@p_URL,
                Price=@p_Price,
                Currency=@p_Currency,
                Total=cast(@p_Total as money),
                Tax=cast(@p_Tax as money),
                EditedBy=@p_EditedBy,
                RD=@l_now
            WHERE TID=@p_ID

        select @l_OrderID = @p_ID

        set @p_Subdivision = [dbo].[GET_SplittedItem_fn](@p_Subdivision, '|', 0)
        set @p_Sector = [dbo].[GET_SplittedItem_fn](@p_Sector, '|', 0)
        set @p_Category = [dbo].[GET_SplittedItem_fn](@p_Category, '|', 0)
        set @p_Equipment = [dbo].[GET_SplittedItem_fn](@p_Equipment, '|', 0)
        set @p_Seller = [dbo].[GET_SplittedItem_fn](@p_Seller, '|', 0)
        set @p_Condition = [dbo].[GET_SplittedItem_fn](@p_Condition, '|', 0)
        --
        -- Add to Order Changes log
        --
        if [dbo].[CHECK_IsEqual_fn](@c_Article, @p_Article) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'НАИМЕНОВАНИЕ ТОВАРА', @p_Article)

        if [dbo].[CHECK_IsEqual_fn](@c_Equipment, @p_Equipment) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Описание', @p_Equipment)

        if [dbo].[CHECK_IsEqual_fn](@c_Qty, @p_Qty) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Кол-во (шт)', cast(@p_Qty as varchar))

        if [dbo].[CHECK_IsEqual_fn](@c_Purpose, @p_Purpose) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Обоснование', @p_Purpose)

        if [dbo].[CHECK_IsEqual_fn](@c_Category, @p_Category) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Категория', @p_Category)

        if [dbo].[CHECK_IsEqual_fn](@c_Subdivision, @p_Subdivision) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'ПОТРЕБИТЕЛЬ', @p_Subdivision)

        if [dbo].[CHECK_IsEqual_fn](@c_Sector, @p_Sector) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Участок производства', @p_Sector)

        if [dbo].[CHECK_IsEqual_fn](@c_Account, @p_Account) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Номер счета', @p_Account)

        if [dbo].[CHECK_IsEqual_fn](@c_Author, @p_Login) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Заказчик', @p_Login)

        if [dbo].[CHECK_IsEqual_fn](@c_Seller, @p_Seller) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'ПОСТАВЩИК', @p_Seller)

        if [dbo].[CHECK_IsEqual_fn](@c_URL, @p_URL) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'URL', @p_URL)

        if @p_IsNoPrice = 0 begin
            if [dbo].[CHECK_IsFloatEqual_fn](@c_Price, @p_Price) = 0
                INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                    (@l_OrderID, @p_EditedBy, 'Цена за единицу', cast(@p_Price as varchar))

            if [dbo].[CHECK_IsEqual_fn](@c_Currency, @p_Currency) = 0
                INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                    (@l_OrderID, @p_EditedBy, 'Валюта платежа', @p_Currency)

            if [dbo].[CHECK_IsFloatEqual_fn](@c_Total, @p_Total) = 0
                INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                    (@l_OrderID, @p_EditedBy, 'СУММА', [dbo].[CONVERT_Money_fn](@p_Total))

            if [dbo].[CHECK_IsEqual_fn](@c_Condition, @p_Condition) = 0
                INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                    (@l_OrderID, @p_EditedBy, 'Условия оплаты', @p_Condition)
        end

        DECLARE @param varchar(20) = case @p_MD when 20 then 'Срок действия' else 'Срок исполнения' end

        select top 1 @l_ParamID = TID from [dbo].[DIC_Params_tb] where Name=@param and (MD=@p_MD or MD is null)

        if [dbo].[CHECK_IsEmpty_fn](@p_DueDate) = 0 begin
            select @l_DueDate=[Value] from [dbo].[Params_tb] where OrderID=@l_OrderID and ParamID=@l_ParamID
            if @p_DueDate != @l_DueDate or [dbo].[CHECK_IsEmpty_fn](@l_DueDate) = 1
                EXEC [dbo].[ADD_Param_sp] 1, @l_OrderID, 0, 0, @p_EditedBy, @param, @p_DueDate, @p_MD, null
        end else
            EXEC [dbo].[DEL_Param_sp] 1, @l_OrderID, @l_ParamID, 0, @p_EditedBy, null

        set @p_Output = 'Refreshed'
    end else begin
        set @l_OrderID = 0
        set @p_Output = 'Invalid' 
            + ':' + case when @l_SubdivisionID is null then 'NULL' else cast(@l_SubdivisionID as varchar) end
            + ':' + case when @l_SellerID is null then 'NULL' else cast(@l_SellerID as varchar) end
            + ':' + cast(@exists as varchar)
    end

    set @p_Output = @p_Output + ':' + cast(@l_OrderID as varchar)

    if @p_Mode = 0
        SELECT @l_OrderID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[UPDATE_Order_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
