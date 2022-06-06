USE [WorkflowDB]
GO
/****** Object:  StoredProcedure [dbo].[CHECK_Activity_sp]    Script Date: 24.01.2022 14:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CHECK & REGISTER GIVEN SELLER IF NOT EXISTS
--   @p_Name        -- given activity name
--   @p_ID          -- activity id (output)
--
-- 20211016: creating
--
CREATE PROCEDURE [dbo].[CHECK_Activity_sp]
    @p_Mode             int,
    @p_Name             varchar(50),
    @p_ID               int output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_ActivityID  int,
        @l_Name         varchar(50)

    if dbo.CHECK_IsEmpty_fn(@p_Name) = 1
    begin
        set @p_ID = null
        return(-1)
    end

    set @l_Name = @p_Name

    SELECT TOP 1 @l_ActivityID=TID FROM [dbo].[DIC_Activities_tb] WHERE
        Name=@l_Name

    if @l_ActivityID is null
    begin
        INSERT INTO [dbo].[DIC_Activities_tb](Name) VALUES (@l_Name)
        select top 1 @l_ActivityID=TID from [dbo].[DIC_Activities_tb] where Name=@l_Name
        
        --select @l_ActivityID = CAST(scope_identity() AS int)
    end

    set @p_ID = @l_ActivityID

    if @p_Mode = 0
        SELECT @l_ActivityID FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[CHECK_Activity_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
