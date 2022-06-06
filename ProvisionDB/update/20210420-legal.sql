USE [ProvisionDB]
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_Order_sp]    Script Date: 04/22/2021 11:06:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_Order_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UPDATE_Order_sp]
GO
/****** Object:  View [dbo].[WEB_Schedule_vw]    Script Date: 04/22/2021 11:06:09 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Schedule_vw]'))
DROP VIEW [dbo].[WEB_Schedule_vw]
GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Order_sp]    Script Date: 04/22/2021 11:06:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REGISTER_Order_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[REGISTER_Order_sp]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Param_sp]    Script Date: 04/22/2021 11:06:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADD_Param_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ADD_Param_sp]
GO
/****** Object:  View [dbo].[WEB_OrderParams_vw]    Script Date: 04/22/2021 11:06:09 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_OrderParams_vw]'))
DROP VIEW [dbo].[WEB_OrderParams_vw]
GO
/****** Object:  UserDefinedFunction [dbo].[GET_SplittedStrings_fn]    Script Date: 04/22/2021 11:06:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_SplittedStrings_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GET_SplittedStrings_fn]
GO

alter table [dbo].[OrderDates_tb] add [FinishDueDate] [datetime] NULL
GO
update [dbo].[DIC_Params_tb] set Code='DE' where Name='Срок исполнения'
update [dbo].[DIC_Params_tb] set Code='AC' where Name='Номер счета'
update [dbo].[DIC_Params_tb] set Code='RW' where Name='Роль: рецензент'
GO

/****** Object:  UserDefinedFunction [dbo].[GET_SplittedStrings_fn]    Script Date: 04/22/2021 11:06:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_SplittedStrings_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'--
-- GET SPLITTED STRINGs VALUE TABLE
--   @pSource   -- source value
--   @pSplitter -- splitted by keyword
--
CREATE FUNCTION [dbo].[GET_SplittedStrings_fn](
    @pSource    varchar(MAX), 
    @pSplitter  varchar(10)
)
returns @data TABLE(n int IDENTITY(0,1), item varchar(1000))
AS
BEGIN
    DECLARE 
        @p int,
        @l int,
        @value varchar(1000)

    set @l = LEN(@pSplitter)

    WHILE LEN(@pSource) > 0
    BEGIN
        select @p = CHARINDEX(@pSplitter, @pSource)
        if @p = 0
            select @p = LEN(@pSource) + @l
        set @value = LEFT(@pSource, @p-1)
        insert into @data select @value
        set @pSource = SUBSTRING(@pSource, @p+@l, LEN(@pSource))
    END
    return
END
' 
END
GO
/****** Object:  View [dbo].[WEB_OrderParams_vw]    Script Date: 04/22/2021 11:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_OrderParams_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_OrderParams_vw]
AS
SELECT     s.TID, s.OrderID, s.ParamID, s.Login, p.Name, p.Code, s.Value, p.MD, s.RD
FROM         dbo.Params_tb AS s INNER JOIN
                      dbo.DIC_Params_tb AS p ON p.TID = s.ParamID
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderParams_vw', NULL,NULL))
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
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 93
               Right = 396
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderParams_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderParams_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderParams_vw'
GO
/****** Object:  StoredProcedure [dbo].[ADD_Param_sp]    Script Date: 04/22/2021 11:06:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADD_Param_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--
-- ADD NEW PROVISION PARAM
-- -----------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[ADD_Param_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_ParamID          int,
    @p_Login            varchar(50),
    @p_NewParam         varchar(50),
    @p_Value            varchar(500),
    @p_MD               int,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_ParamID      int = null,
        @l_TID          int = null,
        @l_ParamName    varchar(50),
        @l_ParamCode    varchar(10),
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
        if @p_ParamID is null or @p_ParamID = 0 begin
            select @l_ParamID=TID from [dbo].[DIC_Params_tb] where Name=@p_NewParam and (MD=@p_MD or MD is null)
            if @l_ParamID is null begin
                INSERT INTO [dbo].[DIC_Params_tb](Name, MD) VALUES(@p_NewParam, @p_MD)
                select @l_ParamID = CAST(scope_identity() AS int)
            end
        end else
            set @l_ParamID = @p_ParamID
        --
        -- Get Param name and value
        --
        select top 1 @l_ParamName=Name, @l_ParamCode=Code from [dbo].[DIC_Params_tb] where TID=@l_ParamID
        set @p_Value = [dbo].[Strip_fn](@p_Value)
        --
        -- Check if this is Reviewer line
        --
        set @exists = 0

        if @l_ParamCode = ''RW'' and [dbo].[CHECK_IsEmpty_fn](@p_Value) = 0 begin
            select @exists=1 from [dbo].[Reviewers_tb] where OrderID=@p_OrderID and Login=@p_Value

            if @exists = 0
                INSERT INTO [dbo].[Reviewers_tb] VALUES (
                    @p_OrderID,
                    @p_Value
                )

            set @l_TID = null
            set @exists = 1
        end

        else if @l_ParamCode = ''AC'' and [dbo].[CHECK_IsEmpty_fn](@p_Value) = 0
            UPDATE [dbo].[Orders_tb] SET Account=@p_Value where TID=@p_OrderID

        else if @l_ParamCode = ''DE'' and [dbo].[CHECK_IsEmpty_fn](@p_Value) = 0
            UPDATE [dbo].[OrderDates_tb] SET FinishDueDate=@p_Value where TID=@p_OrderID

        if @exists = 0 begin
            if @p_ID = 0
                select top 1 @l_TID=TID from [dbo].[Params_tb] where OrderID=@p_OrderID and ParamID=@l_ParamID
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

            set @p_Output = ''Updated''
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
            set @p_Output = ''Registered''
        end
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, ''Параметры:'' + @l_ParamName, @p_Value)

        if @@error != 0
            raiserror(''ошибка обработки'',16,1)
    end else begin
        set @l_TID = 0
        set @p_Output = ''Invalid''
    end

    set @p_Output = @p_Output + '':'' + cast(@l_TID as varchar) + '':'' + cast(@l_ParamID as varchar)

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N''[dbo].[ADD_Param_sp]'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1
    else
        return(0)
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Order_sp]    Script Date: 04/22/2021 11:06:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REGISTER_Order_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--
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

    set @p_Output = ''''

    if @exists = 1
        set @p_Output = ''Exists''

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

        select @l_OrderID = @l_TID

        INSERT INTO [dbo].[OrderDates_tb](
            OrderID, 
            Created
        ) VALUES (
            @l_OrderID,
            @l_now
        )

        DECLARE @param varchar(20) = case @p_MD when 20 then ''Срок действия'' else ''Срок исполнения'' end

        if [dbo].[CHECK_IsEmpty_fn](@p_DueDate) = 0
            EXEC [dbo].[ADD_Param_sp] 1, @l_OrderID, 0, 0, @p_EditedBy, @param, @p_DueDate, @p_MD, null
        /*
        set @param = ''Заказчик''
        EXEC [dbo].[ADD_Param_sp] 1, @l_OrderID, 0, 0, @p_EditedBy, @param, @p_Login, null
        */
        set @p_Subdivision = [dbo].[GET_SplittedItem_fn](@p_Subdivision, ''|'', 0)
        set @p_Sector = [dbo].[GET_SplittedItem_fn](@p_Sector, ''|'', 0)
        set @p_Category = [dbo].[GET_SplittedItem_fn](@p_Category, ''|'', 0)
        set @p_Equipment = [dbo].[GET_SplittedItem_fn](@p_Equipment, ''|'', 0)
        set @p_Seller = [dbo].[GET_SplittedItem_fn](@p_Seller, ''|'', 0)
        set @p_Condition = [dbo].[GET_SplittedItem_fn](@p_Condition, ''|'', 0)
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@l_OrderID, @l_Login, ''НАИМЕНОВАНИЕ ТОВАРА'', @p_Article),
            (@l_OrderID, @l_Login, ''Кол-во (шт)'', cast(@p_Qty as varchar)),
            (@l_OrderID, @l_Login, ''Обоснование'', @p_Purpose),
            (@l_OrderID, @l_Login, ''URL'', @p_URL)

        if @p_Price > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, ''Цена за единицу'', cast(@p_Price as varchar))

        if len(@p_Currency) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, ''Валюта платежа'', @p_Currency)

        if @p_Total > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, ''СУММА'', [dbo].[CONVERT_Money_fn](@p_Total))

        if len(@p_Equipment) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, ''Описание'', @p_Equipment)

        if len(@p_Condition) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, ''Условия оплаты'', @p_Condition)

        if len(@p_Seller) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, ''ПОСТАВЩИК'', @p_Seller)

        if len(@p_Category) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, ''Категория'', @p_Category)

        if len(@p_Subdivision) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, ''ПОТРЕБИТЕЛЬ'', @p_Subdivision)

        if len(@p_Sector) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, ''Участок производства'', @p_Sector)

        if len(@p_Account) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, ''Номер счета'', @p_Account)

        if len(@p_Login) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, ''Заказчик'', @p_Login)

        set @p_Output = ''Registered''
    end else begin
        set @l_OrderID = 0
        set @p_Output = ''Invalid'' 
            + '':'' + case when @l_SubdivisionID is null then ''NULL'' else cast(@l_SubdivisionID as varchar) end
            + '':'' + case when @l_SellerID is null then ''NULL'' else cast(@l_SellerID as varchar) end
    end

    set @p_Output = @p_Output + '':'' + cast(@l_OrderID as varchar)

    if @p_Mode = 0
        SELECT @l_OrderID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N''[dbo].[REGISTER_Order_sp]'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1
    else
        return(0)
