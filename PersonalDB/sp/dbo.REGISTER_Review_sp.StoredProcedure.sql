USE [PersonalDB]
GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Review_sp]    Script Date: 14.10.2021 10:53:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- REGISTER NEW PROVISION REVIEW
-- -----------------------------
--   @p_OrderID      -- Order ID
--   @p_Login        -- login of reviewer
--   @p_Status       -- status of reviewer: 1 - accepted, 2 - rejected, 3 - comfirm
--   @p_Note         -- note of review
--
ALTER PROCEDURE [dbo].[REGISTER_Review_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ReviewID         int,
    @p_DecreeID         int,
    @p_ReportID         int,
    @p_Login            varchar(50),
    @p_Reviewer         varchar(50),
    @p_Status           int,
    @p_Note             varchar(1000),
    @p_ReviewDueDate    varchar(10),
    @p_WithMail         bit,
    @p_Executor         varchar(50),
    @p_Report           varchar(1000),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_ReviewID     int = null,
        @l_DecreeID     int = 0,
        @l_ReportID     int = 0,
        @l_Reviewer     varchar(50),
        @l_now          datetime

    set @p_Output = ''
    set @l_now = getdate()

    declare 
        @exists bit = null,
        @is_decree_report bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_OrderID

    set @is_decree_report = case when @p_Status=9 and @p_Login=@p_Executor and @p_Report is not null then 1 else 0 end

    if @exists = 1
    begin
        if @p_ReviewID = 0 begin
            INSERT INTO [dbo].[Reviews_tb](
                OrderID, 
                Login, 
                Reviewer, 
                Status, 
                Note, 
                RD
            ) VALUES (
                @p_OrderID,
                @p_Login,
                @p_Reviewer,
                @p_Status,
                @p_Note,
                @l_now
            )

            if @@error != 0
                raiserror('ошибка добавления рецензии',16,1)

            select @l_ReviewID = CAST(scope_identity() AS int)
        end else if @is_decree_report = 0 begin
            UPDATE [dbo].[Reviews_tb] SET Login=@p_Login, Reviewer=@p_Reviewer, Note=@p_Note, RD=@l_now WHERE TID=@p_ReviewID

            if @@error != 0
                raiserror('ошибка обновления рецензии',16,1)
        
            set @l_ReviewID = @p_ReviewID
        end else
            set @l_ReviewID = @p_ReviewID

        if @p_Login = 'aybazov' and @p_Status < 5 begin
            UPDATE [dbo].[Orders_tb] SET Status=@p_Status WHERE TID=@p_OrderID

            if @p_Status = 2
                UPDATE [dbo].[OrderDates_tb] SET Approved=@l_now WHERE OrderID=@p_OrderID
        end

        if @@error != 0
            raiserror('ошибка смены статуса',16,1)

        else if @p_Status = 4 and @p_ReviewDueDate != ''
            UPDATE [dbo].[OrderDates_tb] SET ReviewDueDate=@p_ReviewDueDate, WithMail=@p_WithMail WHERE OrderID=@p_OrderID

        else if @p_Status = 6
            UPDATE [dbo].[OrderDates_tb] SET Paid=case when @p_ReviewDueDate='' then @l_now else @p_ReviewDueDate end WHERE OrderID=@p_OrderID

        else if @p_Status = 7
            UPDATE [dbo].[OrderDates_tb] SET Delivered=case when @p_ReviewDueDate='' then @l_now else @p_ReviewDueDate end WHERE OrderID=@p_OrderID

        else if @p_Status = 10
            UPDATE [dbo].[OrderDates_tb] SET AuditDate=@l_now WHERE OrderID=@p_OrderID

        else if @p_Status = 12
            UPDATE [dbo].[OrderDates_tb] SET Validated=@l_now WHERE OrderID=@p_OrderID

        if @@error != 0
            raiserror('ошибка регистрации даты рецензии',16,1)
        --
        -- Add Decree Executor
        --
        if @p_Status = 9
        begin
            if @p_DecreeID = 0 begin
                INSERT INTO [dbo].[Decrees_tb](
                    ReviewID, 
                    Login, 
                    Status,
                    DueDate,
                    ReportID
                ) VALUES (
                    @l_ReviewID,
                    @p_Executor,
                    0,
                    @p_ReviewDueDate,
                    null
                )

                if @@error != 0
                    raiserror('ошибка добавления поручения',16,1)

                select @l_DecreeID = CAST(scope_identity() AS int)
            end else begin
                if @is_decree_report = 1 begin
                    select top 1 @l_Reviewer=Reviewer from [dbo].[Reviews_tb] where Login=@p_Executor

                    if @p_ReportID = 0 begin
                        INSERT INTO [dbo].[Reviews_tb](
                            OrderID, 
                            Login, 
                            Reviewer, 
                            Status, 
                            Note, 
                            RD
                        ) VALUES (
                            @p_OrderID,
                            @p_Executor,
                            @l_Reviewer,
                            5,
                            @p_Report,
                            @l_now
                        )

                        if @@error != 0
                            raiserror('ошибка добавления отчета исполнителя',16,1)

                        select @l_ReportID = CAST(scope_identity() AS int)
                    end else begin
                        UPDATE [dbo].[Reviews_tb] SET Login=@p_Executor, Reviewer=@l_Reviewer, Note=@p_Report, RD=@l_now WHERE TID=@p_ReportID

                        if @@error != 0
                            raiserror('ошибка обновления отчета исполнителя',16,1)
        
                        set @l_ReportID = @p_ReportID
                    end

                    UPDATE [dbo].[Decrees_tb] SET Login=@p_Executor, DueDate=@p_ReviewDueDate, ReportID=@l_ReportID WHERE TID=@p_DecreeID

                    if @@error != 0
                        raiserror('ошибка обновления поручения',16,1)
                end

                set @l_DecreeID = @p_DecreeID
            end
        end

        if @@error != 0
            raiserror('ошибка добавления рецензии',16,1)
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@p_OrderID, @p_Login, 'Рецензия', case @p_Status 
                when  2 then 'СОГЛАСОВАНО'
                when  3 then 'ОТКАЗАНО'
                when  4 then 'ТРЕБУЕТСЯ ОБОСНОВАНИЕ'
                when  5 then 'Информация'
                when  6 then 'Оплачено'
                when  7 then 'Поставлено на склад'
                when  9 then 'ПОРУЧЕНИЕ'
                when 10 then 'АУДИТ'
                when 11 then 'Замечание'
                when 12 then 'Акцептовано к закрытию'
                else '...'
                end +
                case when [dbo].[CHECK_IsEmpty_fn](@p_Note) = 0 then ':'+@p_Note else '' end
                )

        if @@error != 0
            raiserror('ошибка обработки',16,1)

        set @p_Output = 'Registered'
    end else begin
        set @l_ReviewID = 0
        set @l_DecreeID = 0
        set @l_ReportID = 0
        set @p_Output = 'Invalid'
    end

    set @p_Output = @p_Output + ':' + cast(@l_ReviewID as varchar) -- + ':' + cast(@l_DecreeID as varchar)

    if @p_Mode = 0
        SELECT @l_ReviewID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[REGISTER_Review_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
