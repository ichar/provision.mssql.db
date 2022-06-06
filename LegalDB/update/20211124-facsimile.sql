USE [LegalDB]
GO
alter table [dbo].[OrderDates_tb] add [Facsimile] [varchar](50) NULL
alter table [dbo].[Decrees_tb] add [Reported] [datetime] NULL
alter table [dbo].[Reviews_tb] alter column Note [varchar](8000) NULL
alter table [dbo].[OrderChanges_tb] alter column Value [varchar](8000) NULL

GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Orders_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Orders_vw'

GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Orders_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Orders_vw'

GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Orders_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Orders_vw'

GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Decrees_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Decrees_vw'

GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Decrees_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Decrees_vw'

GO
/****** Object:  StoredProcedure [dbo].[SET_OrderFacsimile_sp]    Script Date: 25.11.2021 16:04:49 ******/
DROP PROCEDURE IF EXISTS [dbo].[SET_OrderFacsimile_sp]
GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Review_sp]    Script Date: 25.11.2021 16:04:49 ******/
DROP PROCEDURE IF EXISTS [dbo].[REGISTER_Review_sp]
GO
/****** Object:  View [dbo].[WEB_Orders_vw]    Script Date: 25.11.2021 16:04:49 ******/
DROP VIEW IF EXISTS [dbo].[WEB_Orders_vw]
GO
/****** Object:  View [dbo].[WEB_Decrees_vw]    Script Date: 25.11.2021 16:04:49 ******/
DROP VIEW IF EXISTS [dbo].[WEB_Decrees_vw]
GO
/****** Object:  View [dbo].[WEB_Decrees_vw]    Script Date: 25.11.2021 16:04:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Decrees_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_Decrees_vw]
AS
SELECT        d.TID, d.Login AS Executor, d.Status AS DecreeStatus, d.DueDate, d.ReportID, d.EditedBy, r.TID AS ReviewID, r.OrderID, r.Login AS Author, r.Reviewer, r.Note, r.Status AS ReviewStatus, r.RD AS ReviewDate, 
                         d.Accepted, d.Reported, d.MD, d.RD
FROM            dbo.Decrees_tb AS d INNER JOIN
                         dbo.Reviews_tb AS r ON r.TID = d.ReviewID
' 
GO
/****** Object:  View [dbo].[WEB_Orders_vw]    Script Date: 25.11.2021 16:04:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Orders_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_Orders_vw]
AS
SELECT        o.TID, o.Login AS Author, o.Article, o.Qty, o.Purpose, o.Price, o.Currency, o.Total, o.Tax,
                             (SELECT        TOP (1) Name
                               FROM            dbo.WEB_Companies_vw
                               WHERE        (OrderID = o.TID)) AS Company, p.Name AS Subdivision, u.Name AS Sector, e.Title AS Equipment, e.Name AS EquipmentName, c.Name AS Condition, s.Name AS Seller, s.Code AS SellerCode, 
                         s.Type AS SellerType, s.Title AS SellerTitle, s.Address AS SellerAddress, s.Contact AS SellerContact, s.URL AS SellerURL, g.Name AS Category, o.Account, o.URL, o.Status,
                             (SELECT        TOP (1) Status
                               FROM            dbo.Reviews_tb AS r
                               WHERE        (OrderID = o.TID)
                               ORDER BY TID DESC) AS ReviewStatus, dbo.GET_ReviewStatuses_fn(o.TID) AS ReviewStatuses, p.Code AS SubdivisionCode, p.TID AS SubdivisionID, u.TID AS SectorID, e.TID AS EquipmentID, 
                         s.TID AS SellerID, c.TID AS ConditionID, o.CategoryID, o.StockListID, l.NodeCode AS StockListNodeCode, dbo.GET_UnreadByLogin_fn(o.TID) AS UnreadByLogin, o.EditedBy, o.RowSpan, d.Created, d.Approved, 
                         d.ReviewDueDate, d.Paid, d.Delivered, d.AuditDate, d.Validated, d.FinishDueDate, d.Facsimile, o.MD, o.RD
FROM            dbo.Orders_tb AS o LEFT OUTER JOIN
                         dbo.DIC_Subdivisions_tb AS p ON p.TID = o.SubdivisionID LEFT OUTER JOIN
                         dbo.DIC_Sectors_tb AS u ON u.TID = o.SectorID LEFT OUTER JOIN
                         dbo.DIC_Equipments_tb AS e ON e.TID = o.EquipmentID LEFT OUTER JOIN
                         dbo.DIC_Conditions_tb AS c ON c.TID = o.ConditionID LEFT OUTER JOIN
                         dbo.DIC_Sellers_tb AS s ON s.TID = o.SellerID LEFT OUTER JOIN
                         dbo.DIC_Categories_tb AS g ON g.TID = o.CategoryID LEFT OUTER JOIN
                         dbo.DIC_StockList_tb AS l ON l.TID = o.StockListID LEFT OUTER JOIN
                         dbo.OrderDates_tb AS d ON d.OrderID = o.TID
' 
GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Review_sp]    Script Date: 25.11.2021 16:04:49 ******/
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
    @p_ReviewID         int,
    @p_DecreeID         int,
    @p_ReportID         int,
    @p_Login            varchar(50),
    @p_Reviewer         varchar(50),
    @p_Status           int,
    @p_Note             varchar(8000),
    @p_ReviewDueDate    varchar(10),
    @p_WithMail         bit,
    @p_Executor         varchar(50),
    @p_Report           varchar(8000),
    @p_EditedBy         varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_ReviewID     int = null,
        @l_DecreeID     int = 0,
        @l_ReportID     int = 0,
        @l_Author       varchar(50),
        @l_now          datetime

    set @p_Output = ''
    set @l_now = getdate()

    declare 
        @exists bit = null,
        @is_decree_report bit = null

    select @exists=1, @l_Author=Login from [dbo].[Orders_tb] where TID=@p_OrderID

    set @is_decree_report = case when @p_Status=9 and @p_Login=@p_Executor then 1 else 0 end

    if @exists = 1
    begin
        if @p_ReviewID = 0 begin
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
                raiserror('ошибка добавления рецензии',16,1)

            select @l_ReviewID = CAST(scope_identity() AS int)
        end else if @is_decree_report = 0 begin
            UPDATE [dbo].[Reviews_tb] SET Login=@p_Login, Reviewer=@p_Reviewer, Note=@p_Note, RD=@l_now WHERE TID=@p_ReviewID

            if @@error != 0
                raiserror('ошибка обновления рецензии',16,1)
        
            set @l_ReviewID = @p_ReviewID
        end else
            set @l_ReviewID = @p_ReviewID

        if (@p_Login = 'aybazov' or @p_Login = @l_Author) and @p_Status < 5 begin
            UPDATE [dbo].[Orders_tb] SET Status=@p_Status WHERE TID=@p_OrderID

            if @p_Status = 2
                UPDATE [dbo].[OrderDates_tb] SET Approved=@l_now WHERE OrderID=@p_OrderID
        end

        if @@error != 0
            raiserror('ошибка смены статуса',16,1)

        else if @p_Status = 4 and @p_ReviewDueDate != ''
            UPDATE [dbo].[OrderDates_tb] SET ReviewDueDate=@p_ReviewDueDate, WithMail=@p_WithMail WHERE OrderID=@p_OrderID

        else if @p_Status = 6
            UPDATE [dbo].[OrderDates_tb] SET Paid=case when @p_ReviewDueDate='' then @l_now else @p_ReviewDueDate end WHERE OrderID=@p_OrderID

        else if @p_Status = 7
            UPDATE [dbo].[OrderDates_tb] SET Delivered=case when @p_ReviewDueDate='' then @l_now else @p_ReviewDueDate end WHERE OrderID=@p_OrderID

        else if @p_Status = 10
            UPDATE [dbo].[OrderDates_tb] SET AuditDate=@l_now WHERE OrderID=@p_OrderID

        else if @p_Status = 12
            UPDATE [dbo].[OrderDates_tb] SET Validated=@l_now WHERE OrderID=@p_OrderID

        if @@error != 0
            raiserror('ошибка регистрации даты рецензии',16,1)
        --
        -- Add Decree Executor
        --
        if @p_Status = 9
        begin
            if @p_DecreeID = 0 begin
                INSERT INTO [dbo].[Decrees_tb](
                    OrderID,
                    ReviewID, 
                    Login, 
                    Status,
                    DueDate,
                    ReportID,
                    EditedBy, 
                    RD
                ) VALUES (
                    @p_OrderID,
                    @l_ReviewID,
                    @p_Executor,
                    0,
                    @p_ReviewDueDate,
                    null,
                    @p_EditedBy,
                    @l_now
                )

                if @@error != 0
                    raiserror('ошибка добавления поручения',16,1)

                select @l_DecreeID = CAST(scope_identity() AS int)
            
            end else begin
                if @is_decree_report = 1 begin
                    if @p_ReportID = 0 begin
                        INSERT INTO [dbo].[Reviews_tb](
                            OrderID, 
                            Login, 
                            Reviewer, 
                            Status, 
                            Note, 
                            RD
                        ) VALUES (
                            @p_OrderID,
                            @p_Executor,
                            @p_Reviewer,
                            5,
                            @p_Report,
                            @l_now
                        )

                        if @@error != 0
                            raiserror('ошибка добавления отчета исполнителя',16,1)

                        select @l_ReportID = CAST(scope_identity() AS int)

                    end else begin
                        UPDATE [dbo].[Reviews_tb] SET Note=@p_Report, Reviewer=@p_Reviewer, RD=@l_now WHERE TID=@p_ReportID

                        if @@error != 0
                            raiserror('ошибка обновления отчета исполнителя',16,1)
        
                        set @l_ReportID = @p_ReportID
                    end

                    UPDATE [dbo].[Decrees_tb] SET ReportID=@l_ReportID, EditedBy=@p_EditedBy, Reported=@l_now WHERE TID=@p_DecreeID

                    if @@error != 0
                        raiserror('ошибка обновления поручения',16,1)

                    INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                        (@p_OrderID, @p_Executor, 'Отчет о выполнении поручения', @p_Report)
                
                end else if @p_ReviewDueDate is not null begin
                    UPDATE [dbo].[Decrees_tb] SET Login=@p_Executor, Status=0, DueDate=@p_ReviewDueDate, EditedBy=@p_EditedBy, RD=@l_now WHERE TID=@p_DecreeID

                    if @@error != 0
                        raiserror('ошибка обновления поручения',16,1)

                    INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                        (@p_OrderID, @p_EditedBy, 'Срок исполнения поручения', @p_ReviewDueDate)
                end

                set @l_DecreeID = @p_DecreeID
            end
        end

        if @@error != 0
            raiserror('ошибка добавления рецензии',16,1)
        --
        -- Add to Order Changes log
        --
        if @is_decree_report = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@p_OrderID, @p_Login, 'Рецензия', case @p_Status 
                    when  2 then 'СОГЛАСОВАНО'
                    when  3 then 'ОТКАЗАНО'
                    when  4 then 'ТРЕБУЕТСЯ ОБОСНОВАНИЕ'
                    when  5 then 'Информация'
                    when  6 then 'Оплачено'
                    when  7 then 'Поставлено на склад'
                    when  9 then 'ПОРУЧЕНИЕ'
                    when 10 then 'АУДИТ'
                    when 11 then 'Замечание'
                    when 12 then 'Акцептовано к закрытию'
                    else '...'
                    end +
                    case when [dbo].[CHECK_IsEmpty_fn](@p_Note) = 0 then ':'+@p_Note else '' end
                    )

        if @@error != 0
            raiserror('ошибка обработки',16,1)

        set @p_Output = 'Registered'
    end else begin
        set @l_ReviewID = 0
        set @l_DecreeID = 0
        set @l_ReportID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_ReviewID as varchar) -- + ':' + cast(@l_DecreeID as varchar)

    if @p_Mode = 0
        SELECT @l_ReviewID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[REGISTER_Review_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[SET_OrderFacsimile_sp]    Script Date: 25.11.2021 16:04:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SET_OrderFacsimile_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SET_OrderFacsimile_sp] AS' 
