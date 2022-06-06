USE [ProvisionDB]
GO
/****** Object:  StoredProcedure [dbo].[DELETE_Decree_sp]    Script Date: 31.10.2021 15:08:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DELETE_Decree_sp] 
    @p_Mode             int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_DecreeID         int,
        @l_OrderID          int,
        @l_ReviewID         int,
        @l_ReportID         int,
        @l_now              datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1, @l_ReviewID=ReviewID, @l_ReportID=ReportID from [dbo].[Decrees_tb] where TID=@p_ID

    set @p_Output = ''

    if @exists = 1
    begin
        select @l_OrderID=OrderID from [dbo].[Reviews_tb] WHERE TID=@l_ReviewID

        DELETE FROM [dbo].[Reviews_tb] WHERE TID in (@l_ReviewID, @l_ReportID)
        DELETE FROM [dbo].[Decrees_tb] WHERE TID=@p_ID

        if @@error != 0
            raiserror('ошибка удаления поручения',16,1)
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@l_OrderID, @p_Login, 'Действие', 'ПОРУЧЕНИЕ УДАЛЕНО: ID=' + cast(@p_ID as varchar))

        if @@error != 0
            raiserror('ошибка обработки',16,1)

        select @l_DecreeID = @p_ID
        set @p_Output = 'Removed'
    end else begin
        set @l_DecreeID = 0
        set @p_Output = 'Invalid' 
            + ':' + cast(@exists as varchar)
    end

    set @p_Output = @p_Output + ':' + cast(@l_DecreeID as varchar)

    if @p_Mode = 0
        SELECT @l_DecreeID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[DELETE_Decree_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
