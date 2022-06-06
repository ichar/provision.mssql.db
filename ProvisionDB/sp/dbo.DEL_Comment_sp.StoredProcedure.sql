USE [ProvisionDB]
GO
/****** Object:  StoredProcedure [dbo].[DEL_Comment_sp]    Script Date: 05.10.2019 9:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- DEL NEW PROVISION PAYMENT
-- -------------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
ALTER PROCEDURE [dbo].[DEL_Comment_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_CommentID          int,
    @p_Login            varchar(50),
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

    if @exists = 1 and @p_ID > 0
        select @l_TID=TID from [dbo].[Comments_tb] where TID=@p_ID

    if @l_TID > 0
    begin
        DELETE FROM [dbo].[Comments_tb] WHERE TID=@l_TID
        
        set @p_Output = 'Removed'
    end else begin
        set @p_Output = 'Invalid'
    end

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[DEL_Comment_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END

GO
