USE [SaleDB]
GO
/****** Object:  View [dbo].[WEB_Orders_vw]    Script Date: 29.01.2022 8:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_Orders_vw]
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
                         ProvisionDB.dbo.DIC_StockList_tb AS l ON l.TID = o.StockListID LEFT OUTER JOIN
                         dbo.OrderDates_tb AS d ON d.OrderID = o.TID

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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         Begin Table = "d"
            Begin Extent = 
               Top = 138
               Left = 652
               Bottom = 255
               Right = 818
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "l"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Orders_vw'
GO