END


' 
END
GO
/****** Object:  View [dbo].[WEB_Schedule_vw]    Script Date: 04/22/2021 11:06:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Schedule_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_Schedule_vw]
AS
SELECT     o.TID AS OrderID, o.Author, o.Price, o.Status AS OrderStatus, o.RD AS RegistryDate, r.TID AS ReviewID, r.Login AS Reviewer, r.Status AS ReviewStatus, d.Created, 
                      d.Approved, d.Paid, d.Delivered, d.ReviewDueDate, d.FinishDueDate, o.CategoryID, o.SubdivisionID, o.SubdivisionCode, o.MD, r.RD AS StatusDate
FROM         dbo.Reviews_tb AS r RIGHT OUTER JOIN
                      dbo.WEB_Orders_vw AS o ON o.TID = r.OrderID LEFT OUTER JOIN
                      dbo.OrderDates_tb AS d ON o.TID = d.OrderID
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Schedule_vw', NULL,NULL))
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
         Begin Table = "r"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 123
               Right = 417
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 455
               Bottom = 123
               Right = 621
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
      Begin ColumnWidths = 20
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Schedule_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Schedule_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Schedule_vw'
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_Order_sp]    Script Date: 04/22/2021 11:06:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_Order_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UPDATE_Order_sp] 
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
    @p_URL              varchar(200),
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
        @c_URL              varchar(200), 
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

    set @p_Output = ''''

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

        set @p_Subdivision = [dbo].[GET_SplittedItem_fn](@p_Subdivision, ''|'', 0)
        set @p_Sector = [dbo].[GET_SplittedItem_fn](@p_Sector, ''|'', 0)
        set @p_Category = [dbo].[GET_SplittedItem_fn](@p_Category, ''|'', 0)
        set @p_Equipment = [dbo].[GET_SplittedItem_fn](@p_Equipment, ''|'', 0)
        set @p_Seller = [dbo].[GET_SplittedItem_fn](@p_Seller, ''|'', 0)
        set @p_Condition = [dbo].[GET_SplittedItem_fn](@p_Condition, ''|'', 0)
        --
        -- Add to Order Changes log
        --
        if [dbo].[CHECK_IsEqual_fn](@c_Article, @p_Article) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, ''НАИМЕНОВАНИЕ ТОВАРА'', @p_Article)

        if [dbo].[CHECK_IsEqual_fn](@c_Equipment, @p_Equipment) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, ''Описание'', @p_Equipment)

        if [dbo].[CHECK_IsEqual_fn](@c_Qty, @p_Qty) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, ''Кол-во (шт)'', cast(@p_Qty as varchar))

        if [dbo].[CHECK_IsEqual_fn](@c_Purpose, @p_Purpose) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, ''Обоснование'', @p_Purpose)

        if [dbo].[CHECK_IsEqual_fn](@c_Category, @p_Category) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, ''Категория'', @p_Category)

        if [dbo].[CHECK_IsEqual_fn](@c_Subdivision, @p_Subdivision) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, ''ПОТРЕБИТЕЛЬ'', @p_Subdivision)

        if [dbo].[CHECK_IsEqual_fn](@c_Sector, @p_Sector) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, ''Участок производства'', @p_Sector)

        if [dbo].[CHECK_IsEqual_fn](@c_Account, @p_Account) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, ''Номер счета'', @p_Account)

        if [dbo].[CHECK_IsEqual_fn](@c_Author, @p_Login) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, ''Заказчик'', @p_Login)

        if [dbo].[CHECK_IsEqual_fn](@c_Seller, @p_Seller) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, ''ПОСТАВЩИК'', @p_Seller)

        if [dbo].[CHECK_IsEqual_fn](@c_URL, @p_URL) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, ''URL'', @p_URL)

        if @p_IsNoPrice = 0 begin
            if [dbo].[CHECK_IsEqual_fn](@c_Price, @p_Price) = 0 and @c_Price != @p_Price
                INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                    (@l_OrderID, @p_EditedBy, ''Цена за единицу'', cast(@p_Price as varchar))

            if [dbo].[CHECK_IsEqual_fn](@c_Currency, @p_Currency) = 0
                INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                    (@l_OrderID, @p_EditedBy, ''Валюта платежа'', @p_Currency)

            if [dbo].[CHECK_IsEqual_fn](@c_Total, @p_Total) = 0 and @c_Total != @p_Total
                INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                    (@l_OrderID, @p_EditedBy, ''СУММА'', [dbo].[CONVERT_Money_fn](@p_Total))

            if [dbo].[CHECK_IsEqual_fn](@c_Condition, @p_Condition) = 0
                INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                    (@l_OrderID, @p_EditedBy, ''Условия оплаты'', @p_Condition)
        end

        DECLARE @param varchar(20) = case @p_MD when 20 then ''Срок действия'' else ''Срок исполнения'' end

        select top 1 @l_ParamID = TID from [dbo].[DIC_Params_tb] where Name=@param and (MD=@p_MD or MD is null)

        if [dbo].[CHECK_IsEmpty_fn](@p_DueDate) = 0 begin
            select @l_DueDate=[Value] from [dbo].[Params_tb] where OrderID=@l_OrderID and ParamID=@l_ParamID
            if @p_DueDate != @l_DueDate or [dbo].[CHECK_IsEmpty_fn](@l_DueDate) = 1
                EXEC [dbo].[ADD_Param_sp] 1, @l_OrderID, 0, 0, @p_EditedBy, @param, @p_DueDate, @p_MD, null
        end else
            EXEC [dbo].[DEL_Param_sp] 1, @l_OrderID, @l_ParamID, 0, @p_EditedBy, null

        set @p_Output = ''Refreshed''
    end else begin
        set @l_OrderID = 0
        set @p_Output = ''Invalid'' 
            + '':'' + case when @l_SubdivisionID is null then ''NULL'' else cast(@l_SubdivisionID as varchar) end
            + '':'' + case when @l_SellerID is null then ''NULL'' else cast(@l_SellerID as varchar) end
            + '':'' + cast(@exists as varchar)
    end

    set @p_Output = @p_Output + '':'' + cast(@l_OrderID as varchar)

    if @p_Mode = 0
        SELECT @l_OrderID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N''[dbo].[UPDATE_Order_sp]'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1
    else
        return(0)
END


' 
END
GO

update [dbo].[OrderDates_tb] set FinishDueDate=(
  select top 1 convert(datetime, Value, 102) from [dbo].[WEB_OrderParams_vw] where Code='DE' and [dbo].[WEB_OrderParams_vw].OrderID=[dbo].[OrderDates_tb].OrderID and MD is NULL
)
GO
