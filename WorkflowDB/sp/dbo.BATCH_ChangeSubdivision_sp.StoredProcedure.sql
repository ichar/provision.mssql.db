USE [WorkflowDB]
GO
/****** Object:  StoredProcedure [dbo].[BATCH_ChangeSubdivision_sp]    Script Date: 24.01.2022 14:49:07 ******/
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
