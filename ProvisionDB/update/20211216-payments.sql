USE [ProvisionDB]
GO
update [dbo].[Payments_tb] set Currency='RUB' where Currency='RUR'
update [dbo].[Orders_tb] set Currency='RUB' where Currency='RUR'
GO

alter table [dbo].[Payments_tb] add [ExchangeRate] [float] NULL
GO

EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_ReviewPayments_vw'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_ReviewPayments_vw'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_ReviewPayments_vw'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderPayments_vw'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderPayments_vw'

GO
/****** Object:  View [dbo].[WEB_ReviewPayments_vw]    Script Date: 17.12.2021 4:07:15 ******/
DROP VIEW [dbo].[WEB_ReviewPayments_vw]
GO
/****** Object:  View [dbo].[WEB_OrderPayments_vw]    Script Date: 17.12.2021 4:07:15 ******/
DROP VIEW [dbo].[WEB_OrderPayments_vw]
GO
/****** Object:  View [dbo].[WEB_OrderPayments_vw]    Script Date: 17.12.2021 4:07:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_OrderPayments_vw]
AS
SELECT        s.TID, s.OrderID, s.PaymentID, s.Login, p.Name AS Purpose, s.PaymentDate, s.Total, s.Tax, s.Status, s.Currency, s.Comment, s.Rate, s.ExchangeRate, s.RD
FROM            dbo.Payments_tb AS s INNER JOIN
                         dbo.DIC_Payments_tb AS p ON p.TID = s.PaymentID

GO
/****** Object:  View [dbo].[WEB_ReviewPayments_vw]    Script Date: 17.12.2021 4:07:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_ReviewPayments_vw]
AS
SELECT        s.TID, s.OrderID, o.SubdivisionID, o.Login AS Author, d.Name AS Subdivision, o.Article, o.Currency AS OrderCurrency, o.Total AS OrderTotal, s.PaymentID, s.Login, p.Name AS Purpose, c.Name AS Seller, 
                         s.PaymentDate, s.Total, s.Total * s.Rate AS TotalRub, s.Tax, s.Status, s.Currency, s.Rate, s.ExchangeRate, s.Comment, o.MD, s.RD
FROM            dbo.Payments_tb AS s INNER JOIN
                         dbo.Orders_tb AS o ON o.TID = s.OrderID INNER JOIN
                         dbo.DIC_Payments_tb AS p ON p.TID = s.PaymentID LEFT OUTER JOIN
                         dbo.DIC_Subdivisions_tb AS d ON d.TID = o.SubdivisionID LEFT OUTER JOIN
                         dbo.DIC_Sellers_tb AS c ON c.TID = o.SellerID

GO
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
      Begin ColumnWidths = 14
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderPayments_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderPayments_vw'
GO
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
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 126
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 7
               Left = 774
               Bottom = 170
               Right = 968
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 126
               Left = 532
               Bottom = 289
               Right = 726
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
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_ReviewPayments_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'720
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_ReviewPayments_vw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_ReviewPayments_vw'
GO
/****** Object:  StoredProcedure [dbo].[ADD_Payment_sp]    Script Date: 01.08.2019 17:34:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
    @p_Currency         varchar(10),
    @p_Rate             float,
    @p_ExchangeRate     float,
    @p_Status           int,
    @p_Comment          varchar(1000),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_TID          int = null,
        @l_PaymentID    int = null,
        @l_PaymentName  varchar(50),
        @l_Value        varchar(2000),
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
                Currency=@p_Currency,
                Rate=@p_Rate,
                ExchangeRate=@p_ExchangeRate,
                Status=@p_Status,
                Comment=@p_Comment,
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
                Currency,
                Rate,
                ExchangeRate,
                Status,
                Comment,
                RD
            ) VALUES (
                @p_OrderID,
                @l_PaymentID,
                @p_Login,
                case when [dbo].[CHECK_IsEmpty_fn](@p_PaymentDate) = 0 then @p_PaymentDate else @l_now end,
                @p_Total,
                @p_Tax,
                @p_Currency,
                @p_Rate,
                @p_ExchangeRate,
                @p_Status,
                @p_Comment,
                @l_now
            )
    
            select @l_TID = CAST(scope_identity() AS int)
            set @p_Output = 'Registered'
        end
        --
        -- Get Payment name and value
        --
        select top 1 @l_PaymentName = Purpose, @l_Value = 
            'Дата: '    + cast(PaymentDate as varchar) + '; ' + 
            'Сумма: '   + cast(Total as varchar) + '; ' + 
            'НДС: '     + cast(Tax as varchar) + '; ' + 
            'Валюта: '  + Currency + '; ' + 
            'Курс: '    + cast(Rate as varchar) + '; ' + 
            'Покупка: ' + cast(ExchangeRate as varchar) + '; ' + 
            'Статус:'   + cast(Status as varchar)
        from [dbo].[WEB_OrderPayments_vw] where TID=@l_TID
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Платежи:' + @l_PaymentName, @l_Value + case when @p_Comment > '' then ' [' + @p_Comment + ']' else '' end)
        --
        -- Add to Payment Changes log
        --
        INSERT INTO [dbo].[PaymentChanges_tb](
            PaymentID, 
            OrderID, 
            Login, 
            Status, 
            RD
        ) VALUES (
            @l_TID,
            @p_OrderID,
            @p_Login,
            @p_Status,
            @l_now
        )

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
