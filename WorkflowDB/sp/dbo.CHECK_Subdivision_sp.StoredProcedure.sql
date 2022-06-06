USE [WorkflowDB]
GO
/****** Object:  StoredProcedure [dbo].[CHECK_Subdivision_sp]    Script Date: 24.01.2022 14:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CHECK & REGISTER GIVEN SUBDIVISION IF NOT EXISTS
--   @p_Name        -- given subdivision name: Name[|Manager]
--   @p_ID          -- subdivision id (output)
--
-- 20190620: creating
--
CREATE PROCEDURE [dbo].[CHECK_Subdivision_sp]
    @p_Mode             int,
    @p_Name             varchar(150),
    @p_ID               int output
AS
BEGIN
    SET NOCOUNT ON

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
/****** Object:  StoredProcedure [dbo].[CHECK_Vendor_sp]    Script Date: 25.09.2021 7:21:59 ******/
SET ANSI_NULLS ON


GO
