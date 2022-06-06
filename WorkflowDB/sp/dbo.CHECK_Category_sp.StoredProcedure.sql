USE [WorkflowDB]
GO
/****** Object:  StoredProcedure [dbo].[CHECK_Category_sp]    Script Date: 24.01.2022 14:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CHECK & REGISTER GIVEN CATEGORY IF NOT EXISTS
--   @p_Name        -- given category name: Name[|]
--   @p_ID          -- category id (output)
--
-- 20191026: creating
--
CREATE PROCEDURE [dbo].[CHECK_Category_sp]
    @p_Mode             int,
    @p_Name             varchar(150),
    @p_MD               int,
    @p_ID               int output
AS
BEGIN
    SET NOCOUNT ON

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
        Name=@l_Name and (MD=@p_MD or MD is null)

    if @l_CategoryID is null
    begin
        INSERT INTO [dbo].[DIC_Categories_tb](Name, MD) VALUES (@l_Name, @p_MD)
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
