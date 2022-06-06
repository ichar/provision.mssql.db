USE [ProvisionDB]
GO
/****** Object:  StoredProcedure [dbo].[BATCH_SetAutoclosed_sp]    Script Date: 04.02.2020 11:34:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BATCH_SetAutoclosed_sp] 
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
