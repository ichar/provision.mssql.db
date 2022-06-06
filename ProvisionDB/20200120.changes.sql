USE [ProvisionDB]
GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Subdivisions_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Subdivisions_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Subdivisions_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Subdivisions_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Sellers_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Sellers_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Sellers_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Sellers_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Schedule_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Schedule_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Schedule_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Schedule_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Reviews_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Reviews_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Reviews_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Reviews_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_ReviewerOrders_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_ReviewerOrders_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_ReviewerOrders_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_ReviewerOrders_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Payments_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Payments_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Payments_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Payments_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Params_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Params_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Params_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Params_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Orders_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Orders_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Orders_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Orders_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Orders_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Orders_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderPayments_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderPayments_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderPayments_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderPayments_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderParams_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderParams_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderParams_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderParams_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderItems_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderItems_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderItems_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderItems_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderDocuments_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderDocuments_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderDocuments_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderDocuments_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderComments_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderComments_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderComments_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderComments_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderChanges_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderChanges_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderChanges_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderChanges_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Equipments_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Equipments_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Equipments_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Equipments_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Conditions_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Conditions_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Conditions_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Conditions_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Comments_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Comments_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Comments_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Comments_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Categories_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Categories_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Categories_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Categories_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Authors_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Authors_vw'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Authors_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Authors_vw'

