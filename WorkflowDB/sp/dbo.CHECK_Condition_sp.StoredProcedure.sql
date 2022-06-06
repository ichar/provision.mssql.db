USE [WorkflowDB]
GO
/****** Object:  StoredProcedure [dbo].[CHECK_Condition_sp]    Script Date: 24.01.2022 14:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CHECK & REGISTER GIVEN SELLER IF NOT EXISTS
--   @p_Name        -- given condition name
--   @p_ID          -- condition id (output)
--
-- 20190620: creating
--
CREATE PROCEDURE [dbo].[CHECK_Condition_sp]
    @p_Mode             int,
    @p_Name             varchar(50),
    @p_ID               int output
AS
BEGIN
    SET NOCOUNT ON

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
        INSERT INTO [dbo].[DIC_Conditions_tb](Name) VALUES (@l_Name)
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
