USE [WorkflowDB]
GO
/****** Object:  StoredProcedure [dbo].[BATCH_SetCompany_sp]    Script Date: 24.01.2022 14:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- SET COMPANY VALUE INSIDE ORDERS TABLE PARAMS
-- --------------------------------------------
-- EXEC [WorkflowDB].[dbo].[BATCH_SetCompany_sp] 1,42,NULL,'Розан Файнэнс, АО','2021-01-01',0,'admin'
-- EXEC [WorkflowDB].[dbo].[BATCH_SetCompany_sp] 1,42,'8,19,30','Розан Даймонд, ООО','2021-01-01',0,'admin'
-- EXEC [WorkflowDB].[dbo].[BATCH_SetCompany_sp] 1,42,'37','ЭкспрессКард, АО','2021-01-01',0,'admin'
-- EXEC [WorkflowDB].[dbo].[BATCH_SetCompany_sp] 1,42,'10,32','Розан Логистик, ООО','2021-01-01',0,'admin'
-- EXEC [WorkflowDB].[dbo].[BATCH_SetCompany_sp] 1,42,'11','Розан СПБ','2021-01-01',0,'admin'
-- EXEC [WorkflowDB].[dbo].[BATCH_SetCompany_sp] 1,42,'39','3Д ПЭЙ, ООО','2021-01-01',0,'admin'
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