GO
/****** Object:  StoredProcedure [dbo].[UPDATE_Seller_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_Seller_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UPDATE_Seller_sp]
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_Order_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_Order_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UPDATE_Order_sp]
GO
/****** Object:  StoredProcedure [dbo].[SET_Unread_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SET_Unread_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SET_Unread_sp]
GO
/****** Object:  StoredProcedure [dbo].[SET_Status_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SET_Status_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SET_Status_sp]
GO
/****** Object:  StoredProcedure [dbo].[SET_Read_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SET_Read_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SET_Read_sp]
GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Review_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REGISTER_Review_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[REGISTER_Review_sp]
GO
/****** Object:  StoredProcedure [dbo].[REGISTER_OrderStockList_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REGISTER_OrderStockList_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[REGISTER_OrderStockList_sp]
GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Order_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REGISTER_Order_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[REGISTER_Order_sp]
GO
/****** Object:  StoredProcedure [dbo].[DELETE_Order_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DELETE_Order_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DELETE_Order_sp]
GO
/****** Object:  StoredProcedure [dbo].[DEL_Seller_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEL_Seller_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DEL_Seller_sp]
GO
/****** Object:  StoredProcedure [dbo].[DEL_Payment_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEL_Payment_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DEL_Payment_sp]
GO
/****** Object:  StoredProcedure [dbo].[DEL_Param_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEL_Param_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DEL_Param_sp]
GO
/****** Object:  StoredProcedure [dbo].[DEL_Item_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEL_Item_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DEL_Item_sp]
GO
/****** Object:  StoredProcedure [dbo].[DEL_Document_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEL_Document_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DEL_Document_sp]
GO
/****** Object:  StoredProcedure [dbo].[DEL_Comment_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEL_Comment_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DEL_Comment_sp]
GO
/****** Object:  StoredProcedure [dbo].[CHECK_Subdivision_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHECK_Subdivision_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CHECK_Subdivision_sp]
GO
/****** Object:  StoredProcedure [dbo].[CHECK_Seller_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHECK_Seller_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CHECK_Seller_sp]
GO
/****** Object:  StoredProcedure [dbo].[CHECK_Equipment_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHECK_Equipment_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CHECK_Equipment_sp]
GO
/****** Object:  StoredProcedure [dbo].[CHECK_Condition_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHECK_Condition_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CHECK_Condition_sp]
GO
/****** Object:  StoredProcedure [dbo].[CHECK_Category_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHECK_Category_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CHECK_Category_sp]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Payment_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADD_Payment_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ADD_Payment_sp]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Param_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADD_Param_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ADD_Param_sp]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Item_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADD_Item_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ADD_Item_sp]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Document_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADD_Document_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ADD_Document_sp]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Comment_sp]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADD_Comment_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ADD_Comment_sp]
GO
/****** Object:  View [dbo].[WEB_Subdivisions_vw]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Subdivisions_vw]'))
DROP VIEW [dbo].[WEB_Subdivisions_vw]
GO
/****** Object:  View [dbo].[WEB_Sellers_vw]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Sellers_vw]'))
DROP VIEW [dbo].[WEB_Sellers_vw]
GO
/****** Object:  View [dbo].[WEB_Reviews_vw]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Reviews_vw]'))
DROP VIEW [dbo].[WEB_Reviews_vw]
GO
/****** Object:  View [dbo].[WEB_Payments_vw]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Payments_vw]'))
DROP VIEW [dbo].[WEB_Payments_vw]
GO
/****** Object:  View [dbo].[WEB_Params_vw]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Params_vw]'))
DROP VIEW [dbo].[WEB_Params_vw]
GO
/****** Object:  View [dbo].[WEB_OrderPayments_vw]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_OrderPayments_vw]'))
DROP VIEW [dbo].[WEB_OrderPayments_vw]
GO
/****** Object:  View [dbo].[WEB_OrderParams_vw]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_OrderParams_vw]'))
DROP VIEW [dbo].[WEB_OrderParams_vw]
GO
/****** Object:  View [dbo].[WEB_OrderItems_vw]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_OrderItems_vw]'))
DROP VIEW [dbo].[WEB_OrderItems_vw]
GO
/****** Object:  View [dbo].[WEB_OrderDocuments_vw]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_OrderDocuments_vw]'))
DROP VIEW [dbo].[WEB_OrderDocuments_vw]
GO
/****** Object:  View [dbo].[WEB_OrderComments_vw]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_OrderComments_vw]'))
DROP VIEW [dbo].[WEB_OrderComments_vw]
GO
/****** Object:  View [dbo].[WEB_OrderChanges_vw]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_OrderChanges_vw]'))
DROP VIEW [dbo].[WEB_OrderChanges_vw]
GO
/****** Object:  View [dbo].[WEB_Equipments_vw]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Equipments_vw]'))
DROP VIEW [dbo].[WEB_Equipments_vw]
GO
/****** Object:  View [dbo].[WEB_Conditions_vw]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Conditions_vw]'))
DROP VIEW [dbo].[WEB_Conditions_vw]
GO
/****** Object:  View [dbo].[WEB_Comments_vw]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Comments_vw]'))
DROP VIEW [dbo].[WEB_Comments_vw]
GO
/****** Object:  View [dbo].[WEB_Categories_vw]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Categories_vw]'))
DROP VIEW [dbo].[WEB_Categories_vw]
GO
/****** Object:  View [dbo].[WEB_Authors_vw]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Authors_vw]'))
DROP VIEW [dbo].[WEB_Authors_vw]
GO
/****** Object:  View [dbo].[WEB_ReviewerOrders_vw]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_ReviewerOrders_vw]'))
DROP VIEW [dbo].[WEB_ReviewerOrders_vw]
GO
/****** Object:  View [dbo].[WEB_Schedule_vw]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Schedule_vw]'))
DROP VIEW [dbo].[WEB_Schedule_vw]
GO
/****** Object:  View [dbo].[WEB_Orders_vw]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Orders_vw]'))
DROP VIEW [dbo].[WEB_Orders_vw]
GO
/****** Object:  UserDefinedFunction [dbo].[Strip_fn]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Strip_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[Strip_fn]
GO
/****** Object:  UserDefinedFunction [dbo].[GET_UnreadByLogin_fn]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_UnreadByLogin_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GET_UnreadByLogin_fn]
GO
/****** Object:  UserDefinedFunction [dbo].[GET_SplittedStrings_fn]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_SplittedStrings_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GET_SplittedStrings_fn]
GO
/****** Object:  UserDefinedFunction [dbo].[GET_SplittedItem_fn]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_SplittedItem_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GET_SplittedItem_fn]
GO
/****** Object:  UserDefinedFunction [dbo].[GET_SplittedIDs_fn]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_SplittedIDs_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GET_SplittedIDs_fn]
GO
/****** Object:  UserDefinedFunction [dbo].[GET_RowsNodeCount_fn]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_RowsNodeCount_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GET_RowsNodeCount_fn]
GO
/****** Object:  UserDefinedFunction [dbo].[GET_ReviewStatuses_fn]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_ReviewStatuses_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GET_ReviewStatuses_fn]
GO
/****** Object:  UserDefinedFunction [dbo].[GET_Reviewers_fn]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_Reviewers_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GET_Reviewers_fn]
GO
/****** Object:  UserDefinedFunction [dbo].[DATE_GetDateTime_fn]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DATE_GetDateTime_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[DATE_GetDateTime_fn]
GO
/****** Object:  UserDefinedFunction [dbo].[CONVERT_Money_fn]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CONVERT_Money_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[CONVERT_Money_fn]
GO
/****** Object:  UserDefinedFunction [dbo].[CHECK_IsNumeric_fn]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHECK_IsNumeric_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[CHECK_IsNumeric_fn]
GO
/****** Object:  UserDefinedFunction [dbo].[CHECK_IsInReviewers_fn]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHECK_IsInReviewers_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[CHECK_IsInReviewers_fn]
GO
/****** Object:  UserDefinedFunction [dbo].[CHECK_IsEmpty_fn]    Script Date: 20.01.2020 16:03:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHECK_IsEmpty_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[CHECK_IsEmpty_fn]
GO
/****** Object:  UserDefinedFunction [dbo].[CHECK_IsEmpty_fn]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHECK_IsEmpty_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'--
-- CHECK EMPTY VALUE
--   0 -- source value is not empty value
--   1 -- EMPTY
--
-- x-parser, v 0.3.5, 2010-10-01, ichar
--
CREATE function [dbo].[CHECK_IsEmpty_fn](@pSource varchar(1000))
returns int
as
BEGIN
    if @pSource is NULL or LEN(@pSource) = 0
        return 1 -- 0
    if RTRIM(LTRIM(@pSource)) <> ''''
        return 0
    return 1
END

' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[CHECK_IsInReviewers_fn]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHECK_IsInReviewers_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'--
-- CHECK IF LOGIN IS IN REVIEWERS LIST
--
CREATE function [dbo].[CHECK_IsInReviewers_fn](@p_OrderID int, @p_Login varchar(50))
returns bit
as
BEGIN
    declare @x bit = 0
    select @x=1 from [ProvisionDB].[dbo].[Reviewers_tb] where OrderID=@p_OrderID and Login=@p_Login
    return @x
END

' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[CHECK_IsNumeric_fn]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHECK_IsNumeric_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'--
-- CHECK VALID NUMERIC
--   0 -- source value is not a valid number
--   1 -- OK
--
-- x-parser, v 0.3.5, 2010-10-01, ichar
--
CREATE function [dbo].[CHECK_IsNumeric_fn](@pSource varchar(2000))
returns int
as
BEGIN
    if @pSource is NULL or LEN(@pSource) = 0 or ISNUMERIC(@pSource) = 0
        return 0
    return 1
END

' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[CONVERT_Money_fn]    Script Date: 20.01.2020 16:03:25 ******/
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
/****** Object:  UserDefinedFunction [dbo].[DATE_GetDateTime_fn]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DATE_GetDateTime_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'--
-- RETURNS CURRENT DATETIME WITH SPECIAL FORMATING
--
-- x-parser, v 0.3.5, 2010-10-01, ichar
--
CREATE function [dbo].[DATE_GetDateTime_fn](@datevalue datetime, @datetype varchar(10))
returns varchar(10)
as
BEGIN
    DECLARE @s varchar(50), @y char(2), @yy char(4), @m char(2), @d char(2), @mode varchar(10)
    set @s  = convert( varchar, cast(@datevalue as datetime), 121 )
    set @y  = substring(@s, 3, 2)
    set @yy = substring(@s, 1, 4)
    set @m  = substring(@s, 6, 2)
    set @d  = substring(@s, 9, 2)

    set @mode = lower(@datetype)

    if @mode = ''yymmdd'' return @y+@m+@d
    if @mode = ''yyyymmdd'' return @yy+@m+@d
    if @mode = ''ddmmyy'' return @d+@m+@y
    if @mode = ''ddmmyyyy'' return @d+@m+@yy
    if @mode = ''mm/yy'' return @m+''/''+@y
    if @mode = ''mm/yyyy'' return @m+''/''+@yy
    if @mode = ''dd/mm/yy'' return @d+''/''+@m+''/''+@y
    if @mode = ''dd/mm/yyyy'' return @d+''/''+@m+''/''+@yy
    if @mode = ''dd.mm.yy'' return @d+''.''+@m+''.''+@y
    if @mode = ''dd.mm.yyyy'' return @d+''.''+@m+''.''+@yy
    return @s
END

' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[GET_Reviewers_fn]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_Reviewers_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'--
-- RETURNS REVIEWER LIST AS STRING
--
CREATE function [dbo].[GET_Reviewers_fn](@p_OrderID int)
returns varchar(1000)
as
BEGIN
    DECLARE 
        @s varchar(1000) = '''', 
        @v varchar(1000)
    DECLARE x CURSOR READ_ONLY FOR SELECT [Login] FROM [ProvisionDB].[dbo].[Reviewers_tb] WHERE OrderID=@p_OrderID
    OPEN x
    while (1=1) begin
        FETCH NEXT FROM x INTO @v
        if @@fetch_status = -1
            break
        set @s = @s + @v + '':''
    end
    CLOSE x
    DEALLOCATE x
    return @s
END

' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[GET_ReviewStatuses_fn]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_ReviewStatuses_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'--
-- RETURNS REVIEW STATUSES FOR GIVEN ORDER ID
--
CREATE function [dbo].[GET_ReviewStatuses_fn](@p_OrderID int)
returns varchar(500)
as
BEGIN
    declare @x varchar(500) = ''''
    select @x = @x + cast(Status as varchar) + '':'' from dbo.Reviews_tb where OrderID=@p_OrderID
    return @x
END

' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[GET_RowsNodeCount_fn]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_RowsNodeCount_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'--
CREATE function [dbo].[GET_RowsNodeCount_fn](@pCode varchar(100))
returns int
as
BEGIN
    DECLARE 
        @rows int = 0
    select 
        @rows=count(*) from [dbo].[DIC_StockList_tb] where NodeCode like @pCode+''.%''
    return @rows
END

' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[GET_SplittedIDs_fn]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_SplittedIDs_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'--
-- GET SPLITTED IDs VALUE TABLE
--   @pSource   -- source value
--   @pSplitter -- splitted by keyword
--
CREATE FUNCTION [dbo].[GET_SplittedIDs_fn](
    @pSource    varchar(MAX), 
    @pSplitter  varchar(10)
)
returns @data TABLE(n int IDENTITY(0,1), item int)
AS
BEGIN
    DECLARE @p int
    DECLARE @value int

    WHILE LEN(@pSource) > 0
    BEGIN
        select @p = CHARINDEX(@pSplitter, @pSource)
        if @p = 0
            select @p = LEN(@pSource) + 1
        set @value = cast(LEFT(@pSource, @p-1) as int)
        insert into @data select @value
        set @pSource = SUBSTRING(@pSource, @p+1, LEN(@pSource))
    END
    return
END

' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[GET_SplittedItem_fn]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_SplittedItem_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'--
-- GET SPLITTED STRING VALUE ITEM
--   @pSource   -- source value
--   @pSplitter -- splitted by keyword
--   @pNum      -- item index (int: 0,1,2...)
--
CREATE function [dbo].[GET_SplittedItem_fn](@pSource varchar(MAX), @pSplitter varchar(10), @pNum int)
returns varchar(MAX)
as
BEGIN
    if @pSource is NULL or LEN(@pSource) = 0
        return ''''
    DECLARE @data TABLE(n int IDENTITY(0,1), item varchar(MAX))
    DECLARE @v varchar(2000)
    DECLARE @p int
    set @v = ''''

    WHILE LEN(@pSource) > 0
    BEGIN
        select @p  = CHARINDEX(@pSplitter, @pSource)
        if @p = 0
            select @p = LEN(@pSource)+1
        insert into @data select LEFT(@pSource, @p-1)
        set @pSource = SUBSTRING(@pSource, @p+1, LEN(@pSource))
    END

    if @pNum + 1 <= (select count(*) from @data)
        SELECT @v = item FROM @data WHERE n = @pNum
    return @v
END

' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[GET_SplittedStrings_fn]    Script Date: 20.01.2020 16:03:25 ******/
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
/****** Object:  UserDefinedFunction [dbo].[GET_UnreadByLogin_fn]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GET_UnreadByLogin_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'--
-- RETURNS UNREAD LOGIN FOR GIVEN ORDER ID
--
CREATE function [dbo].[GET_UnreadByLogin_fn](@p_OrderID int)
returns varchar(500)
as
BEGIN
    declare @x varchar(500) = ''''
    select @x = @x + Login + '':'' from dbo.Unreads_tb where OrderID=@p_OrderID
    return @x
END


' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[Strip_fn]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Strip_fn]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE  FUNCTION [dbo].[Strip_fn](@v varchar(max))
returns varchar(max)
as
begin
  return LTRIM(RTRIM(ISNULL(@v, '''')))
end
' 
END

GO
/****** Object:  View [dbo].[WEB_Orders_vw]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Orders_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_Orders_vw]
AS
SELECT   o.TID, o.Login AS Author, o.Article, o.Qty, o.Purpose, o.Price, o.Currency, o.Total, o.Tax, d.Name AS Subdivision, e.Title AS Equipment, e.Name AS EquipmentName, c.Name AS Condition, s.Name AS Seller, s.Code AS SellerCode, s.Type AS SellerType, s.Title AS SellerTitle, s.Address AS SellerAddress, s.Contact AS SellerContact, 
             s.URL AS SellerURL, g.Name AS Category, o.Account, o.URL, o.Status,
                 (SELECT   TOP (1) Status
                 FROM     dbo.Reviews_tb AS r
                 WHERE   (OrderID = o.TID)
                 ORDER BY TID DESC) AS ReviewStatus, dbo.GET_ReviewStatuses_fn(o.TID) AS ReviewStatuses, d.Code AS SubdivisionCode, d.TID AS SubdivisionID, e.TID AS EquipmentID, s.TID AS SellerID, c.TID AS ConditionID, o.CategoryID, o.StockListID, l.NodeCode AS StockListNodeCode, dbo.GET_UnreadByLogin_fn(o.TID) AS UnreadByLogin, 
             o.EditedBy, o.RowSpan, o.RD
FROM     dbo.Orders_tb AS o LEFT OUTER JOIN
             dbo.DIC_Subdivisions_tb AS d ON d.TID = o.SubdivisionID LEFT OUTER JOIN
             dbo.DIC_Equipments_tb AS e ON e.TID = o.EquipmentID LEFT OUTER JOIN
             dbo.DIC_Conditions_tb AS c ON c.TID = o.ConditionID LEFT OUTER JOIN
             dbo.DIC_Sellers_tb AS s ON s.TID = o.SellerID LEFT OUTER JOIN
             dbo.DIC_Categories_tb AS g ON g.TID = o.CategoryID LEFT OUTER JOIN
             dbo.DIC_StockList_tb AS l ON l.TID = o.StockListID
' 
GO
/****** Object:  View [dbo].[WEB_Schedule_vw]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Schedule_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_Schedule_vw]
AS
SELECT   o.TID AS OrderID, o.Author, o.Price, o.Status AS OrderStatus, o.RD AS RegistryDate, r.TID AS ReviewID, r.Login AS Reviewer, r.Status AS ReviewStatus, d.Created, d.Approved, d.Paid, d.Delivered, d.ReviewDueDate, o.SubdivisionID, o.SubdivisionCode, r.RD AS StatusDate
FROM     dbo.Reviews_tb AS r RIGHT OUTER JOIN
             dbo.WEB_Orders_vw AS o ON o.TID = r.OrderID LEFT OUTER JOIN
             dbo.OrderDates_tb AS d ON o.TID = d.OrderID
' 
GO
/****** Object:  View [dbo].[WEB_ReviewerOrders_vw]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_ReviewerOrders_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_ReviewerOrders_vw]
AS
SELECT     o.TID, o.Author, o.Article, o.Qty, o.Purpose, o.Price, o.Currency, o.Total, o.Tax, o.Subdivision, o.Equipment, o.Condition, o.Seller, o.Account, o.Status, o.ReviewStatus, 
                      o.SubdivisionCode, o.SubdivisionID, o.EquipmentID, o.SellerID, o.ConditionID, o.EditedBy, o.RowSpan, o.RD, r.Login AS Reviewer
FROM         dbo.WEB_Orders_vw AS o LEFT OUTER JOIN
                      dbo.Reviewers_tb AS r ON r.OrderID = o.TID
' 
GO
/****** Object:  View [dbo].[WEB_Authors_vw]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Authors_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_Authors_vw]
AS
SELECT DISTINCT TOP (100) PERCENT Login AS Author
FROM            dbo.Orders_tb AS o

' 
GO
/****** Object:  View [dbo].[WEB_Categories_vw]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Categories_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_Categories_vw]
AS
SELECT   TID, Name
FROM         dbo.DIC_Categories_tb AS s
' 
GO
/****** Object:  View [dbo].[WEB_Comments_vw]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Comments_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_Comments_vw]
AS
SELECT     TID, Name
FROM         dbo.DIC_Comments_tb AS s

' 
GO
/****** Object:  View [dbo].[WEB_Conditions_vw]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Conditions_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_Conditions_vw]
AS
SELECT        TID, Name
FROM            dbo.DIC_Conditions_tb AS s

' 
GO
/****** Object:  View [dbo].[WEB_Equipments_vw]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Equipments_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_Equipments_vw]
AS
SELECT     s.TID, d.Name AS Subdivision, s.Title, s.Name, s.SubdivisionID
FROM         dbo.DIC_Equipments_tb AS s INNER JOIN
                      dbo.DIC_Subdivisions_tb AS d ON d.TID = s.SubdivisionID

' 
GO
/****** Object:  View [dbo].[WEB_OrderChanges_vw]    Script Date: 20.01.2020 16:03:25 ******/
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
/****** Object:  View [dbo].[WEB_OrderComments_vw]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_OrderComments_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_OrderComments_vw]
AS
SELECT     s.TID, s.OrderID, s.CommentID, s.Login, p.Name AS Author, s.Note, s.RD
FROM         dbo.Comments_tb AS s INNER JOIN
                      dbo.DIC_Comments_tb AS p ON p.TID = s.CommentID

' 
GO
/****** Object:  View [dbo].[WEB_OrderDocuments_vw]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_OrderDocuments_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_OrderDocuments_vw]
AS
SELECT     TID, UID, OrderID, Login, FileName, FileSize, ContentType, CASE WHEN d .Image IS NULL THEN 0 ELSE 1 END AS IsExist, Note, RD
FROM         dbo.OrderDocuments_tb AS d
' 
GO
/****** Object:  View [dbo].[WEB_OrderItems_vw]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_OrderItems_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_OrderItems_vw]
AS
SELECT     TID, OrderID, Login, Name, Qty, Units, Total, Tax, Account, RD
FROM         dbo.Items_tb AS s
' 
GO
/****** Object:  View [dbo].[WEB_OrderParams_vw]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_OrderParams_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_OrderParams_vw]
AS
SELECT     s.TID, s.OrderID, s.ParamID, s.Login, p.Name, s.Value, s.RD
FROM         dbo.Params_tb AS s INNER JOIN
                      dbo.DIC_Params_tb AS p ON p.TID = s.ParamID

' 
GO
/****** Object:  View [dbo].[WEB_OrderPayments_vw]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_OrderPayments_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_OrderPayments_vw]
AS
SELECT     s.TID, s.OrderID, s.PaymentID, s.Login, p.Name AS Purpose, s.PaymentDate, s.Total, s.Tax, s.Status, s.RD
FROM         dbo.Payments_tb AS s INNER JOIN
                      dbo.DIC_Payments_tb AS p ON p.TID = s.PaymentID

' 
GO
/****** Object:  View [dbo].[WEB_Params_vw]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Params_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_Params_vw]
AS
SELECT     TID, Name
FROM         dbo.DIC_Params_tb AS s

' 
GO
/****** Object:  View [dbo].[WEB_Payments_vw]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Payments_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_Payments_vw]
AS
SELECT     TID, Name
FROM         dbo.DIC_Payments_tb AS s

' 
GO
/****** Object:  View [dbo].[WEB_Reviews_vw]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Reviews_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_Reviews_vw]
AS
SELECT     r.TID, o.TID AS OrderID, r.Login, r.Reviewer, r.Status, r.Note, o.RD AS RegistryDate, r.RD AS StatusDate
FROM         dbo.Reviews_tb AS r INNER JOIN
                      dbo.Orders_tb AS o ON o.TID = r.OrderID

' 
GO
/****** Object:  View [dbo].[WEB_Sellers_vw]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Sellers_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_Sellers_vw]
AS
SELECT        TID, Name, Title, Address, Code, Type, s.Contact, URL, Phone, Email, EditedBy, RD
FROM            dbo.DIC_Sellers_tb AS s
' 
GO
/****** Object:  View [dbo].[WEB_Subdivisions_vw]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Subdivisions_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_Subdivisions_vw]
AS
SELECT     TID, Name, Code, Manager, Name + '' ('' + Manager + '')'' AS FullName
FROM         dbo.DIC_Subdivisions_tb AS s
' 
GO
/****** Object:  StoredProcedure [dbo].[ADD_Comment_sp]    Script Date: 20.01.2020 16:03:25 ******/
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
/****** Object:  StoredProcedure [dbo].[ADD_Document_sp]    Script Date: 20.01.2020 16:03:25 ******/
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
/****** Object:  StoredProcedure [dbo].[ADD_Item_sp]    Script Date: 20.01.2020 16:03:25 ******/
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
            (@p_OrderID, @p_Login, 'Счет:' + @l_ItemName, @l_Value)
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
/****** Object:  StoredProcedure [dbo].[ADD_Param_sp]    Script Date: 20.01.2020 16:03:25 ******/
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

        else if @p_ParamName = 'Номер счета' and [dbo].[CHECK_IsEmpty_fn](@p_Value) = 0
            UPDATE [dbo].[Orders_tb] SET Account=@p_Value where TID=@p_OrderID

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
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Параметры:' + @p_ParamName, @p_Value)

        if @@error != 0
            raiserror('ошибка обработки',16,1)
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
/****** Object:  StoredProcedure [dbo].[ADD_Payment_sp]    Script Date: 20.01.2020 16:03:25 ******/
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
            (@p_OrderID, @p_Login, 'Платежи:' + @l_PaymentName, @l_Value)
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
/****** Object:  StoredProcedure [dbo].[CHECK_Category_sp]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHECK_Category_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CHECK_Category_sp] AS' 
END
GO
--
-- CHECK & REGISTER GIVEN CATEGORY IF NOT EXISTS
--   @p_Name        -- given category name: Name[|]
--   @p_ID          -- category id (output)
--
-- 20191026: creating
--
ALTER PROCEDURE [dbo].[CHECK_Category_sp]
    @p_Mode             int,
    @p_Name             varchar(150),
    @p_ID               int output
AS
BEGIN
    DECLARE
        @l_CategoryID       int,
        @l_Name             varchar(50)

    if dbo.CHECK_IsEmpty_fn(@p_Name) = 1
    begin
        set @p_ID = null
        return(-1)
    end

    select * into #tmp from [dbo].[GET_SplittedStrings_fn](@p_Name, '|')
    
    select @l_Name=item from #tmp where n=0

    drop table #tmp

    SELECT TOP 1 @l_CategoryID=TID FROM [dbo].[DIC_Categories_tb] WHERE
        Name=@l_Name

    if @l_CategoryID is null
    begin
        INSERT INTO [dbo].[DIC_Categories_tb](Name) VALUES (@l_Name)
        select top 1 @l_CategoryID=TID from [dbo].[DIC_Categories_tb] where Name=@l_Name
    end

    set @p_ID = @l_CategoryID

    if @p_Mode = 0
        SELECT @l_CategoryID FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[CHECK_Category_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[CHECK_Condition_sp]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHECK_Condition_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CHECK_Condition_sp] AS' 
END
GO
--
-- CHECK & REGISTER GIVEN SELLER IF NOT EXISTS
--   @p_Name        -- given condition name
--   @p_ID          -- condition id (output)
--
-- 20190620: creating
--
ALTER PROCEDURE [dbo].[CHECK_Condition_sp]
    @p_Mode             int,
    @p_Name             varchar(50),
    @p_ID               int output
AS
BEGIN
    DECLARE
        @l_ConditionID  int,
        @l_Name         varchar(50)

    if dbo.CHECK_IsEmpty_fn(@p_Name) = 1
    begin
        set @p_ID = null
        return(-1)
    end

    set @l_Name = @p_Name

    SELECT TOP 1 @l_ConditionID=TID FROM [dbo].[DIC_Conditions_tb] WHERE
        Name=@l_Name

    if @l_ConditionID is null
    begin
        INSERT INTO [dbo].[DIC_Conditions_tb] VALUES (@l_Name)
        select top 1 @l_ConditionID=TID from [dbo].[DIC_Conditions_tb] where Name=@l_Name
        
        --select @l_ConditionID = CAST(scope_identity() AS int)
    end

    set @p_ID = @l_ConditionID

    if @p_Mode = 0
        SELECT @l_ConditionID FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[CHECK_Condition_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[CHECK_Equipment_sp]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHECK_Equipment_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CHECK_Equipment_sp] AS' 
END
GO
--
-- CHECK & REGISTER GIVEN EQUIPMENT IF NOT EXISTS
--   @p_Name        -- given equipment name
--   @p_ID          -- equipment id (output)
--
-- 20190620: creating
--
ALTER PROCEDURE [dbo].[CHECK_Equipment_sp]
    @p_Mode             int,
    @p_SubdivisionID    int,
    @p_Name             varchar(2000),
    @p_ID               int output
AS
BEGIN
    DECLARE
        @l_EquipmentID  int,
        @l_Title        varchar(1000),
        @l_Name         varchar(1000)

    if dbo.CHECK_IsEmpty_fn(@p_SubdivisionID) = 1 or dbo.CHECK_IsEmpty_fn(@p_Name) = 1
    begin
        set @p_ID = null
        return(-1)
    end

    set @l_Name = ''

    select * into #tmp from [dbo].[GET_SplittedStrings_fn](@p_Name, '|')
    
    select @l_Title=item from #tmp where n=0
    select @l_Name=item from #tmp where n=1

    drop table #tmp

    SELECT TOP 1 @l_EquipmentID=TID FROM [dbo].[DIC_Equipments_tb] WHERE
        SubdivisionID=@p_SubdivisionID AND 
        Title=@l_Title AND 
        Name=@l_Name

    if @l_EquipmentID is null
    begin
        INSERT INTO [dbo].[DIC_Equipments_tb](SubdivisionID, Title, Name) VALUES (@p_SubdivisionID, @l_Title, @l_Name)
        select @l_EquipmentID = CAST(scope_identity() AS int)
    end else
        UPDATE [dbo].[DIC_Equipments_tb] set 
            Title=@l_Title, 
            Name=@l_Name 
        WHERE TID=@l_EquipmentID

    set @p_ID = @l_EquipmentID

    if @p_Mode = 0
        SELECT @l_EquipmentID FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[CHECK_Equipment_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[CHECK_Seller_sp]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHECK_Seller_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CHECK_Seller_sp] AS' 
END
GO
--
-- CHECK & REGISTER GIVEN SELLER IF NOT EXISTS
--   @p_Name        -- given seller name: Name[|Title][|Address]
--   @p_ID          -- seller id (output)
--
-- 20190620: creating
--
ALTER PROCEDURE [dbo].[CHECK_Seller_sp]
    @p_Mode             int,
    @p_Name             varchar(2000),
    @p_ID               int output
AS
BEGIN
    DECLARE
        @l_SellerID     int,
        @l_Name         varchar(100),
        @l_Title        varchar(250),
        @l_Address      varchar(1000),
        @l_Code         varchar(20),
        @l_Contact      varchar(200)

    if dbo.CHECK_IsEmpty_fn(@p_Name) = 1
    begin
        set @p_ID = null
        return(-1)
    end

    select * into #tmp from [dbo].[GET_SplittedStrings_fn](@p_Name, '||')
    
    select @l_Name=item from #tmp where n=0
    select @l_Title=item from #tmp where n=1
    select @l_Address=item from #tmp where n=2
    select @l_Code=item from #tmp where n=3
    select @l_Contact=item from #tmp where n=4

    drop table #tmp

    SELECT TOP 1 @l_SellerID=TID FROM [dbo].[DIC_Sellers_tb] WHERE
        Name=@l_Name

    if @l_SellerID is null and @l_Name = '' begin
        select top 1 @l_SellerID=TID from [dbo].[DIC_Sellers_tb] where Name='---' or Name like '%- не задано -%' or [dbo].[CHECK_IsEmpty_fn](Name)=1

    end else if @l_SellerID is null
    begin
        INSERT INTO [dbo].[DIC_Sellers_tb](Name, Title, Address, Code, Contact) VALUES (@l_Name, @l_Title, @l_Address, @l_Code, @l_Contact)
        select top 1 @l_SellerID=TID from [dbo].[DIC_Sellers_tb] where Name=@l_Name
        
        --select @l_SellerID = CAST(scope_identity() AS int)
    end else begin
        UPDATE [dbo].[DIC_Sellers_tb] SET 
            Title=@l_Title, 
            Address=@l_Address,
            Code=@l_Code,
            Contact=@l_Contact
        WHERE TID=@l_SellerID
    end

    set @p_ID = @l_SellerID

    if @p_Mode = 0
        SELECT @l_SellerID FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[CHECK_Seller_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[CHECK_Subdivision_sp]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHECK_Subdivision_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[CHECK_Subdivision_sp] AS' 
END
GO
--
-- CHECK & REGISTER GIVEN SUBDIVISION IF NOT EXISTS
--   @p_Name        -- given subdivision name: Name[|Manager]
--   @p_ID          -- subdivision id (output)
--
-- 20190620: creating
--
ALTER PROCEDURE [dbo].[CHECK_Subdivision_sp]
    @p_Mode             int,
    @p_Name             varchar(150),
    @p_ID               int output
AS
BEGIN
    DECLARE
        @l_SubdivisionID    int,
        @l_Name             varchar(50),
        @l_Manager          varchar(100)

    if dbo.CHECK_IsEmpty_fn(@p_Name) = 1
    begin
        set @p_ID = null
        return(-1)
    end

    select * into #tmp from [dbo].[GET_SplittedStrings_fn](@p_Name, '|')
    
    select @l_Name=item from #tmp where n=0
    select @l_Manager=item from #tmp where n=1

    drop table #tmp

    SELECT TOP 1 @l_SubdivisionID=TID FROM [dbo].[DIC_Subdivisions_tb] WHERE
        Name=@l_Name

    if @l_SubdivisionID is null
    begin
        INSERT INTO [dbo].[DIC_Subdivisions_tb](Name, Manager) VALUES (@l_Name, @l_Manager)
        select top 1 @l_SubdivisionID=TID from [dbo].[DIC_Subdivisions_tb] where Name=@l_Name
        
        --select @l_SubdivisionID = CAST(scope_identity() AS int)
    end

    set @p_ID = @l_SubdivisionID

    if @p_Mode = 0
        SELECT @l_SubdivisionID FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[CHECK_Subdivision_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[DEL_Comment_sp]    Script Date: 20.01.2020 16:03:25 ******/
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
/****** Object:  StoredProcedure [dbo].[DEL_Document_sp]    Script Date: 20.01.2020 16:03:25 ******/
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
/****** Object:  StoredProcedure [dbo].[DEL_Item_sp]    Script Date: 20.01.2020 16:03:25 ******/
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
/****** Object:  StoredProcedure [dbo].[DEL_Param_sp]    Script Date: 20.01.2020 16:03:25 ******/
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
/****** Object:  StoredProcedure [dbo].[DEL_Payment_sp]    Script Date: 20.01.2020 16:03:25 ******/
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
/****** Object:  StoredProcedure [dbo].[DEL_Seller_sp]    Script Date: 20.01.2020 16:03:25 ******/
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
/****** Object:  StoredProcedure [dbo].[DELETE_Order_sp]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DELETE_Order_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DELETE_Order_sp] AS' 
END
GO
ALTER PROCEDURE [dbo].[DELETE_Order_sp] 
    @p_Mode             int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    DECLARE
        @l_OrderID          int,
        @l_Status           int,
        @l_Name             varchar(50),
        @l_now              datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1, @l_Status=Status from [dbo].[Orders_tb] where TID=@p_ID

    set @p_Output = ''

    if @exists = 1
    begin
        if @l_Status = 9 begin
            DELETE FROM [dbo].[Params_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Items_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Payments_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Comments_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Reviews_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[OrderDates_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[OrderDocuments_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[OrderChanges_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Unreads_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Orders_tb] WHERE TID=@p_ID
        end else begin
            UPDATE [dbo].[Orders_tb] SET Status=9 WHERE TID=@p_ID
            set @l_Name = 'Корзина'
            --
            -- Add to Order Changes log
            --
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@p_ID, @p_Login, @l_Name, '')
        end

        select @l_OrderID = @p_ID
        set @p_Output = 'Removed'
    end else begin
        set @l_OrderID = 0
        set @p_Output = 'Invalid' 
            + ':' + cast(@exists as varchar)
    end

    set @p_Output = @p_Output + ':' + cast(@l_OrderID as varchar)

    if @p_Mode = 0
        SELECT @l_OrderID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[DELETE_Order_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Order_sp]    Script Date: 20.01.2020 16:03:25 ******/
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
    @p_Purpose          varchar(2000),
    @p_Price            float,
    @p_Currency         varchar(10),
    @p_Total            float,
    @p_Tax              float,
    @p_Subdivision      varchar(150),
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
    @p_RowSpan          int,
    @p_Output           varchar(20) output
