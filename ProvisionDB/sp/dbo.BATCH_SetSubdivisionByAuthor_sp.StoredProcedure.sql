USE [ProvisionDB]
GO
/****** Object:  StoredProcedure [dbo].[BATCH_SetSubdivisionByAuthor_sp]    Script Date: 04.02.2020 11:34:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BATCH_SetSubdivisionByAuthor_sp] 
    @p_CheckOnly     bit,
    @p_FromID        int,
    @p_ToID          int,
    @p_Author        varchar(50)
AS
BEGIN
    DECLARE 
        @OrderID     int, 
        @SubdivisionID int,
        @total       int

    create table #tmp(OrderID int, SubdivisionID int)

    DECLARE x CURSOR READ_ONLY FOR SELECT TID, SubdivisionID FROM [dbo].[WEB_Orders_vw] WHERE
        SubdivisionID=@p_FromID and 
        (@p_Author is NULL or Author=@p_Author) and 
        MD=0
    OPEN x
    while (1=1) begin
        FETCH NEXT FROM x INTO @OrderID, @SubdivisionID
        if @@fetch_status = -1
            break
        if @SubdivisionID > 0 begin
            insert into #tmp values(@OrderID, @SubdivisionID)
            if @p_CheckOnly != 1
                update [dbo].[Orders_tb] set SubdivisionID=@p_ToID where TID=@OrderID
        end
    end
    CLOSE x
    DEALLOCATE x

    if @p_CheckOnly = 1
        select * from [dbo].[WEB_Orders_vw], #tmp where TID=#tmp.OrderID order by TID desc
    else begin
        select @total=count(*) from #tmp
        SELECT 'Applied for ' + cast(@total as varchar) + ' records.' FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[BATCH_SetSubdivisionByAuthor_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    end

    drop table #tmp

    return(0)
END

GO
