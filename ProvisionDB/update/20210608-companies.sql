USE [ProvisionDB]
GO
/****** Object:  View [dbo].[WEB_Orders_vw]    Script Date: 06/14/2021 10:35:52 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Orders_vw]'))
DROP VIEW [dbo].[WEB_Orders_vw]
GO
/****** Object:  View [dbo].[WEB_Companies_vw]    Script Date: 06/14/2021 10:35:52 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Companies_vw]'))
DROP VIEW [dbo].[WEB_Companies_vw]
GO
/****** Object:  View [dbo].[WEB_OrderDocuments_vw]    Script Date: 06/14/2021 10:35:52 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_OrderDocuments_vw]'))
DROP VIEW [dbo].[WEB_OrderDocuments_vw]
GO
/****** Object:  View [dbo].[WEB_OrderParams_vw]    Script Date: 06/14/2021 10:35:52 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_OrderParams_vw]'))
DROP VIEW [dbo].[WEB_OrderParams_vw]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Document_sp]    Script Date: 06/14/2021 10:35:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADD_Document_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ADD_Document_sp]
GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Review_sp]    Script Date: 06/14/2021 10:35:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REGISTER_Review_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[REGISTER_Review_sp]
GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Review_sp]    Script Date: 06/14/2021 10:35:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BATCH_SetCompany_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[BATCH_SetCompany_sp]
GO

--alter table [ProvisionDB].[dbo].[OrderDocuments_tb] add [ForAudit] [bit] NULL
--alter table [ProvisionDB].[dbo].[DIC_Refers_tb] alter column Name [varchar](100) NULL
GO

/****** Object:  StoredProcedure [dbo].[REGISTER_Review_sp]    Script Date: 06/14/2021 10:35:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REGISTER_Review_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--
-- REGISTER NEW PROVISION REVIEW
-- -----------------------------
--   @p_OrderID      -- Order ID
--   @p_Login        -- login of reviewer
--   @p_Status       -- status of reviewer: 1 - accepted, 2 - rejected, 3 - comfirm
--   @p_Note         -- note of review
--
CREATE PROCEDURE [dbo].[REGISTER_Review_sp]
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
    SET NOCOUNT ON

    DECLARE
        @l_ReviewID     int = null,
        @l_now          datetime

    set @p_Output = ''''
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

        if @@error != 0
            raiserror(''ошибка добавления рецензии'',16,1)

        select @l_ReviewID = CAST(scope_identity() AS int)

        if @p_Login = ''aybazov'' and @p_Status < 5 begin
            UPDATE [dbo].[Orders_tb] SET Status=@p_Status WHERE TID=@p_OrderID

            if @p_Status = 2
                UPDATE [dbo].[OrderDates_tb] SET Approved=@l_now WHERE OrderID=@p_OrderID
        end

        if @@error != 0
            raiserror(''ошибка смены статуса'',16,1)

        else if @p_Status = 4 and @p_ReviewDueDate != ''''
            UPDATE [dbo].[OrderDates_tb] SET ReviewDueDate=@p_ReviewDueDate, WithMail=@p_WithMail WHERE OrderID=@p_OrderID

        else if @p_Status = 6
            UPDATE [dbo].[OrderDates_tb] SET Paid=case when @p_ReviewDueDate='''' then @l_now else @p_ReviewDueDate end WHERE OrderID=@p_OrderID

        else if @p_Status = 7 begin
            UPDATE [dbo].[Orders_tb] SET Status=6 WHERE TID=@p_OrderID
            UPDATE [dbo].[OrderDates_tb] SET Delivered=case when @p_ReviewDueDate='''' then @l_now else @p_ReviewDueDate end WHERE OrderID=@p_OrderID
        end

        else if @p_Status = 9 and @p_ReviewDueDate != ''''
            UPDATE [dbo].[OrderDates_tb] SET ReviewDueDate=@p_ReviewDueDate, WithMail=@p_WithMail WHERE OrderID=@p_OrderID

        if @@error != 0
            raiserror(''ошибка регистрации даты рецензии'',16,1)
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, ''Рецензия'', case @p_Status 
                when 1 then ''Акцептовано к закрытию''
                when 2 then ''СОГЛАСОВАНО''
                when 3 then ''ОТКАЗАНО''
                when 4 then ''ТРЕБУЕТСЯ ОБОСНОВАНИЕ''
                when 5 then ''Информация''
                when 6 then ''Оплачено''
                when 7 then ''Поставлено на склад''
                when 9 then ''РАСПОРЯЖЕНИЕ''
                else ''...''
                end +
                case when [dbo].[CHECK_IsEmpty_fn](@p_Note) = 0 then '':''+@p_Note else '''' end
                )

        if @@error != 0
            raiserror(''ошибка обработки'',16,1)

        set @p_Output = ''Registered''
    end else begin
        set @l_ReviewID = 0
        set @p_Output = ''Invalid''
    end

    set @p_Output = @p_Output + '':'' + cast(@l_ReviewID as varchar)

    if @p_Mode = 0
        SELECT @l_ReviewID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N''[dbo].[REGISTER_Review_sp]'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1
    else
        return(0)
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[ADD_Document_sp]    Script Date: 06/14/2021 10:35:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADD_Document_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--
-- UPLOAD IMAGE BLOB
-- -----------------
--   @p_OrderID      -- Order ID
--   @p_Login        -- login of reviewer
--   @p_Note         -- note of review
--
CREATE PROCEDURE [dbo].[ADD_Document_sp]
    @p_Mode             int,
    @p_UID              varchar(50),
    @p_OrderID          int,
    @p_Login            varchar(50),
    @p_FileName         varchar(255),
    @p_FileSize         int,
    @p_ContentType      varchar(20),
    @p_ForAudit         bit,
    @p_Note             varchar(1000),
    @p_Image            image,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

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
            ForAudit,
            Note,
            Image
        ) VALUES (
            @p_UID,
            @p_OrderID,
            @p_Login,
            @p_FileName,
            @p_FileSize,
            @p_ContentType,
            @p_ForAudit,
            @p_Note,
            @p_Image
        )

        select @l_DocumentID = CAST(scope_identity() AS int)
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, ''Документ'', [dbo].[Strip_fn](
                ''Имя файла: ''  + @p_FileName + ''; '' + 
                ''Содержание: '' + @p_Note + ''; '' + 
                ''ДБО: '' + cast(@p_ForAudit as varchar)
                ))

        set @p_Output = ''Registered''
    end else begin
        set @l_DocumentID = 0
        set @p_Output = ''Invalid''
    end

    set @p_Output = @p_Output + '':'' + cast(@l_DocumentID as varchar)

    if @p_Mode = 0
        SELECT @l_DocumentID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N''[dbo].[ADD_Document_sp]'') and OBJECTPROPERTY(id, N''IsProcedure'') = 1
    else
        return(0)
END

' 
END
GO
/****** Object:  View [dbo].[WEB_OrderParams_vw]    Script Date: 06/14/2021 10:35:52 ******/
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
/****** Object:  View [dbo].[WEB_OrderDocuments_vw]    Script Date: 06/14/2021 10:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_OrderDocuments_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_OrderDocuments_vw]
AS
SELECT     TID, UID, OrderID, Login, FileName, FileSize, ContentType, CASE WHEN d .Image IS NULL THEN 0 ELSE 1 END AS IsExist, Note, ForAudit, RD
FROM         dbo.OrderDocuments_tb AS d
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderDocuments_vw', NULL,NULL))
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
         Begin Table = "d"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderDocuments_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderDocuments_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderDocuments_vw'
GO
/****** Object:  View [dbo].[WEB_Companies_vw]    Script Date: 06/14/2021 10:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Companies_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_Companies_vw]
AS
SELECT DISTINCT p.OrderID, p.Value AS Name
FROM         dbo.Params_tb AS p INNER JOIN
                      dbo.DIC_Params_tb AS d ON d.TID = p.ParamID
WHERE     (d.Name LIKE ''Компания%'')
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Companies_vw', NULL,NULL))
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
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 123
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Companies_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Companies_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Companies_vw'
GO
/****** Object:  View [dbo].[WEB_Orders_vw]    Script Date: 06/14/2021 10:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Orders_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_Orders_vw]
AS
SELECT     o.TID, o.Login AS Author, o.Article, o.Qty, o.Purpose, o.Price, o.Currency, o.Total, o.Tax, v.Name AS Company, p.Name AS Subdivision, u.Name AS Sector, 
                      e.Title AS Equipment, e.Name AS EquipmentName, c.Name AS Condition, s.Name AS Seller, s.Code AS SellerCode, s.Type AS SellerType, s.Title AS SellerTitle, 
                      s.Address AS SellerAddress, s.Contact AS SellerContact, s.URL AS SellerURL, g.Name AS Category, o.Account, o.URL, o.Status,
                          (SELECT     TOP (1) Status
                            FROM          dbo.Reviews_tb AS r
                            WHERE      (OrderID = o.TID)
                            ORDER BY TID DESC) AS ReviewStatus, dbo.GET_ReviewStatuses_fn(o.TID) AS ReviewStatuses, p.Code AS SubdivisionCode, p.TID AS SubdivisionID, 
                      u.TID AS SectorID, e.TID AS EquipmentID, s.TID AS SellerID, c.TID AS ConditionID, o.CategoryID, o.StockListID, l.NodeCode AS StockListNodeCode, 
                      dbo.GET_UnreadByLogin_fn(o.TID) AS UnreadByLogin, o.EditedBy, o.RowSpan, d.Created, d.Approved, d.ReviewDueDate, d.Paid, d.Delivered, d.FinishDueDate, o.MD,
                       o.RD
FROM         dbo.Orders_tb AS o LEFT OUTER JOIN
                      dbo.DIC_Subdivisions_tb AS p ON p.TID = o.SubdivisionID LEFT OUTER JOIN
                      dbo.DIC_Sectors_tb AS u ON u.TID = o.SectorID LEFT OUTER JOIN
                      dbo.DIC_Equipments_tb AS e ON e.TID = o.EquipmentID LEFT OUTER JOIN
                      dbo.DIC_Conditions_tb AS c ON c.TID = o.ConditionID LEFT OUTER JOIN
                      dbo.DIC_Sellers_tb AS s ON s.TID = o.SellerID LEFT OUTER JOIN
                      dbo.DIC_Categories_tb AS g ON g.TID = o.CategoryID LEFT OUTER JOIN
                      dbo.DIC_StockList_tb AS l ON l.TID = o.StockListID LEFT OUTER JOIN
                      dbo.OrderDates_tb AS d ON d.OrderID = o.TID LEFT OUTER JOIN
                      dbo.WEB_Companies_vw AS v ON v.OrderID = o.TID
'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Orders_vw', NULL,NULL))
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
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u"
            Begin Extent = 
               Top = 120
               Left = 246
               Bottom = 237
               Right = 406
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 102
               Left = 454
               Bottom = 219
               Right = 614
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "g"
            Begin Extent = 
               Top = 120
               Left = 246
               Bottom = 198
               Right = 397
            End
            DisplayFlags = 280
            TopColumn = 0
         End
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Orders_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Orders_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'       Begin Table = "l"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 255
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 138
               Left = 652
               Bottom = 255
               Right = 818
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v"
            Begin Extent = 
               Top = 222
               Left = 444
               Bottom = 309
               Right = 604
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
      Begin ColumnWidths = 45
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Orders_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Orders_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Orders_vw'
GO

/****** Object:  StoredProcedure [dbo].[BATCH_SetCompany_sp]    Script Date: 06/14/2021 11:27:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- SET COMPANY VALUE INSIDE ORDERS TABLE PARAMS
-- --------------------------------------------
-- EXEC [ProvisionDB].[dbo].[BATCH_SetCompany_sp] 1,42,NULL,'Розан Файнэнс, АО','2021-01-01',0,'admin'
-- EXEC [ProvisionDB].[dbo].[BATCH_SetCompany_sp] 1,42,'8,19,30','Розан Даймонд, ООО','2021-01-01',0,'admin'
-- EXEC [ProvisionDB].[dbo].[BATCH_SetCompany_sp] 1,42,'37','ЭкспрессКард, АО','2021-01-01',0,'admin'
-- EXEC [ProvisionDB].[dbo].[BATCH_SetCompany_sp] 1,42,'10,32','Розан Логистик, ООО','2021-01-01',0,'admin'
-- EXEC [ProvisionDB].[dbo].[BATCH_SetCompany_sp] 1,42,'11','Розан СПБ','2021-01-01',0,'admin'
-- EXEC [ProvisionDB].[dbo].[BATCH_SetCompany_sp] 1,42,'39','3Д ПЭЙ, ООО','2021-01-01',0,'admin'
--
CREATE PROCEDURE [dbo].[BATCH_SetCompany_sp] 
    @p_CheckOnly     bit,
    @p_ParamID       int, -- 45
    @p_Subdivisions  varchar(50),
    @p_Company       varchar(50),
    @p_RD            date,
    @p_MD            int,
    @p_Author        varchar(50)
AS
BEGIN
    DECLARE 
        @OrderID     int, 
        @l_RD        date,
        @l_MD        int,
        @l_Author    varchar(50),
        @exists      bit

    set @l_RD = case @p_RD when '' then '2021-01-01' else @p_RD end
    set @l_MD = case when @p_MD IS NULL then 0 else @p_MD end
    set @l_Author = case @p_Author when '' then 'admin' else @p_Author end

    select * into #tmp from [dbo].[GET_SplittedIDs_fn](@p_Subdivisions, ',')

    DECLARE x CURSOR READ_ONLY FOR SELECT TID FROM [dbo].[WEB_Orders_vw] WHERE
        (@p_Subdivisions IS NULL or SubdivisionID in (select item from #tmp)) and 
            RD > @l_RD and 
            MD=@l_MD
    OPEN x
    while (1=1) begin
        set @exists = null
        FETCH NEXT FROM x INTO @OrderID
        if @@fetch_status = -1
            break
        select @exists=1 from [dbo].[Params_tb] where OrderID=@OrderID and ParamID=@p_ParamID
        if @exists is null begin
            if @p_CheckOnly = 0
                insert into [dbo].[Params_tb](OrderID, ParamID, Login, Value) values(@OrderID, @p_ParamID, @l_Author, @p_Company)
            print(@OrderID)
        end
    end
    CLOSE x
    DEALLOCATE x

    drop table #tmp

    return(0)
END
GO
-------------------------------------------------
-- CHECK @p_ParamID BEFORE 42 or 45! IMPORTANT!!!
-------------------------------------------------
-- EXEC [ProvisionDB].[dbo].[BATCH_SetCompany_sp] 1,45,NULL,'Розан Файнэнс, АО','2021-01-01',0,'admin'
-- EXEC [ProvisionDB].[dbo].[BATCH_SetCompany_sp] 1,45,'8,19,30','Розан Даймонд, ООО','2021-01-01',0,'admin'
-- EXEC [ProvisionDB].[dbo].[BATCH_SetCompany_sp] 1,45,'37','ЭкспрессКард, АО','2021-01-01',0,'admin'
-- EXEC [ProvisionDB].[dbo].[BATCH_SetCompany_sp] 1,45,'10,32','Розан Логистик, ООО','2021-01-01',0,'admin'
-- EXEC [ProvisionDB].[dbo].[BATCH_SetCompany_sp] 1,45,'11','Розан СПБ','2021-01-01',0,'admin'
-- EXEC [ProvisionDB].[dbo].[BATCH_SetCompany_sp] 1,45,'39','3Д ПЭЙ, ООО','2021-01-01',0,'admin'
GO
