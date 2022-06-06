USE [SaleDB]
GO
/****** Object:  StoredProcedure [dbo].[ACCEPT_Decree_sp]    Script Date: 29.01.2022 8:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ACCEPT_Decree_sp] 
    @p_Mode             int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Reviewer         varchar(50),
    @p_Report           varchar(1000),
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

        if @p_Report is not null
        begin
            if @l_ReportID is null
            begin
                INSERT INTO [dbo].[Reviews_tb](
                    OrderID, 
                    Login, 
                    Reviewer, 
                    Status, 
                    Note, 
                    RD
                ) VALUES (
                    @l_OrderID,
                    @p_Login,
                    @p_Reviewer,
                    5,
                    @p_Report,
                    @l_now
                )
                
                select @l_ReportID = CAST(scope_identity() AS int)
                
                UPDATE [dbo].[Decrees_tb] SET ReportID=@l_ReportID WHERE TID=@p_ID
            end else
                UPDATE [dbo].[Reviews_tb] SET Note=@p_Report, Reviewer=@p_Reviewer, RD=@l_now WHERE TID=@l_ReportID

            if @@error != 0
                raiserror('ошибка регистрации отчета исполнителя',16,1)
        end

        UPDATE [dbo].[Decrees_tb] SET Accepted=@l_now WHERE TID=@p_ID

        if @@error != 0
            raiserror('ошибка обновления поручения',16,1)
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@l_OrderID, @p_Login, 'Действие', 'ПОРУЧЕНИЕ ПРИНЯТО К ИСПОЛНЕНИЮ: ID=' + cast(@l_ReportID as varchar) + ':' + cast(@p_ID as varchar))

        if @@error != 0
            raiserror('ошибка обработки',16,1)

        select @l_DecreeID = @p_ID
        set @p_Output = 'Updated'
    end else begin
        set @l_DecreeID = 0
        set @p_Output = 'Invalid' 
            + ':' + cast(@exists as varchar)
    end

    set @p_Output = @p_Output + ':' + cast(@l_DecreeID as varchar)

    if @p_Mode = 0
        SELECT @l_DecreeID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[ACCEPT_Decree_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
