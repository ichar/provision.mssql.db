USE [ProvisionDB]
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Stocks_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Stocks_vw'

GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Stocks_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Stocks_vw'

GO
/****** Object:  StoredProcedure [dbo].[BATCH_SetAutoclosed_sp]    Script Date: 24.03.2021 15:25:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BATCH_SetAutoclosed_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[BATCH_SetAutoclosed_sp]
GO
/****** Object:  View [dbo].[WEB_Stocks_vw]    Script Date: 24.03.2021 15:25:59 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Stocks_vw]'))
DROP VIEW [dbo].[WEB_Stocks_vw]
GO
/****** Object:  UserDefinedFunction [dbo].[CHECK_IsInReviews_fn]    Script Date: 24.03.2021 15:25:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHECK_IsInReviews_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[CHECK_IsInReviews_fn]
GO

alter table [ProvisionDB].[dbo].[DIC_StockList_tb] add [Params] [varchar](200) NULL
GO
update [ProvisionDB].[dbo].[DIC_StockList_tb] set Params='PD:' where TID in (7,331)
GO

/****** Object:  UserDefinedFunction [dbo].[CHECK_IsInReviews_fn]    Script Date: 24.03.2021 15:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHECK_IsInReviews_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'--
-- CHECK IF GIVEN STATUSES IS IN REVIEWS
--   @pReviews  -- source value
--   @pStatuses -- statuses: ''1,2,3,4''
--
CREATE FUNCTION [dbo].[CHECK_IsInReviews_fn](
    @pReviews   varchar(MAX), 
    @pStatuses  varchar(50)    
)
returns bit
AS
BEGIN
    DECLARE
        @exists  bit

    select top 1 @exists=1 from [dbo].[GET_SplittedStrings_fn](@pReviews, '':'') where 
        item in (select item from [dbo].[GET_SplittedStrings_fn](@pStatuses, '',''))
    if @exists IS NULL
        return 0
    return 1
END
' 
END

GO
/****** Object:  View [dbo].[WEB_Stocks_vw]    Script Date: 24.03.2021 15:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Stocks_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_Stocks_vw]
AS
SELECT        TID, Name, Title, ShortName, NodeLevel, NodeCode, RefCode1C, Params, Comment, EditedBy, RD, Children,
                             (SELECT        COUNT(*) AS Expr1
                               FROM            dbo.Orders_tb AS o
                               WHERE        (StockListID = s.TID)) AS Orders
FROM            dbo.DIC_StockList_tb AS s
' 
GO
/****** Object:  StoredProcedure [dbo].[BATCH_SetAutoclosed_sp]    Script Date: 24.03.2021 15:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BATCH_SetAutoclosed_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[BATCH_SetAutoclosed_sp] AS' 
END
GO
ALTER PROCEDURE [dbo].[BATCH_SetAutoclosed_sp] 
    @p_CheckOnly     bit,
    @p_Author        varchar(50)
AS
BEGIN
    DECLARE 
        @OrderID     int, 
        @StockListID int,
		@Params      varchar(200),
        @total       int

	create table #tmp(OrderID int, StockListID int, Params varchar(200))

    DECLARE x CURSOR READ_ONLY FOR SELECT TID, StockListID FROM [dbo].[WEB_Orders_vw] WHERE
		[dbo].[CHECK_IsInReviews_fn](ReviewStatuses, '7,8')=0 and 
		[dbo].[CHECK_IsInReviews_fn](ReviewStatuses, '6')=1 and 
		Status in (6,7) and 
        (@p_Author is NULL or Author=@p_Author) and 
        MD=0
    OPEN x
    while (1=1) begin
        FETCH NEXT FROM x INTO @OrderID, @StockListID
        if @@fetch_status = -1
            break
        if @StockListID > 0 begin
            select @Params=Params from [dbo].[WEB_Stocks_vw] where TID=@StockListID
            insert into #tmp values(@OrderID, @StockListID, @Params)
        
            if @p_CheckOnly = 0
                EXEC [dbo].[REGISTER_Review_sp] 1,@OrderID,'stock','Администрация (менеджер)',8,'',NULL,0,NULL
        end
    end
    CLOSE x
    DEALLOCATE x

    if @p_CheckOnly = 1
        select * from [dbo].[WEB_Orders_vw], #tmp where TID=#tmp.OrderID order by TID desc
    else begin
        select @total=count(*) from #tmp
        --print('Applied for ' + cast(@total as varchar) + ' records.')
        SELECT 'Applied for ' + cast(@total as varchar) + ' records.' FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[BATCH_SetAutoclosed_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    end
	
    drop table #tmp

    return(0)
END


GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Stocks_vw', NULL,NULL))
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Stocks_vw'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Stocks_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Stocks_vw'
GO
