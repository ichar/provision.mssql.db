USE [SaleDB]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Comment_sp]    Script Date: 29.01.2022 8:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- ADD NEW PROVISION COMMENT
-- -------------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[ADD_Comment_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_CommentID        int,
    @p_Login            varchar(50),
    @p_NewComment       varchar(50),
    @p_Note             varchar(1000),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_CommentName      varchar(50),
        @l_CommentID        int = null,
        @l_ID               int = null,
        @l_now              datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        if @p_CommentID is NULL or @p_CommentID = 0 begin
            select @l_CommentID = TID from [dbo].[DIC_Comments_tb] where Name=@p_NewComment
            if @l_CommentID is NULL begin
                insert into [dbo].[DIC_Comments_tb](Name) values(@p_NewComment)
                select @l_CommentID = CAST(scope_identity() AS int)
            end
        end else
            set @l_CommentID = @p_CommentID

        if @p_ID > 0 begin
            UPDATE [dbo].[Comments_tb] SET
                OrderID=@p_OrderID,
                CommentID=@l_CommentID,
                Login=@p_Login,
                Note=@p_Note,
                RD=@l_now
            WHERE TID=@p_ID

            set @l_ID = @p_ID
            set @p_Output = 'Updated'
        end else begin
            INSERT INTO [dbo].[Comments_tb](
                OrderID,
                CommentID,
                Login,
                Note,
                RD
            ) VALUES (
                @p_OrderID,
                @l_CommentID,
                @p_Login,
                @p_Note,
                @l_now
            )

            select @l_ID = CAST(scope_identity() AS int)
            set @p_Output = 'Registered'
        end
        --
        -- Get Comment name and value
        --
        select top 1 @l_CommentName = Name from [dbo].[DIC_Comments_tb] where TID=@l_CommentID
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Комментарий', 
                'Автор: '      + @l_CommentName + '; ' + 
                'Содержание: ' + @p_Note
                )
    end else begin
        set @l_ID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_ID as varchar) + ':' + cast(@l_CommentID as varchar)

    if @p_Mode = 0
        SELECT @l_ID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[ADD_Comment_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
