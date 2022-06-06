USE [PurchaseDB]
GO
/****** Object:  StoredProcedure [dbo].[BATCH_UndoAutoclosed_sp]    Script Date: 29.01.2022 8:11:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BATCH_UndoAutoclosed_sp] 
    @p_CheckOnly     bit,
    @p_OrderID       int
AS
BEGIN
    declare 
        @exists bit = null

    select @exists=1 from [dbo].[WEB_Reviews_vw] where OrderID=@p_OrderID and Status=8

    if @p_CheckOnly = 1 begin
        select * from [dbo].[WEB_Reviews_vw] where OrderID=@p_OrderID order by TID desc
        select * from [dbo].[OrderDates_tb] where OrderID=@p_OrderID order by TID desc
    end else if @exists = 1 begin
        update [dbo].[Orders_tb] set Status=5 where TID=@p_OrderID
        update [dbo].[OrderDates_tb] set Delivered=NULL where OrderID=@p_OrderID
        delete from [dbo].[Reviews_tb] where OrderID=@p_OrderID and Status=8
    end
    return(0)
END



GO
