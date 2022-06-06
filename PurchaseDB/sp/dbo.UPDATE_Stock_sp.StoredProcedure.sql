USE [PurchaseDB]
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_Stock_sp]    Script Date: 29.01.2022 8:11:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_Stock_sp] 
    @p_Mode             int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Name             varchar(100),
    @p_Title            varchar(250),
    @p_ShortName        varchar(100),
    @p_RefCode1C        varchar(20),
    @p_Comment          varchar(1000),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_StockID          int,
        @l_now              datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [ProvisionDB].[dbo].[DIC_StockList_tb] where TID=@p_ID

    set @p_Output = ''

    if @exists = 1
    begin
        UPDATE [ProvisionDB].[dbo].[DIC_StockList_tb] SET
            Name=@p_Name,
            Title=@p_Title,
            ShortName=@p_ShortName,
            RefCode1C=@p_RefCode1C,
            Comment=@p_Comment,
            EditedBy=@p_Login,
            RD=@l_now
        WHERE TID=@p_ID

        set @l_StockID = @p_ID
        set @p_Output = 'Refreshed'
    end else begin
        set @l_StockID = 0
        set @p_Output = 'Invalid' 
            + ':' + case when @l_StockID is null then 'NULL' else cast(@l_StockID as varchar) end
            + ':' + cast(@exists as varchar)
    end

    set @p_Output = @p_Output + ':' + cast(@l_StockID as varchar)

    if @p_Mode = 0
        SELECT @l_StockID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[UPDATE_Stock_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
