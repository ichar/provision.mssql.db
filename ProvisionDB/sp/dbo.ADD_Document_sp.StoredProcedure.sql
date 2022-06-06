USE [ProvisionDB]
GO
/****** Object:  StoredProcedure [dbo].[ADD_Document_sp]    Script Date: 01.08.2019 17:34:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- UPLOAD IMAGE BLOB
-- -----------------
--   @p_OrderID      -- Order ID
--   @p_Login        -- login of reviewer
--   @p_Note         -- note of review
--
ALTER PROCEDURE [dbo].[ADD_Document_sp]
    @p_Mode             int,
    @p_UID              varchar(50),
    @p_OrderID          int,
    @p_Login            varchar(50),
    @p_FileName         varchar(255),
    @p_FileSize         int,
    @p_ContentType      varchar(20),
    @p_ForAudit         bit,
    @p_Note             varchar(1000),
    @p_Image            image,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_DocumentID   int,
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    if @exists = 1
    begin
        INSERT INTO [dbo].[OrderDocuments_tb](
            UID,
            OrderID,
            Login,
            FileName,
            FileSize,
            ContentType,
            ForAudit,
            Note,
            Image
        ) VALUES (
            @p_UID,
            @p_OrderID,
            @p_Login,
            @p_FileName,
            @p_FileSize,
            @p_ContentType,
            @p_ForAudit,
            @p_Note,
            @p_Image
        )

        select @l_DocumentID = CAST(scope_identity() AS int)
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Документ', [dbo].[Strip_fn](
                'Имя файла: '  + @p_FileName + '; ' + 
                'Содержание: ' + @p_Note + '; ' + 
                'ДБО: ' + cast(@p_ForAudit as varchar)
                ))

        set @p_Output = 'Registered'
    end else begin
        set @l_DocumentID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_DocumentID as varchar)

    if @p_Mode = 0
        SELECT @l_DocumentID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[ADD_Document_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END

GO