AS
BEGIN
    DECLARE
        @l_OrderID          int,
        @l_SubdivisionID    int,
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
    --    Check Category exists
    --
    exec dbo.CHECK_Category_sp 1, @p_Category, @l_CategoryID output
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
        if @p_IsNoPrice = 1
            INSERT INTO [dbo].[Orders_tb](
                SubdivisionID,
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
                RowSpan,
                RD
            ) VALUES (
                @l_SubdivisionID,
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
                @p_RowSpan,
                @l_now
            )
        else
            INSERT INTO [dbo].[Orders_tb](
                SubdivisionID,
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
                RowSpan,
                RD
            ) VALUES (
                @l_SubdivisionID,
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
        /*
        set @param = 'Заказчик'
        EXEC [dbo].[ADD_Param_sp] 1, @l_OrderID, 0, 0, @p_EditedBy, @param, @p_Login, null
        */
        set @p_Subdivision = [dbo].[GET_SplittedItem_fn](@p_Subdivision, '|', 0)
        set @p_Category = [dbo].[GET_SplittedItem_fn](@p_Category, '|', 0)
        set @p_Equipment = [dbo].[GET_SplittedItem_fn](@p_Equipment, '|', 0)
        set @p_Seller = [dbo].[GET_SplittedItem_fn](@p_Seller, '|', 0)
        set @p_Condition = [dbo].[GET_SplittedItem_fn](@p_Condition, '|', 0)
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@l_OrderID, @p_Login, 'НАИМЕНОВАНИЕ ТОВАРА', @p_Article),
            (@l_OrderID, @p_Login, 'Кол-во (шт)', cast(@p_Qty as varchar)),
            (@l_OrderID, @p_Login, 'Обоснование', @p_Purpose),
            (@l_OrderID, @p_Login, 'URL', @p_URL)

        if @p_Price > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_Login, 'Цена за единицу', cast(@p_Price as varchar))

        if len(@p_Currency) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_Login, 'Валюта платежа', @p_Currency)

        if @p_Total > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_Login, 'СУММА', [dbo].[CONVERT_Money_fn](@p_Total))

        if len(@p_Equipment) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_Login, 'Описание', @p_Equipment)

        if len(@p_Condition) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_Login, 'Условия оплаты', @p_Condition)

        if len(@p_Seller) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_Login, 'ПОСТАВЩИК', @p_Seller)

        if len(@p_Category) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_Login, 'Категория', @p_Category)

        if len(@p_Subdivision) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_Login, 'ПОТРЕБИТЕЛЬ', @p_Subdivision)

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
/****** Object:  StoredProcedure [dbo].[REGISTER_OrderStockList_sp]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REGISTER_OrderStockList_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[REGISTER_OrderStockList_sp] AS' 
END
GO
--
-- REGISTER NEW PROVISION STOCKLIST STATE
-- --------------------------------------
--   @p_OrderID      -- Order ID
--   @p_Login        -- login of reviewer
--   @p_ID           -- ID StockList Reference
--
ALTER PROCEDURE [dbo].[REGISTER_OrderStockList_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_Login            varchar(50),
    @p_ID               int,
    @p_Output           varchar(20) output
AS
BEGIN
    DECLARE
        @l_StockListID  int = null,
        @l_Value        varchar(100),
        @l_now          datetime

    set @p_Output = ''
    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID
    select @l_StockListID=TID, @l_Value=NodeCode from [dbo].[DIC_StockList_tb] where TID=@p_ID

    if @l_StockListID is not null and dbo.CHECK_IsEmpty_fn(@l_Value) = 0 and @exists = 1
    begin
        UPDATE [dbo].[Orders_tb] SET
            StockListID=@l_StockListID,
            EditedBy=@p_Login,
            RD=@l_now
        WHERE TID=@p_OrderID

        if @@error != 0
            raiserror('ошибка обновления класса товара',16,1)
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Класс товара', @l_Value)

        if @@error != 0
            raiserror('ошибка обработки',16,1)

        set @p_Output = 'Registered'
    end else begin
        set @l_StockListID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_StockListID as varchar)

    if @p_Mode = 0
        SELECT @l_StockListID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[REGISTER_OrderStockList_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Review_sp]    Script Date: 20.01.2020 16:03:25 ******/
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

    set @p_Output = ''
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
            raiserror('ошибка добавления рецензии',16,1)

        select @l_ReviewID = CAST(scope_identity() AS int)

        if @p_Login = 'aybazov' and @p_Status < 5 begin
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

        else if @p_Status = 7 begin
            UPDATE [dbo].[Orders_tb] SET Status=6 WHERE TID=@p_OrderID
            UPDATE [dbo].[OrderDates_tb] SET Delivered=case when @p_ReviewDueDate='' then @l_now else @p_ReviewDueDate end WHERE OrderID=@p_OrderID
        end

        if @@error != 0
            raiserror('ошибка регистрации даты рецензии',16,1)
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
                when 7 then 'Поставлено на склад'
                else '...'
                end +
                case when [dbo].[CHECK_IsEmpty_fn](@p_Note) = 0 then ':'+@p_Note else '' end
                )

        if @@error != 0
            raiserror('ошибка обработки',16,1)

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
/****** Object:  StoredProcedure [dbo].[SET_Read_sp]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SET_Read_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SET_Read_sp] AS' 
END
GO
--
-- SET READ FLAG
-- -------------
--   @p_OrderID      -- Order ID
--   @p_Logins       -- users login list, string with delimeter '|'
--
ALTER PROCEDURE [dbo].[SET_Read_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_Logins           varchar(250),
    @p_Output           varchar(20) output
AS
BEGIN
    DECLARE
        @l_Login        varchar(50),
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        DELETE FROM [dbo].[Unreads_tb] WHERE OrderID=@p_OrderID and Login in (
            select item as Login from [dbo].[GET_SplittedStrings_fn](@p_Logins, '|')
        )

        set @p_Output = 'Done'
    end else if @p_OrderID is null begin
        DELETE FROM [dbo].[Unreads_tb] WHERE Login in (
            select item as Login from [dbo].[GET_SplittedStrings_fn](@p_Logins, '|')
        )

        set @p_Output = 'Done'
    end else begin
        set @p_Output = 'Invalid'
    end

    if @p_Mode = 0
        SELECT @p_OrderID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[SET_Read_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[SET_Status_sp]    Script Date: 20.01.2020 16:03:25 ******/
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
/****** Object:  StoredProcedure [dbo].[SET_Unread_sp]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SET_Unread_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SET_Unread_sp] AS' 
END
GO
--
-- SET UNREAD FLAG
-- ---------------
--   @p_OrderID      -- Order ID
--   @p_Logins       -- users login list, string with delimeter '|'
--
ALTER PROCEDURE [dbo].[SET_Unread_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_Logins           varchar(250),
    @p_Output           varchar(20) output
AS
BEGIN
    DECLARE
        @l_Login        varchar(50),
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        INSERT INTO [dbo].[Unreads_tb]
        select @p_OrderID as OrderID, item as Login from [dbo].[GET_SplittedStrings_fn](@p_Logins, '|')

        set @p_Output = 'Done'
    end else begin
        set @p_Output = 'Invalid'
    end

    if @p_Mode = 0
        SELECT @p_OrderID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[SET_Unread_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[UPDATE_Order_sp]    Script Date: 20.01.2020 16:03:25 ******/
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
    @p_Purpose          varchar(2000),
    @p_Price            float,
    @p_Currency         varchar(10),
    @p_Total            float,
    @p_Tax              float,
    @p_Subdivision      varchar(150),
    @p_Category         varchar(50),
    @p_Equipment        varchar(2000),
    @p_Seller           varchar(2000),
    @p_Condition        varchar(50),
    @p_URL              varchar(200),
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
        @l_CategoryID       int,
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
        @c_Purpose          varchar(2000), 
        @c_Condition        varchar(50), 
        @c_URL              varchar(200), 
        @c_Equipment        varchar(1000), 
        @c_Subdivision      varchar(50), 
        @c_Category         varchar(50), 
        @c_Seller           varchar(100)

    set @l_now = getdate()
    --
    --    Check Subdivision exists
    --
    exec dbo.CHECK_Subdivision_sp 1, @p_Subdivision, @l_SubdivisionID output
    --
    --    Check Category exists
    --
    exec dbo.CHECK_Category_sp 1, @p_Category, @l_CategoryID output
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
            @c_Condition=Condition, @c_Equipment=Equipment, @c_Subdivision=Subdivision, @c_Seller=Seller, @c_URL=URL
        from [dbo].[WEB_Orders_vw] where TID=@p_ID

        select @c_Category=Name from [dbo].[DIC_Categories_tb] where TID=(
            select top 1 CategoryID from [dbo].[WEB_Orders_vw] where TID=@p_ID)

        if @p_IsNoPrice = 1
            UPDATE [dbo].[Orders_tb] SET
                SubdivisionID=@l_SubdivisionID,
                CategoryID=@l_CategoryID,
                EquipmentID=@l_EquipmentID,
                SellerID=@l_SellerID,
                Login=@p_Login,
                Article=@p_Article,
                Qty=@p_Qty,
                Purpose=@p_Purpose,
                URL=@p_URL,
                EditedBy=@p_EditedBy,
                RD=@l_now
            WHERE TID=@p_ID
        else
            UPDATE [dbo].[Orders_tb] SET
                SubdivisionID=@l_SubdivisionID,
                CategoryID=@l_CategoryID,
                EquipmentID=@l_EquipmentID,
                ConditionID=@l_ConditionID,
                SellerID=@l_SellerID,
                Login=@p_Login,
                Article=@p_Article,
                Qty=@p_Qty,
                Purpose=@p_Purpose,
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
        set @p_Category = [dbo].[GET_SplittedItem_fn](@p_Category, '|', 0)
        set @p_Equipment = [dbo].[GET_SplittedItem_fn](@p_Equipment, '|', 0)
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
                (@l_OrderID, @p_EditedBy, 'Кол-во (шт)', cast(@p_Qty as varchar))

        if @c_Purpose != @p_Purpose
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Обоснование', @p_Purpose)

        if @c_Category != @p_Category
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Категория', @p_Category)

        if @c_Subdivision != @p_Subdivision
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'ПОТРЕБИТЕЛЬ', @p_Subdivision)

        if @c_Seller != @p_Seller
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'ПОСТАВЩИК', @p_Seller)

        if @c_URL != @p_URL
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'URL', @p_URL)

        if @p_IsNoPrice = 0 begin
            if @c_Author != @p_Login
                INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                    (@l_OrderID, @p_EditedBy, 'Заказчик', @p_Login)

            if @c_Price != @p_Price
                INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                    (@l_OrderID, @p_EditedBy, 'Цена за единицу', cast(@p_Price as varchar))

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

        select @l_ParamID = TID from [dbo].[DIC_Params_tb] where Name=@param

        if [dbo].[CHECK_IsEmpty_fn](@p_DueDate) = 0 begin
            if @p_DueDate != (select [Value] from [dbo].[Params_tb] where OrderID=@l_OrderID and ParamID=@l_ParamID)
                EXEC [dbo].[ADD_Param_sp] 1, @l_OrderID, 0, 0, @p_EditedBy, @param, @p_DueDate, null
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
/****** Object:  StoredProcedure [dbo].[UPDATE_Seller_sp]    Script Date: 20.01.2020 16:03:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_Seller_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UPDATE_Seller_sp] AS' 
END
GO
ALTER PROCEDURE [dbo].[UPDATE_Seller_sp] 
    @p_Mode             int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Name             varchar(100),
    @p_Title            varchar(250),
    @p_Address          varchar(1000),
    @p_Code             varchar(20),
    @p_Type             int,
    @p_Contact          varchar(200),
    @p_URL              varchar(200),
    @p_Phone            varchar(100),
    @p_Email            varchar(100),
    @p_Output           varchar(20) output
AS
BEGIN
    DECLARE
        @l_SellerID         int,
        @l_now              datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[DIC_Sellers_tb] where TID=@p_ID

    set @p_Output = ''

    if @exists = 1
    begin
        UPDATE [dbo].[DIC_Sellers_tb] SET
            Name=@p_Name,
            Title=@p_Title,
            Address=@p_Address,
            Code=@p_Code,
            Type=@p_Type,
            Contact=@p_Contact,
            URL=@p_URL,
            Phone=@p_Phone,
            Email=@p_Email,
            EditedBy=@p_Login,
            RD=@l_now
        WHERE TID=@p_ID

        set @l_SellerID = @p_ID
        set @p_Output = 'Refreshed'
    end else begin
        set @l_SellerID = 0
        set @p_Output = 'Invalid' 
            + ':' + case when @l_SellerID is null then 'NULL' else cast(@l_SellerID as varchar) end
            + ':' + cast(@exists as varchar)
    end

    set @p_Output = @p_Output + ':' + cast(@l_SellerID as varchar)

    if @p_Mode = 0
        SELECT @l_SellerID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[UPDATE_Seller_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Authors_vw', NULL,NULL))
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Authors_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Authors_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Authors_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Categories_vw', NULL,NULL))
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
               Bottom = 102
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Categories_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Categories_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Categories_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Comments_vw', NULL,NULL))
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
               Bottom = 93
               Right = 198
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Comments_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Comments_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Comments_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Conditions_vw', NULL,NULL))
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
               Bottom = 102
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Conditions_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Conditions_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Conditions_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Equipments_vw', NULL,NULL))
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
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 108
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Equipments_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Equipments_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Equipments_vw'
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
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderComments_vw', NULL,NULL))
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderComments_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderComments_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderComments_vw'
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
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderItems_vw', NULL,NULL))
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderItems_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderItems_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderItems_vw'
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
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderPayments_vw', NULL,NULL))
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderPayments_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_OrderPayments_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_OrderPayments_vw'
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
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
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
               Top = 6
               Left = 870
               Bottom = 102
               Right = 1040
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "l"
            Begin Extent = 
               Top = 102
               Left = 870
               Bottom = 232
               Right = 1040
            End
            DisplayFlags = 280
            TopColumn = 0
         End
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Orders_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Orders_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'    End
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Orders_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Orders_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Orders_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Params_vw', NULL,NULL))
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
               Bottom = 93
               Right = 198
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Params_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Params_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Params_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Payments_vw', NULL,NULL))
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
               Bottom = 93
               Right = 198
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Payments_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Payments_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Payments_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_ReviewerOrders_vw', NULL,NULL))
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
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "r"
            Begin Extent = 
               Top = 6
               Left = 254
               Bottom = 119
               Right = 424
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_ReviewerOrders_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_ReviewerOrders_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_ReviewerOrders_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Reviews_vw', NULL,NULL))
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
               Bottom = 201
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Reviews_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Reviews_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Reviews_vw'
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
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o"
            Begin Extent = 
               Top = 9
               Left = 336
               Bottom = 206
               Right = 596
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 9
               Left = 653
               Bottom = 206
               Right = 881
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
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
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
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Sellers_vw', NULL,NULL))
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Sellers_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Sellers_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Sellers_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Subdivisions_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[12] 3) )"
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
               Bottom = 119
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
         Width = 2115
         Width = 1500
         Width = 3075
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Subdivisions_vw'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Subdivisions_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Subdivisions_vw'
GO
