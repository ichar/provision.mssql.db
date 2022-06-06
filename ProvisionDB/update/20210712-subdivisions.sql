USE [ProvisionDB]
GO
/****** Object:  StoredProcedure [dbo].[BATCH_SetSubdivisionByAuthor_sp]    Script Date: 12.07.2021 12:46:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BATCH_SetSubdivisionByAuthor_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[BATCH_SetSubdivisionByAuthor_sp]
GO
/****** Object:  StoredProcedure [dbo].[BATCH_ChangeSubdivision_sp]    Script Date: 12.07.2021 12:46:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BATCH_ChangeSubdivision_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[BATCH_ChangeSubdivision_sp]
GO
/****** Object:  StoredProcedure [dbo].[BATCH_ChangeSubdivision_sp]    Script Date: 12.07.2021 12:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BATCH_ChangeSubdivision_sp] 
    @p_CheckOnly     bit,
    @p_FromID        int,
    @p_ToID          int,
    @p_NewName       varchar(50)
AS
BEGIN
    if @p_CheckOnly = 1 begin
        select * from [dbo].[Orders_tb] where SubdivisionID=@p_FromID order by TID desc
        select * from [dbo].[DIC_Equipments_tb] where SubdivisionID=@p_FromID order by TID desc
    end else begin
        update [dbo].[Orders_tb] set SubdivisionID=@p_ToID where SubdivisionID=@p_FromID
        update [dbo].[DIC_Equipments_tb] set SubdivisionID=@p_ToID where SubdivisionID=@p_FromID
        update [dbo].[DIC_Subdivisions_tb] set Name='...' where TID=@p_FromID
        update [dbo].[DIC_Subdivisions_tb] set Name=@p_NewName where TID=@p_ToID
        
        SELECT * FROM [dbo].[WEB_Orders_vw] where SubdivisionID=@p_ToID order by TID desc
    end
    return(0)
END

GO
/****** Object:  StoredProcedure [dbo].[BATCH_SetSubdivisionByAuthor_sp]    Script Date: 12.07.2021 12:46:31 ******/
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
EXEC dbo.BATCH_ChangeSubdivision_sp 0,12,6,'Отдел IT'
EXEC dbo.BATCH_ChangeSubdivision_sp 0,33,18,'Администрация'
EXEC dbo.BATCH_ChangeSubdivision_sp 0,38,18,'Администрация'
EXEC dbo.BATCH_ChangeSubdivision_sp 0,28,28,'Юридический отдел'
EXEC dbo.BATCH_ChangeSubdivision_sp 0,15,15,'Отдел сертификации'
EXEC dbo.BATCH_ChangeSubdivision_sp 0,32,10,'Транспортная служба'
EXEC dbo.BATCH_ChangeSubdivision_sp 0,9,9,'Отдел эксплуатации и сервисного обслуживания'
EXEC dbo.BATCH_ChangeSubdivision_sp 0,19,19,'Отдел дизайна'
EXEC dbo.BATCH_ChangeSubdivision_sp 0,42,42,'ОГК'
EXEC dbo.BATCH_ChangeSubdivision_sp 0,25,25,'ОТК'
EXEC dbo.BATCH_ChangeSubdivision_sp 0,7,7,'СПБ'
EXEC dbo.BATCH_ChangeSubdivision_sp 0,11,7,'СПБ'
EXEC dbo.BATCH_ChangeSubdivision_sp 0,8,8,'Участок автоматизированной обработки'
EXEC dbo.BATCH_ChangeSubdivision_sp 0,30,30,'Участок ручной обработки'
EXEC dbo.BATCH_ChangeSubdivision_sp 0,39,39,'- не использовать -' -- 3Д ПЭЙ
EXEC dbo.BATCH_ChangeSubdivision_sp 0,40,39,'- не использовать -' -- Розан AG (не использовать)
EXEC dbo.BATCH_ChangeSubdivision_sp 0,32,39,'- не использовать -' -- Розан Логистик
EXEC dbo.BATCH_ChangeSubdivision_sp 0,37,39,'- не использовать -' -- Экспресс Кард
EXEC dbo.BATCH_ChangeSubdivision_sp 0,36,39,'- не использовать -' -- Просистем

EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,42,'danil'
EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,2,'suhova'
EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,4,'indigo'
EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,9,'sd01'
EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,23,'sales'
EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,9,'chuplin'
EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,2,'sapm'
EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,16,'qc01'
EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,21,'borovin'
EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,8,'diamond'
EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,8,'anna'
EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,25,'kvpetrov'
EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,25,'otk1'
EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,30,'skladdiamond'
EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,1,'suhorukov'
EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,2,'anton'
EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,6,'helpdesk'
EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,30,'kosko'
EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,28,'tsergey'
EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,28,'tsergey'
EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,24,'polina'
EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,24,'snab1c'
EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,24,'snab3'
EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,24,'borisov'
EXEC dbo.BATCH_SetSubdivisionByAuthor_sp 0,5,15,'plehanov'

EXEC dbo.BATCH_ChangeSubdivision_sp 0,5,39,'- не использовать -' -- Производство
EXEC dbo.BATCH_ChangeSubdivision_sp 0,34,39,'- не использовать -' -- !!! ВЫБЕРИТЕ ПОДРАЗДЕЛЕНИЕ ИЗ СПИСКА !!!
EXEC dbo.BATCH_ChangeSubdivision_sp 0,35,39,'- не использовать -' -- !!! НЕ НАДО СОЗДАВАТЬ ДУБЛИ !!!
GO

delete from [ProvisionDB].[dbo].[DIC_Subdivisions_tb] where Name='...'
GO

update [ProvisionDB].[dbo].[Params_tb] set Value='Розан Файнэнс, АО' where ParamID=45 and Value='3Д ПЭЙ, ООО'
update [ProvisionDB].[dbo].[Params_tb] set Value='Розан Файнэнс, АО' where ParamID=45 and Value='ЭкспрессКард, АО'
update [ProvisionDB].[dbo].[Params_tb] set Value='Розан Файнэнс, АО' where ParamID=45 and Value='Розан Логистик, ООО'
update [ProvisionDB].[dbo].[Params_tb] set Value='Розан Файнэнс, АО' where ParamID=45 and Value='Розан СПБ'
GO

update [dbo].[DIC_Subdivisions_tb] set Code='0001' where TID=18
update [dbo].[DIC_Subdivisions_tb] set Code='0035' where TID=4
update [dbo].[DIC_Subdivisions_tb] set Code='0035' where TID=4
update [dbo].[DIC_Subdivisions_tb] set Code='0037' where TID=42
update [dbo].[DIC_Subdivisions_tb] set Code='0101' where TID=8
update [dbo].[DIC_Subdivisions_tb] set Code='0102' where TID=30
update [dbo].[DIC_Subdivisions_tb] set Code='0103' where TID=19
update [dbo].[DIC_Subdivisions_tb] set Code='0070' where TID=7
GO