END
GO
ALTER PROCEDURE [dbo].[SET_OrderFacsimile_sp] 
    @p_Mode             int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Facsimile        varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_OrderID          int,
        @l_now              datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_ID

    set @p_Output = ''

    if @exists = 1
    begin
        UPDATE [dbo].[OrderDates_tb] SET Facsimile=@p_Facsimile WHERE OrderID=@p_ID

        if @@error != 0
            raiserror('ошибка обработки',16,1)

        select @l_OrderID = @p_ID
        set @p_Output = 'Updated'
    end else begin
        set @l_OrderID = 0
        set @p_Output = 'Invalid' 
            + ':' + cast(@exists as varchar)
    end
    
    if @l_OrderID > 0
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@l_OrderID, @p_Login, 'ФАКСИМИЛЕ', @p_Facsimile)

    set @p_Output = @p_Output + ':' + cast(@l_OrderID as varchar)

    if @p_Mode = 0
        SELECT @l_OrderID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[SET_OrderFacsimile_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Decrees_vw', NULL,NULL))
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
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "r"
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Decrees_vw'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Decrees_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Decrees_vw'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Orders_vw', NULL,NULL))
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
               Top = 6
               Left = 652
               Bottom = 136
               Right = 822
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
               Top = 198
               Left = 236
               Bottom = 311
               Right = 406
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 222
               Left = 444
               Bottom = 352
               Right = 614
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
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Orders_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         Begin Table = "l"
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
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Orders_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Orders_vw'
GO
