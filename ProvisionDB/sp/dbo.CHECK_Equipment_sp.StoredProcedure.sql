USE [ProvisionDB]
GO
/****** Object:  StoredProcedure [dbo].[CHECK_Equipment_sp]    Script Date: 01.08.2019 17:34:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
    SET NOCOUNT ON

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
