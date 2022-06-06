USE [ProvisionDB]
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Schedule_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Schedule_vw'

GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Schedule_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Schedule_vw'

GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Reviews_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Reviews_vw'

GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Reviews_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Reviews_vw'

GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Decrees_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Decrees_vw'

GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Decrees_vw', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Decrees_vw'

GO
/****** Object:  StoredProcedure [dbo].[UPDATE_Order_sp]    Script Date: 31.10.2021 15:28:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_Order_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UPDATE_Order_sp]
GO
/****** Object:  StoredProcedure [dbo].[REMOVE_Decree_sp]    Script Date: 31.10.2021 15:28:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REMOVE_Decree_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[REMOVE_Decree_sp]
GO
/****** Object:  StoredProcedure [dbo].[REJECT_Decree_sp]    Script Date: 31.10.2021 15:28:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REJECT_Decree_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[REJECT_Decree_sp]
GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Review_sp]    Script Date: 31.10.2021 15:28:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REGISTER_Review_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[REGISTER_Review_sp]
GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Order_sp]    Script Date: 31.10.2021 15:28:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REGISTER_Order_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[REGISTER_Order_sp]
GO
/****** Object:  StoredProcedure [dbo].[FINISH_Decree_sp]    Script Date: 31.10.2021 15:28:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FINISH_Decree_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FINISH_Decree_sp]
GO
/****** Object:  StoredProcedure [dbo].[DELETE_Order_sp]    Script Date: 31.10.2021 15:28:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DELETE_Order_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DELETE_Order_sp]
GO
/****** Object:  StoredProcedure [dbo].[DELETE_Decree_sp]    Script Date: 31.10.2021 15:28:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DELETE_Decree_sp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DELETE_Decree_sp]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Decrees_ReviewID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Decrees_tb]'))
ALTER TABLE [dbo].[Decrees_tb] DROP CONSTRAINT [FK_Decrees_ReviewID]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Decrees_RD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Decrees_tb] DROP CONSTRAINT [DF_Decrees_RD]
END

GO
/****** Object:  Index [WX_Decrees_ReviewID]    Script Date: 31.10.2021 15:28:39 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Decrees_tb]') AND name = N'WX_Decrees_ReviewID')
DROP INDEX [WX_Decrees_ReviewID] ON [dbo].[Decrees_tb]
GO
/****** Object:  View [dbo].[WEB_Schedule_vw]    Script Date: 31.10.2021 15:28:39 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Schedule_vw]'))
DROP VIEW [dbo].[WEB_Schedule_vw]
GO
/****** Object:  View [dbo].[WEB_Reviews_vw]    Script Date: 31.10.2021 15:28:39 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Reviews_vw]'))
DROP VIEW [dbo].[WEB_Reviews_vw]
GO
/****** Object:  View [dbo].[WEB_Decrees_vw]    Script Date: 31.10.2021 15:28:39 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Decrees_vw]'))
DROP VIEW [dbo].[WEB_Decrees_vw]
GO
/****** Object:  Table [dbo].[Decrees_tb]    Script Date: 31.10.2021 15:28:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Decrees_tb]') AND type in (N'U'))
DROP TABLE [dbo].[Decrees_tb]
GO
/****** Object:  Table [dbo].[Decrees_tb]    Script Date: 31.10.2021 15:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Decrees_tb]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Decrees_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[ReviewID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Status] [int] NULL,
	[DueDate] [datetime] NULL,
	[RD] [datetime] NULL,
	[ReportID] [int] NULL,
	[OrderID] [int] NULL,
	[EditedBy] [varchar](50) NULL,
	[MD] [int] NULL,
 CONSTRAINT [PK_Decrees_TID] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[WEB_Decrees_vw]    Script Date: 31.10.2021 15:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Decrees_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_Decrees_vw]
AS
SELECT        d.TID, d.Login AS Executor, d.Status AS DecreeStatus, d.DueDate, d.ReportID, d.EditedBy, r.TID AS ReviewID, r.OrderID, r.Login AS Author, r.Reviewer, r.Note, r.Status AS ReviewStatus, r.RD AS ReviewDate, 
                         d.MD, d.RD
FROM            dbo.Decrees_tb AS d INNER JOIN
                         dbo.Reviews_tb AS r ON r.TID = d.ReviewID
' 
GO
/****** Object:  View [dbo].[WEB_Reviews_vw]    Script Date: 31.10.2021 15:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Reviews_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_Reviews_vw]
AS
SELECT        r.TID, o.TID AS OrderID, r.Login, r.Reviewer, r.Status, d.Status AS DecreeStatus, r.Note, d.DueDate, o.MD, o.RD AS RegistryDate, r.RD AS StatusDate
FROM            dbo.Reviews_tb AS r INNER JOIN
                         dbo.Orders_tb AS o ON o.TID = r.OrderID LEFT OUTER JOIN
                         dbo.Decrees_tb AS d ON d.ReviewID = r.TID

' 
GO
/****** Object:  View [dbo].[WEB_Schedule_vw]    Script Date: 31.10.2021 15:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[WEB_Schedule_vw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[WEB_Schedule_vw]
AS
SELECT        o.TID AS OrderID, o.Author, o.Price, o.Status AS OrderStatus, o.RD AS RegistryDate, r.TID AS ReviewID, r.Login AS Reviewer, r.Status AS ReviewStatus, d.Created, d.Approved, d.Paid, d.Delivered, 
                         d.ReviewDueDate, d.FinishDueDate, d.AuditDate, d.Validated, o.CategoryID, o.SubdivisionID, o.SubdivisionCode, o.MD, r.RD AS StatusDate
FROM            dbo.Reviews_tb AS r RIGHT OUTER JOIN
                         dbo.WEB_Orders_vw AS o ON o.TID = r.OrderID LEFT OUTER JOIN
                         dbo.OrderDates_tb AS d ON o.TID = d.OrderID
' 
GO
/****** Object:  Index [WX_Decrees_ReviewID]    Script Date: 31.10.2021 15:28:39 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Decrees_tb]') AND name = N'WX_Decrees_ReviewID')
CREATE NONCLUSTERED INDEX [WX_Decrees_ReviewID] ON [dbo].[Decrees_tb]
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Decrees_RD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Decrees_tb] ADD  CONSTRAINT [DF_Decrees_RD]  DEFAULT (getdate()) FOR [RD]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Decrees_ReviewID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Decrees_tb]'))
ALTER TABLE [dbo].[Decrees_tb]  WITH CHECK ADD  CONSTRAINT [FK_Decrees_ReviewID] FOREIGN KEY([ReviewID])
REFERENCES [dbo].[Reviews_tb] ([TID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Decrees_ReviewID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Decrees_tb]'))
ALTER TABLE [dbo].[Decrees_tb] CHECK CONSTRAINT [FK_Decrees_ReviewID]
GO
/****** Object:  StoredProcedure [dbo].[DELETE_Decree_sp]    Script Date: 31.10.2021 15:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DELETE_Decree_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DELETE_Decree_sp] AS' 
END
GO
ALTER PROCEDURE [dbo].[DELETE_Decree_sp] 
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
/****** Object:  StoredProcedure [dbo].[DELETE_Order_sp]    Script Date: 31.10.2021 15:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DELETE_Order_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DELETE_Order_sp] AS' 
END
GO
ALTER PROCEDURE [dbo].[DELETE_Order_sp] 
    @p_Mode             int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_OrderID          int,
        @l_Status           int,
        @l_Name             varchar(50),
        @l_now              datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1, @l_Status=Status from [dbo].[Orders_tb] where TID=@p_ID

    set @p_Output = ''

    if @exists = 1
    begin
        if @l_Status = 9 begin
            DELETE FROM [storage].[dbo].[OrderDocuments_tb] WHERE OrderID=@p_ID

            DELETE FROM [dbo].[Decrees_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Params_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Items_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[PaymentChanges_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Payments_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Comments_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Reviewers_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Reviews_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[OrderDates_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[OrderChanges_tb] WHERE OrderID=@p_ID
            DELETE FROM [dbo].[Unreads_tb] WHERE OrderID=@p_ID

            DELETE FROM [dbo].[Orders_tb] WHERE TID=@p_ID
        end else begin
            UPDATE [dbo].[Decrees_tb] SET Status=3 WHERE OrderID=@p_ID
            UPDATE [dbo].[Orders_tb] SET Status=9 WHERE TID=@p_ID

            set @l_Name = 'Корзина'
            --
            -- Add to Order Changes log
            --
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@p_ID, @p_Login, @l_Name, '')
        end

        select @l_OrderID = @p_ID
        set @p_Output = 'Removed'
    end else begin
        set @l_OrderID = 0
        set @p_Output = 'Invalid' 
            + ':' + cast(@exists as varchar)
    end

    set @p_Output = @p_Output + ':' + cast(@l_OrderID as varchar)

    if @p_Mode = 0
        SELECT @l_OrderID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[DELETE_Order_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[FINISH_Decree_sp]    Script Date: 31.10.2021 15:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FINISH_Decree_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[FINISH_Decree_sp] AS' 
END
GO
ALTER PROCEDURE [dbo].[FINISH_Decree_sp] 
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

        UPDATE [dbo].[Decrees_tb] SET Status=1 WHERE TID=@p_ID

        if @@error != 0
            raiserror('ошибка обновления поручения',16,1)
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@l_OrderID, @p_Login, 'Действие', 'ПОРУЧЕНИЕ ИСПОЛНЕНО: ID=' + cast(@p_ID as varchar))

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
            dbo.sysobjects where id = object_id(N'[dbo].[FINISH_Decree_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Order_sp]    Script Date: 31.10.2021 15:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REGISTER_Order_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[REGISTER_Order_sp] AS' 
END
GO
--
-- REGISTER NEW PROVISION ORDER
-- ----------------------------
--   @p_Mode         -- mode of review
--
ALTER PROCEDURE [dbo].[REGISTER_Order_sp]
    @p_Mode             int,
    @p_Login            varchar(50),
    @p_Article          varchar(500),
    @p_Qty              int,
    @p_Purpose          varchar(2000),
    @p_Price            float,
    @p_Currency         varchar(10),
    @p_Total            float,
    @p_Tax              float,
    @p_Subdivision      varchar(150),
    @p_Sector           varchar(150),
    @p_Category         varchar(50),
    @p_Equipment        varchar(2000),
    @p_Seller           varchar(2000),
    @p_Condition        varchar(50),
    @p_Account          varchar(200),
    @p_URL              varchar(200),
    @p_DueDate          varchar(10),
    @p_EditedBy         varchar(50),
    @p_Status           int,
    @p_IsNoPrice        int,
    @p_MD               int,
    @p_RowSpan          int,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_TID              int,
        @l_Login            varchar(50),
        @l_OrderID          int,
        @l_SubdivisionID    int,
        @l_SectorID         int,
        @l_CategoryID       int,
        @l_SellerID         int,
        @l_EquipmentID      int,
        @l_ConditionID      int,
        @l_ParamID          int,
        @l_now              datetime

    set @l_now = getdate()
    --
    --    Check Subdivision exists
    --
    exec dbo.CHECK_Subdivision_sp 1, @p_Subdivision, @l_SubdivisionID output
    --
    --    Check Sector exists
    --
    exec dbo.CHECK_Sector_sp 1, @p_Sector, @l_SectorID output
    --
    --    Check Category exists
    --
    exec dbo.CHECK_Category_sp 1, @p_Category, @p_MD, @l_CategoryID output
    --
    --    Check Equipment exists
    --
    exec dbo.CHECK_Equipment_sp 1, @l_SubdivisionID, @p_Equipment, @l_EquipmentID output
    --
    --    Check Condition exists
    --
    if @p_IsNoPrice = 0
        exec dbo.CHECK_Condition_sp 1, @p_Condition, @l_ConditionID output
    --
    --    Check Seller exists
    --
    exec dbo.CHECK_Seller_sp 1, @p_Seller, @p_MD, @l_SellerID output

    declare 
        @exists bit = null

    select @exists=1, @l_OrderID=TID from [dbo].[Orders_tb] where 
        SubdivisionID=@l_SubdivisionID and 
        Article=@p_Article and 
        Qty=@p_Qty and 
        Login=@p_Login and 
        Status=@p_Status and 
        Purpose=@p_Purpose

    set @p_Output = ''

    if @exists = 1
        set @p_Output = 'Exists'

    else if @exists is null
    begin
        /*
        declare @l_min int, @l_max int
        set @l_min = case when @p_MD < 10 then 0 else (@p_MD*100000) end
        set @l_max = (@p_MD+1)*100000
        select top 1 @l_TID=TID from [dbo].[Orders_tb] where TID > @l_min and TID < @l_max order by TID desc
        set @l_TID = case when @l_TID is null then @l_min+1 else @l_TID+1 end
        */

        if @p_IsNoPrice = 1
            INSERT INTO [dbo].[Orders_tb](
                SubdivisionID,
                SectorID,
                CategoryID,
                EquipmentID,
                SellerID,
                Login,
                Article,
                Qty,
                Purpose,
                URL,
                Status,
                EditedBy,
                MD,
                RowSpan,
                RD
            ) VALUES (
                @l_SubdivisionID,
                @l_SectorID,
                @l_CategoryID,
                @l_EquipmentID,
                @l_SellerID,
                @p_Login,
                @p_Article,
                @p_Qty,
                @p_Purpose,
                @p_URL,
                0,
                @p_EditedBy,
                @p_MD,
                @p_RowSpan,
                @l_now
            )
        else
            INSERT INTO [dbo].[Orders_tb](
                SubdivisionID,
                SectorID,
                CategoryID,
                EquipmentID,
                ConditionID,
                SellerID,
                Login,
                Article,
                Qty,
                Purpose,
                Price,
                Currency,
                Total,
                Tax,
                Account,
                URL,
                Status,
                EditedBy,
                MD,
                RowSpan,
                RD
            ) VALUES (
                @l_SubdivisionID,
                @l_SectorID,
                @l_CategoryID,
                @l_EquipmentID,
                @l_ConditionID,
                @l_SellerID,
                @p_Login,
                @p_Article,
                @p_Qty,
                @p_Purpose,
                @p_Price,
                @p_Currency,
                cast(@p_Total as money),
                cast(@p_Tax as money),
                @p_Account,
                @p_URL,
                0,
                @p_EditedBy,
                @p_MD,
                @p_RowSpan,
                @l_now
            )

        if @@error != 0
            raiserror('ошибка добавления документа',16,1)

        select @l_TID = CAST(scope_identity() AS int)

        set @l_Login = @p_EditedBy

        set @l_OrderID = @l_TID

        INSERT INTO [dbo].[OrderDates_tb](
            OrderID, 
            Created
        ) VALUES (
            @l_OrderID,
            @l_now
        )

        DECLARE @param varchar(20) = case @p_MD when 20 then 'Срок действия' else 'Срок исполнения' end

        if [dbo].[CHECK_IsEmpty_fn](@p_DueDate) = 0
            EXEC [dbo].[ADD_Param_sp] 1, @l_OrderID, 0, 0, @p_EditedBy, @param, @p_DueDate, @p_MD, null
        /*
        set @param = 'Заказчик'
        EXEC [dbo].[ADD_Param_sp] 1, @l_OrderID, 0, 0, @p_EditedBy, @param, @p_Login, null
        */
        set @p_Subdivision = [dbo].[GET_SplittedItem_fn](@p_Subdivision, '|', 0)
        set @p_Sector = [dbo].[GET_SplittedItem_fn](@p_Sector, '|', 0)
        set @p_Category = [dbo].[GET_SplittedItem_fn](@p_Category, '|', 0)
        set @p_Equipment = [dbo].[GET_SplittedItem_fn](@p_Equipment, '|', 0)
        set @p_Seller = [dbo].[GET_SplittedItem_fn](@p_Seller, '|', 0)
        set @p_Condition = [dbo].[GET_SplittedItem_fn](@p_Condition, '|', 0)
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@l_OrderID, @l_Login, 'НАИМЕНОВАНИЕ ДОКУМЕНТА', @p_Article),
            (@l_OrderID, @l_Login, 'СОДЕРЖАНИЕ', @p_Purpose)

        if len(@p_Equipment) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Руководитель', @p_Equipment)

        if len(@p_Category) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Категория документа', @p_Category)

        if len(@p_Subdivision) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'ПОДРАЗДЕЛЕНИЕ', @p_Subdivision)

        if len(@p_Account) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Регистрационный номер', @p_Account)

        if len(@p_Login) > 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @l_Login, 'Автор документа', @p_Login)

        set @p_Output = 'Registered'
    end else begin
        set @l_OrderID = 0
        set @p_Output = 'Invalid' 
            + ':' + case when @l_SubdivisionID is null then 'NULL' else cast(@l_SubdivisionID as varchar) end
            + ':' + case when @l_SellerID is null then 'NULL' else cast(@l_SellerID as varchar) end
    end

    set @p_Output = @p_Output + ':' + cast(@l_OrderID as varchar)

    if @p_Mode = 0
        SELECT @l_OrderID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[REGISTER_Order_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END



GO
/****** Object:  StoredProcedure [dbo].[REGISTER_Review_sp]    Script Date: 31.10.2021 15:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REGISTER_Review_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[REGISTER_Review_sp] AS' 
END
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
    @p_EditedBy         varchar(50),
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

    set @is_decree_report = case when @p_Status=9 and @p_Login=@p_Executor then 1 else 0 end

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
                    OrderID,
                    ReviewID, 
                    Login, 
                    Status,
                    DueDate,
                    ReportID,
                    EditedBy, 
                    RD
                ) VALUES (
                    @p_OrderID,
                    @l_ReviewID,
                    @p_Executor,
                    0,
                    @p_ReviewDueDate,
                    null,
                    @p_EditedBy,
                    @l_now
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
                        UPDATE [dbo].[Reviews_tb] SET Note=@p_Report, RD=@l_now WHERE TID=@p_ReportID

                        if @@error != 0
                            raiserror('ошибка обновления отчета исполнителя',16,1)
        
                        set @l_ReportID = @p_ReportID
                    end

                    UPDATE [dbo].[Decrees_tb] SET ReportID=@l_ReportID, EditedBy=@p_EditedBy, RD=@l_now WHERE TID=@p_DecreeID

                    if @@error != 0
                        raiserror('ошибка обновления поручения',16,1)

                    INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                        (@p_OrderID, @p_Executor, 'Отчет о выполнении поручения', @p_Report)
                
                end else if @p_ReviewDueDate is not null begin
                    UPDATE [dbo].[Decrees_tb] SET Login=@p_Executor, Status=0, DueDate=@p_ReviewDueDate, EditedBy=@p_EditedBy, RD=@l_now WHERE TID=@p_DecreeID

                    if @@error != 0
                        raiserror('ошибка обновления поручения',16,1)

                    INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                        (@p_OrderID, @p_EditedBy, 'Срок исполнения поручения', @p_ReviewDueDate)
                end

                set @l_DecreeID = @p_DecreeID
            end
        end

        if @@error != 0
            raiserror('ошибка добавления рецензии',16,1)
        --
        -- Add to Order Changes log
        --
        if @is_decree_report = 0
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
/****** Object:  StoredProcedure [dbo].[REJECT_Decree_sp]    Script Date: 31.10.2021 15:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REJECT_Decree_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[REJECT_Decree_sp] AS' 
END
GO
ALTER PROCEDURE [dbo].[REJECT_Decree_sp] 
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

        UPDATE [dbo].[Decrees_tb] SET Status=3 WHERE TID=@p_ID

        if @@error != 0
            raiserror('ошибка обновления поручения',16,1)
        --
        -- Add to Order Changes log
        --
        INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
            (@l_OrderID, @p_Login, 'Действие', 'ПОРУЧЕНИЕ ОТМЕНЕНО: ID=' + cast(@p_ID as varchar))

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
            dbo.sysobjects where id = object_id(N'[dbo].[REJECT_Decree_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[REMOVE_Decree_sp]    Script Date: 31.10.2021 15:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REMOVE_Decree_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[REMOVE_Decree_sp] AS' 
END
GO
ALTER PROCEDURE [dbo].[REMOVE_Decree_sp] 
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

        DELETE [dbo].[Decrees_tb] WHERE TID=@p_ID
        DELETE [dbo].[Reviews_tb] WHERE TID in (@l_ReviewID, @l_ReportID)

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
            dbo.sysobjects where id = object_id(N'[dbo].[REMOVE_Decree_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[UPDATE_Order_sp]    Script Date: 31.10.2021 15:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UPDATE_Order_sp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UPDATE_Order_sp] AS' 
END
GO
ALTER PROCEDURE [dbo].[UPDATE_Order_sp] 
    @p_Mode             int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Article          varchar(500),
    @p_Qty              int,
    @p_Purpose          varchar(2000),
    @p_Price            float,
    @p_Currency         varchar(10),
    @p_Total            float,
    @p_Tax              float,
    @p_Subdivision      varchar(150),
    @p_Sector           varchar(150),
    @p_Category         varchar(50),
    @p_Equipment        varchar(2000),
    @p_Seller           varchar(2000),
    @p_Condition        varchar(50),
    @p_Account          varchar(200),
    @p_URL              varchar(200),
    @p_DueDate          varchar(10),
    @p_EditedBy         varchar(50),
    @p_IsNoPrice        int,
    @p_MD               int,
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_OrderID          int,
        @l_ParamID          int,
        @l_SubdivisionID    int,
        @l_SectorID         int,
        @l_CategoryID       int,
        @l_SellerID         int,
        @l_EquipmentID      int,
        @l_ConditionID      int,
        @l_DueDate          varchar(10),
        @l_now              datetime

    DECLARE
        @c_Author           varchar(50), 
        @c_Article          varchar(500), 
        @c_Qty              int, 
        @c_Price            float, 
        @c_Currency         varchar(10), 
        @c_Total            money, 
        @c_Purpose          varchar(2000), 
        @c_Condition        varchar(50), 
        @c_Account          varchar(200), 
        @c_URL              varchar(200), 
        @c_Equipment        varchar(1000), 
        @c_Subdivision      varchar(50), 
        @c_Sector           varchar(50), 
        @c_Category         varchar(50), 
        @c_Seller           varchar(100)

    set @l_now = getdate()
    --
    --    Check Subdivision exists
    --
    exec dbo.CHECK_Subdivision_sp 1, @p_Subdivision, @l_SubdivisionID output
    --
    --    Check Sector exists
    --
    exec dbo.CHECK_Sector_sp 1, @p_Sector, @l_SectorID output
    --
    --    Check Category exists
    --
    exec dbo.CHECK_Category_sp 1, @p_Category, @p_MD, @l_CategoryID output
    --
    --    Check Equipment exists
    --
    exec dbo.CHECK_Equipment_sp 1, @l_SubdivisionID, @p_Equipment, @l_EquipmentID output
    --
    --    Check Condition exists
    --
    if @p_IsNoPrice = 0
        exec dbo.CHECK_Condition_sp 1, @p_Condition, @l_ConditionID output
    --
    --    Check Seller exists
    --
    exec dbo.CHECK_Seller_sp 1, @p_Seller, @p_MD, @l_SellerID output

    declare 
        @exists bit = null

    select @exists=1 from [dbo].[Orders_tb] where TID=@p_ID

    set @p_Output = ''

    if dbo.CHECK_IsEmpty_fn(@l_SubdivisionID) = 0 and @exists = 1
    begin
        select 
            @c_Author=Author, @c_Article=Article, @c_Qty=Qty, @c_Price=Price, @c_Currency=Currency, @c_Total=Total, @c_Purpose=Purpose, 
            @c_Sector=Sector, @c_Category=Category, @c_Condition=Condition, @c_Equipment=Equipment, @c_Account=Account, @c_Subdivision=Subdivision, @c_Seller=Seller, @c_URL=URL
        from [dbo].[WEB_Orders_vw] where TID=@p_ID

        if @p_IsNoPrice = 1
            UPDATE [dbo].[Orders_tb] SET
                SubdivisionID=@l_SubdivisionID,
                SectorID=@l_SectorID,
                CategoryID=@l_CategoryID,
                EquipmentID=@l_EquipmentID,
                SellerID=@l_SellerID,
                Login=@p_Login,
                Article=@p_Article,
                Qty=@p_Qty,
                Purpose=@p_Purpose,
                Account=@p_Account,
                URL=@p_URL,
                EditedBy=@p_EditedBy,
                RD=@l_now
            WHERE TID=@p_ID
        else
            UPDATE [dbo].[Orders_tb] SET
                SubdivisionID=@l_SubdivisionID,
                SectorID=@l_SectorID,
                CategoryID=@l_CategoryID,
                EquipmentID=@l_EquipmentID,
                ConditionID=@l_ConditionID,
                SellerID=@l_SellerID,
                Login=@p_Login,
                Article=@p_Article,
                Qty=@p_Qty,
                Purpose=@p_Purpose,
                Account=@p_Account,
                URL=@p_URL,
                Price=@p_Price,
                Currency=@p_Currency,
                Total=cast(@p_Total as money),
                Tax=cast(@p_Tax as money),
                EditedBy=@p_EditedBy,
                RD=@l_now
            WHERE TID=@p_ID

        select @l_OrderID = @p_ID

        set @p_Subdivision = [dbo].[GET_SplittedItem_fn](@p_Subdivision, '|', 0)
        set @p_Sector = [dbo].[GET_SplittedItem_fn](@p_Sector, '|', 0)
        set @p_Category = [dbo].[GET_SplittedItem_fn](@p_Category, '|', 0)
        set @p_Equipment = [dbo].[GET_SplittedItem_fn](@p_Equipment, '|', 0)
        set @p_Seller = [dbo].[GET_SplittedItem_fn](@p_Seller, '|', 0)
        set @p_Condition = [dbo].[GET_SplittedItem_fn](@p_Condition, '|', 0)
        --
        -- Add to Order Changes log
        --
        if [dbo].[CHECK_IsEqual_fn](@c_Article, @p_Article) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'НАИМЕНОВАНИЕ ДОКУМЕНТА', @p_Article)

        if [dbo].[CHECK_IsEqual_fn](@c_Equipment, @p_Equipment) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Руководитель', @p_Equipment)

        if [dbo].[CHECK_IsEqual_fn](@c_Purpose, @p_Purpose) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'СОДЕРЖАНИЕ', @p_Purpose)

        if [dbo].[CHECK_IsEqual_fn](@c_Category, @p_Category) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Категория документа', @p_Category)

        if [dbo].[CHECK_IsEqual_fn](@c_Account, @p_Account) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Регистрационный номер', @p_Account)

        if [dbo].[CHECK_IsEqual_fn](@c_Author, @p_Login) = 0
            INSERT INTO [dbo].[OrderChanges_tb](OrderID, Login, Name, Value) VALUES 
                (@l_OrderID, @p_EditedBy, 'Автор документа', @p_Login)

        DECLARE @param varchar(20) = 'Срок исполнения'

        select top 1 @l_ParamID = TID from [dbo].[DIC_Params_tb] where Name=@param and (MD=@p_MD or MD is null)

        if [dbo].[CHECK_IsEmpty_fn](@p_DueDate) = 0 begin
            select @l_DueDate=[Value] from [dbo].[Params_tb] where OrderID=@l_OrderID and ParamID=@l_ParamID
            if @p_DueDate != @l_DueDate or [dbo].[CHECK_IsEmpty_fn](@l_DueDate) = 1
                EXEC [dbo].[ADD_Param_sp] 1, @l_OrderID, 0, 0, @p_EditedBy, @param, @p_DueDate, @p_MD, null
        end else
            EXEC [dbo].[DEL_Param_sp] 1, @l_OrderID, @l_ParamID, 0, @p_EditedBy, null

        set @p_Output = 'Refreshed'
    end else begin
        set @l_OrderID = 0
        set @p_Output = 'Invalid' 
            + ':' + case when @l_SubdivisionID is null then 'NULL' else cast(@l_SubdivisionID as varchar) end
            + ':' + case when @l_SellerID is null then 'NULL' else cast(@l_SellerID as varchar) end
            + ':' + cast(@exists as varchar)
    end

    set @p_Output = @p_Output + ':' + cast(@l_OrderID as varchar)

    if @p_Mode = 0
        SELECT @l_OrderID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[UPDATE_Order_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END




GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Decrees_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "r"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Decrees_vw'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Decrees_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Decrees_vw'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Reviews_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "r"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 201
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Reviews_vw'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Reviews_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Reviews_vw'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Schedule_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "r"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 123
               Right = 417
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 455
               Bottom = 123
               Right = 621
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 20
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Schedule_vw'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'WEB_Schedule_vw', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WEB_Schedule_vw'
GO
