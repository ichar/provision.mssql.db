USE [WorkflowDB]
GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Order_sp]    Script Date: 24.01.2022 14:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- REGISTER NEW WORKFLOW DOCUMENT
-- ------------------------------
--   @p_Mode         -- mode of review
--
CREATE PROCEDURE [dbo].[REGISTER_Order_sp]
    @p_Mode             int,
    @p_Login            varchar(50),
    @p_Article          varchar(500),
    @p_Purpose          varchar(2000),
    @p_Activity         varchar(50),
    @p_Subdivision      varchar(150),
    @p_Category         varchar(50),
    @p_Equipment        varchar(2000),
    @p_Account          varchar(200),
    @p_DueDate          varchar(10),
    @p_EditedBy         varchar(50),
    @p_Status           int,
    @p_MD               int,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_TID              int,
        @l_Login            varchar(50),
        @l_OrderID          int,
        @l_ActivityID       int,
        @l_SubdivisionID    int,
        @l_CategoryID       int,
        @l_EquipmentID      int,
        @l_ParamID          int,
        @l_now              datetime

    set @l_now = getdate()
    --
    --    Check Activity exists
    --
    exec dbo.CHECK_Activity_sp 1, @p_Activity, @l_ActivityID output
    --
    --    Check Subdivision exists
    --
    exec dbo.CHECK_Subdivision_sp 1, @p_Subdivision, @l_SubdivisionID output
    --
    --    Check Category exists
    --
    exec dbo.CHECK_Category_sp 1, @p_Category, @p_MD, @l_CategoryID output
    --
    --    Check Equipment exists
    --
    exec dbo.CHECK_Equipment_sp 1, @l_SubdivisionID, @p_Equipment, @l_EquipmentID output

    declare 
        @exists bit = null

    select @exists=1, @l_OrderID=TID from [dbo].[Orders_tb] where 
        SubdivisionID=@l_SubdivisionID and 
        Article=@p_Article and 
        Login=@p_Login and 
        Status=@p_Status and 
        Purpose=@p_Purpose

    set @p_Output = ''

    if @exists = 1
        set @p_Output = 'Exists'

    else if @exists is null begin
        if @l_OrderID is null
            INSERT INTO [dbo].[Orders_tb](
                ActivityID,
                SubdivisionID,
                CategoryID,
                EquipmentID,
                Login,
                Article,
                Purpose,
                Account,
                Status,
                EditedBy,
                MD,
                RD
            ) VALUES (
                @l_ActivityID,
                @l_SubdivisionID,
                @l_CategoryID,
                @l_EquipmentID,
                @p_Login,
                @p_Article,
                @p_Purpose,
                @p_Account,
                0,
                @p_EditedBy,
                @p_MD,
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

        DECLARE @param varchar(50) = 'Срок ввода в действие'

        if [dbo].[CHECK_IsEmpty_fn](@p_DueDate) = 0
            EXEC [dbo].[ADD_Param_sp] 1, @l_OrderID, 0, 0, @p_EditedBy, @param, @p_DueDate, @p_MD, null

        set @p_Activity = [dbo].[GET_SplittedItem_fn](@p_Activity, '|', 0)
        set @p_Subdivision = [dbo].[GET_SplittedItem_fn](@p_Subdivision, '|', 0)
        set @p_Category = [dbo].[GET_SplittedItem_fn](@p_Category, '|', 0)
        set @p_Equipment = [dbo].[GET_SplittedItem_fn](@p_Equipment, '|', 0)
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@l_OrderID, @l_Login, 'НАИМЕНОВАНИЕ ДОКУМЕНТА', @p_Article),
            (@l_OrderID, @l_Login, 'СОДЕРЖАНИЕ', @p_Purpose)

        if len(@p_Equipment) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Руководитель', @p_Equipment)

        if len(@p_Activity) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Вид деятельности', @p_Activity)

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
    end

    set @p_Output = @p_Output + ':' + cast(@l_OrderID as varchar)

    if @p_Mode = 0
        SELECT @l_OrderID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[REGISTER_Order_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
