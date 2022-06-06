USE [ProvisionDB]
GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Reviewers_sp]    Script Date: 03.09.2019 16:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- REGISTER PROVISION REVIEWERS
-- ----------------------------
--   @p_OrderID      -- Order ID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[REGISTER_Reviewers_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_Login            varchar(50),
    @p_Value            varchar(1000),
    @p_MD               int,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_TID          int = null,
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        select * into #tmp from [dbo].[GET_SplittedStrings_fn](@p_Value, ':')
        
        DELETE FROM [dbo].[Reviewers_tb] WHERE OrderID=@p_OrderID
        INSERT INTO [dbo].[Reviewers_tb] SELECT @p_OrderID, item FROM #tmp

        drop table #tmp
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Назначены рецензенты', @p_Value)

        set @l_TID = @p_OrderID
        set @p_Output = 'Registered'
    end else begin
        set @l_TID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_TID as varchar)

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[REGISTER_Reviewers_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END

GO
