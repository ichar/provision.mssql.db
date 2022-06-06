USE [ProvisionDB]
GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderChanges_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderChanges_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderChanges_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderChanges_vw'

GO
/****** Object:  StoredProcedure [dbo].[UPDATE_Order_sp]    Script Date: 05.10.2019 10:01:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_Order_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UPDATE_Order_sp]
GO
/****** Object:  StoredProcedure [dbo].[SET_Status_sp]    Script Date: 05.10.2019 10:01:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SET_Status_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SET_Status_sp]
GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Review_sp]    Script Date: 05.10.2019 10:01:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REGISTER_Review_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[REGISTER_Review_sp]
GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Order_sp]    Script Date: 05.10.2019 10:01:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REGISTER_Order_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[REGISTER_Order_sp]
GO
/****** Object:  StoredProcedure [dbo].[DEL_Seller_sp]    Script Date: 05.10.2019 10:01:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEL_Seller_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DEL_Seller_sp]
GO
/****** Object:  StoredProcedure [dbo].[DEL_Payment_sp]    Script Date: 05.10.2019 10:01:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEL_Payment_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DEL_Payment_sp]
GO
/****** Object:  StoredProcedure [dbo].[DEL_Param_sp]    Script Date: 05.10.2019 10:01:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEL_Param_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DEL_Param_sp]
GO
/****** Object:  StoredProcedure [dbo].[DEL_Item_sp]    Script Date: 05.10.2019 10:01:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEL_Item_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DEL_Item_sp]
GO
/****** Object:  StoredProcedure [dbo].[DEL_Document_sp]    Script Date: 05.10.2019 10:01:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEL_Document_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DEL_Document_sp]
GO
/****** Object:  StoredProcedure [dbo].[DEL_Comment_sp]    Script Date: 05.10.2019 10:01:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEL_Comment_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DEL_Comment_sp]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Payment_sp]    Script Date: 05.10.2019 10:01:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADD_Payment_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ADD_Payment_sp]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Param_sp]    Script Date: 05.10.2019 10:01:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADD_Param_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ADD_Param_sp]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Item_sp]    Script Date: 05.10.2019 10:01:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADD_Item_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ADD_Item_sp]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Document_sp]    Script Date: 05.10.2019 10:01:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADD_Document_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ADD_Document_sp]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Comment_sp]    Script Date: 05.10.2019 10:01:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADD_Comment_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ADD_Comment_sp]
GO
/****** Object:  View [dbo].[WEB_OrderChanges_vw]    Script Date: 05.10.2019 10:01:27 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_OrderChanges_vw]'))
DROP VIEW [dbo].[WEB_OrderChanges_vw]
GO
/****** Object:  UserDefinedFunction [dbo].[CONVERT_Money_fn]    Script Date: 05.10.2019 10:01:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CONVERT_Money_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[CONVERT_Money_fn]
GO
/****** Object:  UserDefinedFunction [dbo].[CONVERT_Money_fn]    Script Date: 05.10.2019 10:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CONVERT_Money_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'--
-- CONVERT MONEY(FLOAT) AS VARCHAR
--
CREATE function [dbo].[CONVERT_Money_fn](@x float)
returns varchar(50)
as
BEGIN
    return replace(replace(convert(varchar, convert(money, @x), 1), '','', '' ''), ''.'', '','')
END

' 
END

GO
/****** Object:  View [dbo].[WEB_OrderChanges_vw]    Script Date: 05.10.2019 10:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_OrderChanges_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_OrderChanges_vw]
AS
SELECT        TID, OrderID, Login, Name, Value, RD
FROM            dbo.OrderChanges_tb AS c
' 
GO
/****** Object:  StoredProcedure [dbo].[ADD_Comment_sp]    Script Date: 05.10.2019 10:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADD_Comment_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ADD_Comment_sp] AS' 
END
GO
--
-- ADD NEW PROVISION COMMENT
-- -------------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
ALTER PROCEDURE [dbo].[ADD_Comment_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_CommentID        int,
    @p_Login            varchar(50),
    @p_NewComment       varchar(50),
    @p_Note             varchar(1000),
    @p_Output           varchar(20) output
AS
BEGIN
    DECLARE
        @l_CommentName      varchar(50),
        @l_CommentID        int = null,
        @l_ID               int = null,
        @l_now              datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        if @p_CommentID is NULL or @p_CommentID = 0 begin
            select @l_CommentID = TID from [dbo].[DIC_Comments_tb] where Name=@p_NewComment
            if @l_CommentID is NULL begin
                insert into [dbo].[DIC_Comments_tb](Name) values(@p_NewComment)
                select @l_CommentID = CAST(scope_identity() AS int)
            end
        end else
            set @l_CommentID = @p_CommentID

        if @p_ID > 0 begin
            UPDATE [dbo].[Comments_tb] SET
                OrderID=@p_OrderID,
                CommentID=@l_CommentID,
                Login=@p_Login,
                Note=@p_Note,
                RD=@l_now
            WHERE TID=@p_ID

            set @l_ID = @p_ID
            set @p_Output = 'Updated'
        end else begin
            INSERT INTO [dbo].[Comments_tb](
                OrderID,
                CommentID,
                Login,
                Note,
                RD
            ) VALUES (
                @p_OrderID,
                @l_CommentID,
                @p_Login,
                @p_Note,
                @l_now
            )

            select @l_ID = CAST(scope_identity() AS int)
            set @p_Output = 'Registered'
        end
        --
        -- Get Comment name and value
        --
        select top 1 @l_CommentName = Name from [dbo].[DIC_Comments_tb] where TID=@l_CommentID
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Комментарий', 
                'Автор: '      + @l_CommentName + '; ' + 
                'Содержание: ' + @p_Note
                )
    end else begin
        set @l_ID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_ID as varchar) + ':' + cast(@l_CommentID as varchar)

    if @p_Mode = 0
        SELECT @l_ID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[ADD_Comment_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[ADD_Document_sp]    Script Date: 05.10.2019 10:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADD_Document_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ADD_Document_sp] AS' 
END
GO
--
-- UPLOAD IMAGE BLOB
-- -----------------
--   @p_OrderID      -- Order ID
--   @p_Login        -- login of reviewer
--   @p_Note         -- note of review
--
ALTER PROCEDURE [dbo].[ADD_Document_sp]
    @p_Mode             int,
    @p_UID              varchar(50),
    @p_OrderID          int,
    @p_Login            varchar(50),
    @p_FileName         varchar(255),
    @p_FileSize         int,
    @p_ContentType      varchar(20),
    @p_Note             varchar(1000),
    @p_Image            image,
    @p_Output           varchar(20) output
AS
BEGIN
    DECLARE
        @l_DocumentID   int,
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        INSERT INTO [dbo].[OrderDocuments_tb](
            UID,
            OrderID,
            Login,
            FileName,
            FileSize,
            ContentType,
            Note,
            Image
        ) VALUES (
            @p_UID,
            @p_OrderID,
            @p_Login,
            @p_FileName,
            @p_FileSize,
            @p_ContentType,
            @p_Note,
            @p_Image
        )

        select @l_DocumentID = CAST(scope_identity() AS int)
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Документ', [dbo].[Strip_fn](
                'Имя файла: '  + @p_FileName + '; ' + 
                'Содержание: ' + @p_Note
                ))

        set @p_Output = 'Registered'
    end else begin
        set @l_DocumentID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_DocumentID as varchar)

    if @p_Mode = 0
        SELECT @l_DocumentID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[ADD_Document_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[ADD_Item_sp]    Script Date: 05.10.2019 10:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADD_Item_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ADD_Item_sp] AS' 
END
GO
--
-- ADD NEW PROVISION ORDER ITEM
-- ----------------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
ALTER PROCEDURE [dbo].[ADD_Item_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Name             varchar(250),
    @p_Qty              int,
    @p_Units            varchar(20),
    @p_Total            float,
    @p_Tax              float,
    @p_Account          varchar(100),
    @p_Output           varchar(20) output
AS
BEGIN
    DECLARE
        @l_TID          int = null,
        @l_ItemName     varchar(250),
        @l_Value        varchar(200),
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        if @p_ID > 0 begin
            UPDATE [dbo].[Items_tb] SET
                OrderID=@p_OrderID,
                Login=@p_Login,
                Name=@p_Name,
                Qty=@p_Qty,
                Units=@p_Units,
                Total=cast(@p_Total as money),
                Tax=cast(@p_Tax as money),
                Account=@p_Account,
                RD=@l_now
            WHERE TID=@p_ID

            set @l_TID = @p_ID
            set @p_Output = 'Updated'
        end else begin
            INSERT INTO [dbo].[Items_tb](
                OrderID,
                Login,
                Name,
                Qty,
                Units,
                Total,
                Tax,
                Account,
                RD
            ) VALUES (
                @p_OrderID,
                @p_Login,
                @p_Name,
                @p_Qty,
                @p_Units,
                cast(@p_Total as money),
                cast(@p_Tax as money),
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
            cast(Account as varchar) 
        from [dbo].[WEB_OrderItems_vw] where TID=@l_TID
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, @l_ItemName, @l_Value)
    end else begin
        set @l_TID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_TID as varchar)

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[ADD_Item_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[ADD_Param_sp]    Script Date: 05.10.2019 10:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADD_Param_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ADD_Param_sp] AS' 
END
GO
--
-- ADD NEW PROVISION PARAM
-- -----------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
ALTER PROCEDURE [dbo].[ADD_Param_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_ParamID          int,
    @p_Login            varchar(50),
    @p_NewParam         varchar(50),
    @p_Value            varchar(500),
    @p_Output           varchar(20) output
AS
BEGIN
    DECLARE
        @l_ParamID      int = null,
        @l_TID          int = null,
        @p_ParamName    varchar(50),
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        --
        -- Check Params Reference
        --
        if @p_ParamID is NULL or @p_ParamID = 0 begin
            select @l_ParamID = TID from [dbo].[DIC_Params_tb] where Name=@p_NewParam
            if @l_ParamID is NULL begin
                insert into [dbo].[DIC_Params_tb](Name) values(@p_NewParam)
                select @l_ParamID = CAST(scope_identity() AS int)
            end
        end else
            set @l_ParamID = @p_ParamID
        --
        -- Get Param name and value
        --
        select top 1 @p_ParamName = Name from [dbo].[DIC_Params_tb] where TID=@l_ParamID
        set @p_Value = [dbo].[Strip_fn](@p_Value)
        --
        -- Check if this is Reviewer line
        --
        set @exists = 0

        if @p_ParamName = 'Роль: рецензент' and [dbo].[CHECK_IsEmpty_fn](@p_Value) = 0 begin
            select @exists=1 from [dbo].[Reviewers_tb] where OrderID=@p_OrderID and Login=@p_Value

            if @exists = 0
                INSERT INTO [dbo].[Reviewers_tb] VALUES (
                    @p_OrderID,
                    @p_Value
                )

            set @l_TID = null
            set @exists = 1
        end

        if @exists = 0 begin
            if @p_ID = 0
                select top 1 @l_TID = TID from [dbo].[Params_tb] where OrderID=@p_OrderID and ParamID=@l_ParamID
            else
                set @l_TID = @p_ID
        end

        if @l_TID > 0 begin
            UPDATE [dbo].[Params_tb] SET
                OrderID=@p_OrderID,
                ParamID=@l_ParamID,
                Login=@p_Login,
                Value=@p_Value,
                RD=@l_now
            WHERE TID=@l_TID

            set @p_Output = 'Updated'
        end else begin
            INSERT INTO [dbo].[Params_tb](
                OrderID,
                ParamID,
                Login,
                Value,
                RD
            ) VALUES (
                @p_OrderID,
                @l_ParamID,
                @p_Login,
                @p_Value,
                @l_now
            )

            select @l_TID = CAST(scope_identity() AS int)
            set @p_Output = 'Registered'
        end
    end else begin
        set @l_TID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_TID as varchar) + ':' + cast(@l_ParamID as varchar)

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[ADD_Param_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[ADD_Payment_sp]    Script Date: 05.10.2019 10:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADD_Payment_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ADD_Payment_sp] AS' 
END
GO
--
-- ADD NEW PROVISION PAYMENT
-- -------------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
ALTER PROCEDURE [dbo].[ADD_Payment_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_PaymentID        int,
    @p_Login            varchar(50),
    @p_NewPayment       varchar(50),
    @p_PaymentDate      datetime,
    @p_Total            float,
    @p_Tax              float,
    @p_Status           int,
    @p_Output           varchar(20) output
AS
BEGIN
    DECLARE
        @l_TID          int = null,
        @l_PaymentID    int = null,
        @l_PaymentName  varchar(50),
        @l_Value        varchar(100),
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        if @p_PaymentID is NULL or @p_PaymentID = 0 begin
            select @l_PaymentID = TID from [dbo].[DIC_Payments_tb] where Name=@p_NewPayment
            if @l_PaymentID is NULL begin
                insert into [dbo].[DIC_Payments_tb](Name) values(@p_NewPayment)
                select @l_PaymentID = CAST(scope_identity() AS int)
            end
        end else
            set @l_PaymentID = @p_PaymentID

        if @p_ID > 0 begin
            UPDATE [dbo].[Payments_tb] SET
                OrderID=@p_OrderID,
                PaymentID=@l_PaymentID,
                Login=@p_Login,
                PaymentDate=@p_PaymentDate,
                Total=@p_Total,
                Tax=@p_Tax,
                Status=@p_Status,
                RD=@l_now
            WHERE TID=@p_ID

            set @l_TID = @p_ID
            set @p_Output = 'Updated'
        end else begin
            INSERT INTO [dbo].[Payments_tb](
                OrderID,
                PaymentID,
                Login,
                PaymentDate,
                Total,
                Tax,
                Status,
                RD
            ) VALUES (
                @p_OrderID,
                @l_PaymentID,
                @p_Login,
                @p_PaymentDate,
                @p_Total,
                @p_Tax,
                @p_Status,
                @l_now
            )
    
            select @l_TID = CAST(scope_identity() AS int)
            set @p_Output = 'Registered'
        end
        --
        -- Get Payment name and value
        --
        select top 1 @l_PaymentName = Purpose, @l_Value = 
            'Дата: '  + cast(PaymentDate as varchar) + '; ' + 
            'Сумма: ' + cast(Total as varchar) + '; ' + 
            'НДС: '   + cast(Tax as varchar) + '; ' + 
            'Статус:' + cast(Status as varchar)
        from [dbo].[WEB_OrderPayments_vw] where TID=@l_TID
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, @l_PaymentName, @l_Value)
    end else begin
        set @l_TID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_TID as varchar) + ':' + cast(@l_PaymentID as varchar)

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[ADD_Payment_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[DEL_Comment_sp]    Script Date: 05.10.2019 10:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEL_Comment_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DEL_Comment_sp] AS' 
END
GO
--
-- DEL NEW PROVISION PAYMENT
-- -------------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
ALTER PROCEDURE [dbo].[DEL_Comment_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_CommentID          int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    DECLARE
        @l_TID          int = null,
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1 and @p_ID > 0
        select @l_TID=TID from [dbo].[Comments_tb] where TID=@p_ID

    if @l_TID > 0
    begin
        DELETE FROM [dbo].[Comments_tb] WHERE TID=@l_TID
        
        set @p_Output = 'Removed'
    end else begin
        set @p_Output = 'Invalid'
    end

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[DEL_Comment_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[DEL_Document_sp]    Script Date: 05.10.2019 10:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEL_Document_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DEL_Document_sp] AS' 
END
GO
--
-- DEL NEW PROVISION PAYMENT
-- -------------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
ALTER PROCEDURE [dbo].[DEL_Document_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    DECLARE
        @l_TID          int = null,
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1 and @p_ID > 0
        select top 1 @l_TID = TID from [dbo].[OrderDocuments_tb] where OrderID=@p_OrderID and TID=@p_ID

    if @l_TID > 0
    begin
        DELETE FROM [dbo].[OrderDocuments_tb] WHERE TID=@l_TID

        set @p_Output = 'Removed'
    end else begin
        set @p_Output = 'Invalid'
    end

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[DEL_Document_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[DEL_Item_sp]    Script Date: 05.10.2019 10:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEL_Item_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DEL_Item_sp] AS' 
END
GO
--
-- DEL NEW PROVISION ORDER ITEM
-- ----------------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
ALTER PROCEDURE [dbo].[DEL_Item_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
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
/****** Object:  StoredProcedure [dbo].[DEL_Param_sp]    Script Date: 05.10.2019 10:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEL_Param_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DEL_Param_sp] AS' 
END
GO
--
-- DEL NEW PROVISION PAYMENT
-- -------------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
ALTER PROCEDURE [dbo].[DEL_Param_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_ParamID          int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    DECLARE
        @l_TID          int = null,
        @l_ParamName    varchar(50),
        @l_Value        varchar(500),
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1 and @p_ID > 0
        select top 1 @l_TID = TID from [dbo].[Params_tb] where OrderID=@p_OrderID and TID=@p_ID

    if @l_TID > 0
    begin
        select top 1 @l_ParamName = Name, @l_Value = Value from [dbo].[WEB_OrderParams_vw] where TID=@l_TID
        set @l_Value = [dbo].[Strip_fn](@l_Value)

        if @l_ParamName = 'Роль: рецензент' and @l_Value > ''
            DELETE FROM [dbo].[Reviewers_tb] WHERE OrderID=@p_OrderID and Login=@l_Value

        DELETE FROM [dbo].[Params_tb] WHERE TID=@l_TID
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Удалено:[' + @l_ParamName + ']', @l_Value)

        set @p_Output = 'Removed'
    end else begin
        set @p_Output = 'Invalid'
    end

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[DEL_Param_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[DEL_Payment_sp]    Script Date: 05.10.2019 10:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEL_Payment_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DEL_Payment_sp] AS' 
END
GO
--
-- DEL NEW PROVISION PAYMENT
-- -------------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
ALTER PROCEDURE [dbo].[DEL_Payment_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_PaymentID        int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    DECLARE
        @l_TID          int = null,
        @l_PaymentName  varchar(50),
        @l_Value        varchar(100),
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1 and @p_ID > 0
        select @l_TID=TID from [dbo].[Payments_tb] where TID=@p_ID

    if @l_TID > 0
    begin
        --
        -- Get Payment name and value
        --
        select top 1 @l_PaymentName = Purpose, @l_Value = 
            'Дата: '  + cast(PaymentDate as varchar) + '; ' + 
            'Сумма: ' + cast(Total as varchar) + '; ' + 
            'НДС: '   + cast(Tax as varchar) + '; ' + 
            'Статус:' + cast(Status as varchar)
        from [dbo].[WEB_OrderPayments_vw] where TID=@l_TID

        DELETE FROM [dbo].[Payments_tb] WHERE TID=@l_TID
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Удалено:[' + @l_PaymentName + ']', @l_Value)
        
        set @p_Output = 'Removed'
    end else begin
        set @p_Output = 'Invalid'
    end

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[DEL_Payment_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[DEL_Seller_sp]    Script Date: 05.10.2019 10:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEL_Seller_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DEL_Seller_sp] AS' 
END
GO
--
-- DEL PROVISION SELLER
-- --------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
ALTER PROCEDURE [dbo].[DEL_Seller_sp]
    @p_Mode             int,
    @p_SellerID         int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    DECLARE
        @l_TID          int = null,
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where SellerID=@p_SellerID

    if @exists = 1 begin
        set @l_TID = @p_SellerID
        set @p_Output = 'Exists'
    end else if @p_SellerID > 0 begin
        set @l_TID = @p_SellerID

        DELETE FROM [dbo].[DIC_Sellers_tb] WHERE TID=@l_TID

        set @p_Output = 'Removed'
    end else begin
        set @p_Output = 'Invalid'
    end

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[DEL_Seller_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Order_sp]    Script Date: 05.10.2019 10:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REGISTER_Order_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[REGISTER_Order_sp] AS' 
END
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
    @p_Purpose          varchar(1000),
    @p_Price            float,
    @p_Currency         varchar(10),
    @p_Total            float,
    @p_Tax              float,
    @p_Subdivision      varchar(150),
    @p_Equipment        varchar(250),
    @p_Seller           varchar(1350),
    @p_Condition        varchar(50),
    @p_Account          varchar(200),
    @p_DueDate          varchar(10),
    @p_EditedBy         varchar(50),
    @p_Status           int,
    @p_IsNoPrice        int,
    @p_RowSpan          int,
    @p_Output           varchar(20) output
AS
BEGIN
    DECLARE
        @l_OrderID          int,
        @l_SubdivisionID    int,
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
    exec dbo.CHECK_Seller_sp 1, @p_Seller, @l_SellerID output

    declare 
        @exists bit = null

    set @p_Output = ''

    if @exists is null
    begin
        if @p_IsNoPrice = 1
            INSERT INTO [dbo].[Orders_tb](
                SubdivisionID,
                EquipmentID,
                SellerID,
                Login,
                Article,
                Qty,
                Purpose,
                Status,
                EditedBy,
                RowSpan,
                RD
            ) VALUES (
                @l_SubdivisionID,
                @l_EquipmentID,
                @l_SellerID,
                @p_Login,
                @p_Article,
                @p_Qty,
                @p_Purpose,
                @p_Status,
                @p_EditedBy,
                @p_RowSpan,
                @l_now
            )
        else
            INSERT INTO [dbo].[Orders_tb](
                SubdivisionID,
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
                Status,
                EditedBy,
                RowSpan,
                RD
            ) VALUES (
                @l_SubdivisionID,
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
                @p_Status,
                @p_EditedBy,
                @p_RowSpan,
                @l_now
            )

        select @l_OrderID = CAST(scope_identity() AS int)

        INSERT INTO [dbo].[OrderDates_tb](
            OrderID, 
            Created
        ) VALUES (
            @l_OrderID,
            @l_now
        )

        DECLARE @param varchar(20) = 'Срок исполнения'

        if [dbo].[CHECK_IsEmpty_fn](@p_DueDate) = 0
            EXEC [dbo].[ADD_Param_sp] 1, @l_OrderID, 0, 0, @p_EditedBy, @param, @p_DueDate, null
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@l_OrderID, @p_Login, 'НАИМЕНОВАНИЕ ТОВАРА', @p_Article),
            (@l_OrderID, @p_Login, 'Кол-во (шт)', @p_Qty),
            (@l_OrderID, @p_Login, 'ОТДЕЛ', @p_Subdivision),
            (@l_OrderID, @p_Login, 'Цена за единицу', @p_Price),
            (@l_OrderID, @p_Login, 'Валюта платежа', @p_Currency),
            --(@l_OrderID, @p_Login, 'СУММА', replace(convert(varchar, convert(money, @p_Total), 1), ',', ' ')),
            (@l_OrderID, @p_Login, 'СУММА', [dbo].[CONVERT_Money_fn](@p_Total)),
            (@l_OrderID, @p_Login, 'Условия оплаты', @p_Condition),
            (@l_OrderID, @p_Login, 'ПОСТАВЩИК', @p_Seller),
            (@l_OrderID, @p_Login, 'Обоснование', @p_Purpose),
            (@l_OrderID, @p_Login, 'Описание', @p_Equipment)

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
/****** Object:  StoredProcedure [dbo].[REGISTER_Review_sp]    Script Date: 05.10.2019 10:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REGISTER_Review_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[REGISTER_Review_sp] AS' 
END
GO
--
-- REGISTER NEW PROVISION REVIEW
-- -----------------------------
--   @p_OrderID      -- Order ID
--   @p_Login        -- login of reviewer
--   @p_Status       -- status of reviewer: 1 - accepted, 2 - rejected, 3 - comfirm
--   @p_Note         -- note of review
--
ALTER PROCEDURE [dbo].[REGISTER_Review_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_Login            varchar(50),
    @p_Reviewer         varchar(50),
    @p_Status           int,
    @p_Note             varchar(1000),
    @p_ReviewDueDate    varchar(10),
    @p_WithMail         bit,
    @p_Output           varchar(20) output
AS
BEGIN
    DECLARE
        @l_ReviewID     int = null,
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        INSERT INTO [dbo].[Reviews_tb](
            OrderID, 
            Login, 
            Reviewer, 
            Status, 
            Note, 
            RD
        ) VALUES (
            @p_OrderID,
            @p_Login,
            @p_Reviewer,
            @p_Status,
            @p_Note,
            @l_now
        )

        select @l_ReviewID = CAST(scope_identity() AS int)

        if @p_Login = 'aybazov' and @p_Status < 5 begin
            UPDATE [dbo].[Orders_tb] SET Status=@p_Status WHERE TID=@p_OrderID

            if @p_Status = 2
                UPDATE [dbo].[OrderDates_tb] SET Approved=@l_now WHERE OrderID=@p_OrderID
        end

        if @p_Status = 4 and @p_ReviewDueDate != ''
            UPDATE [dbo].[OrderDates_tb] SET ReviewDueDate=@p_ReviewDueDate, WithMail=@p_WithMail WHERE OrderID=@p_OrderID

        if @p_Status = 6
            UPDATE [dbo].[OrderDates_tb] SET Paid=case when @p_ReviewDueDate='' then @l_now else @p_ReviewDueDate end WHERE OrderID=@p_OrderID
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Рецензия', case @p_Status 
                when 2 then 'СОГЛАСОВАНО'
                when 3 then 'ОТКАЗАНО'
                when 4 then 'ТРЕБУЕТСЯ ОБОСНОВАНИЕ'
                when 5 then 'Информация'
                when 6 then 'Оплачено'
                else '...'
                end
                )

        set @p_Output = 'Registered'
    end else begin
        set @l_ReviewID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_ReviewID as varchar)

    if @p_Mode = 0
        SELECT @l_ReviewID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[REGISTER_Review_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[SET_Status_sp]    Script Date: 05.10.2019 10:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SET_Status_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SET_Status_sp] AS' 
END
GO
--
-- REGISTER NEW PROVISION REVIEW
-- -----------------------------
--   @p_OrderID      -- Order ID
--   @p_Login        -- login of reviewer
--   @p_Status       -- status of reviewer: 2 - accepted, 3 - rejected, 4 - comfirm
--
ALTER PROCEDURE [dbo].[SET_Status_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_Login            varchar(50),
    @p_Status           int,
    @p_Output           varchar(20) output
AS
BEGIN
    DECLARE
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        UPDATE [dbo].[Orders_tb] SET Status=@p_Status WHERE TID=@p_OrderID

        if @p_Status = 6
            UPDATE [dbo].[OrderDates_tb] SET Delivered=@l_now WHERE OrderID=@p_OrderID
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
                when 6 then 'Исполнено'
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
/****** Object:  StoredProcedure [dbo].[UPDATE_Order_sp]    Script Date: 05.10.2019 10:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_Order_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UPDATE_Order_sp] AS' 
END
GO
ALTER PROCEDURE [dbo].[UPDATE_Order_sp] 
    @p_Mode             int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Article          varchar(500),
    @p_Qty              int,
    @p_Purpose          varchar(1000),
    @p_Price            float,
    @p_Currency         varchar(10),
    @p_Total            float,
    @p_Tax              float,
    @p_Subdivision      varchar(150),
    @p_Equipment        varchar(250),
    @p_Seller           varchar(1350),
    @p_Condition        varchar(50),
    @p_DueDate          varchar(10),
    @p_EditedBy         varchar(50),
    @p_IsNoPrice        int,
    @p_Output           varchar(20) output
AS
BEGIN
    DECLARE
        @l_OrderID          int,
        @l_ParamID          int,
        @l_SubdivisionID    int,
        @l_SellerID         int,
        @l_EquipmentID      int,
        @l_ConditionID      int,
        @l_now              datetime

    DECLARE
        @c_Author           varchar(50), 
        @c_Article          varchar(500), 
        @c_Qty              int, 
        @c_Price            float, 
        @c_Currency         varchar(10), 
        @c_Total            money, 
        @c_Purpose          varchar(1000), 
        @c_Condition        varchar(50), 
        @c_Equipment        varchar(1000), 
        @c_Subdivision      varchar(50), 
        @c_Seller           varchar(100)

    set @l_now = getdate()
    --
    --    Check Subdivision exists
    --
    exec dbo.CHECK_Subdivision_sp 1, @p_Subdivision, @l_SubdivisionID output
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
    exec dbo.CHECK_Seller_sp 1, @p_Seller, @l_SellerID output

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_ID

    set @p_Output = ''

    if dbo.CHECK_IsEmpty_fn(@l_SubdivisionID) = 0 and @exists = 1
    begin
        select 
            @c_Author=Author, @c_Article=Article, @c_Qty=Qty, @c_Price=Price, @c_Currency=Currency, @c_Total=Total, @c_Purpose=Purpose, 
            @c_Condition=Condition, @c_Equipment=Equipment, @c_Subdivision=Subdivision, @c_Seller=Seller
        from [dbo].[WEB_Orders_vw] where TID=@p_ID

        if @p_IsNoPrice = 1
            UPDATE [dbo].[Orders_tb] SET
                SubdivisionID=@l_SubdivisionID,
                EquipmentID=@l_EquipmentID,
                SellerID=@l_SellerID,
                Login=@p_Login,
                Article=@p_Article,
                Qty=@p_Qty,
                Purpose=@p_Purpose,
                EditedBy=@p_EditedBy,
                RD=@l_now
            WHERE TID=@p_ID
        else
            UPDATE [dbo].[Orders_tb] SET
                SubdivisionID=@l_SubdivisionID,
                EquipmentID=@l_EquipmentID,
                ConditionID=@l_ConditionID,
                SellerID=@l_SellerID,
                Login=@p_Login,
                Article=@p_Article,
                Qty=@p_Qty,
                Purpose=@p_Purpose,
                Price=@p_Price,
                Currency=@p_Currency,
                Total=cast(@p_Total as money),
                Tax=cast(@p_Tax as money),
                EditedBy=@p_EditedBy,
                RD=@l_now
            WHERE TID=@p_ID

        select @l_OrderID = @p_ID

        set @p_Equipment = [dbo].[GET_SplittedItem_fn](@p_Equipment, '|', 0)
        set @p_Subdivision = [dbo].[GET_SplittedItem_fn](@p_Subdivision, '|', 0)
        set @p_Seller = [dbo].[GET_SplittedItem_fn](@p_Seller, '|', 0)
        set @p_Condition = [dbo].[GET_SplittedItem_fn](@p_Condition, '|', 0)
        --
        -- Add to Order Changes log
        --
        if @c_Article != @p_Article
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'НАИМЕНОВАНИЕ ТОВАРА', @p_Article)

        if @c_Equipment != @p_Equipment
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Описание', @p_Equipment)

        if @c_Qty != @p_Qty
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Кол-во (шт)', @p_Qty)

        if @c_Purpose != @p_Purpose
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Обоснование', @p_Purpose)

        if @c_Subdivision != @p_Subdivision
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'ОТДЕЛ', @p_Subdivision)

        if @c_Seller != @p_Seller
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'ПОСТАВЩИК', @p_Seller)

        if @p_IsNoPrice = 0 begin
            if @c_Author != @p_Login
                INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                    (@l_OrderID, @p_EditedBy, 'Заказчик', @p_Login)

            if @c_Price != @p_Price
                INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                    (@l_OrderID, @p_EditedBy, 'Цена за единицу', @p_Price)

            if @c_Currency != @p_Currency
                INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                    (@l_OrderID, @p_EditedBy, 'Валюта платежа', @p_Currency)

            if @c_Total != @p_Total
                INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                    (@l_OrderID, @p_EditedBy, 'СУММА', [dbo].[CONVERT_Money_fn](@p_Total))

            if @c_Condition != @p_Condition
                INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                    (@l_OrderID, @p_EditedBy, 'Условия оплаты', @p_Condition)
        end

        DECLARE @param varchar(20) = 'Срок исполнения'

        if [dbo].[CHECK_IsEmpty_fn](@p_DueDate) = 0
            EXEC [dbo].[ADD_Param_sp] 1, @l_OrderID, 0, 0, @p_EditedBy, @param, @p_DueDate, null
        else begin
            select @l_ParamID = TID from [dbo].[DIC_Params_tb] where Name=@param
            EXEC [dbo].[DEL_Param_sp] 1, @l_OrderID, @l_ParamID, 0, @p_EditedBy, null
        end

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
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderChanges_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderChanges_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderChanges_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderChanges_vw'
GO
