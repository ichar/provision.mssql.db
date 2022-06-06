USE [ProvisionDB]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Link_sp]    Script Date: 12.03.2021 17:15:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- ADD NEW PROVISION LINK
-- -----------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[ADD_Link_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_LinkID           int,
    @p_Login            varchar(50),
    @p_NewLink          varchar(50),
    @p_Value            int,
    @p_Note             varchar(1000),
    @p_MD               int,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_LinkID       int = null,
        @l_TID          int = null,
        @l_LinkName     varchar(50),
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_Value

    if @exists = 1
    begin
        --
        -- Check Links Reference
        --
        if @p_LinkID is null or @p_LinkID = 0 begin
            select @l_LinkID=TID from [dbo].[DIC_Links_tb] where Name=@p_NewLink and (MD=@p_MD or MD is null)
            if @l_LinkID is null begin
                INSERT INTO [dbo].[DIC_Links_tb](Name, MD) VALUES(@p_NewLink, @p_MD)
                select @l_LinkID = CAST(scope_identity() AS int)
            end
        end else
            set @l_LinkID = @p_LinkID
        --
        -- Get Link name and value
        --
        select top 1 @l_LinkName=Name from [dbo].[DIC_Links_tb] where TID=@l_LinkID
        --
        -- Check if this is OrderLink line (like as Params extentions)
        --
        set @exists = 0

        if @exists = 0 begin
            if @p_ID = 0
                set @l_TID = 0
            else
                set @l_TID = @p_ID
        end

        if @l_TID > 0 begin
            UPDATE [dbo].[OrderLinks_tb] SET
                OrderID=@p_OrderID,
                LinkID=@l_LinkID,
                OrderLinkID=@p_Value,
                Login=@p_Login,
                Note=@p_Note,
                RD=@l_now
            WHERE TID=@l_TID

            set @p_Output = 'Updated'
        end else begin
            INSERT INTO [dbo].[OrderLinks_tb](
                OrderID,
                LinkID,
                OrderLinkID,
                Login,
                Note,
                RD
            ) VALUES (
                @p_OrderID,
                @l_LinkID,
                @p_Value,
                @p_Login,
                @p_Note,
                @l_now
            )

            select @l_TID = CAST(scope_identity() AS int)
            set @p_Output = 'Registered'
        end
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, '—сылки:' + @l_LinkName, @p_Value)

        if @@error != 0
            raiserror('ошибка обработки',16,1)
    end else begin
        set @l_TID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_TID as varchar) + ':' + cast(@l_LinkID as varchar)

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[ADD_Link_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
