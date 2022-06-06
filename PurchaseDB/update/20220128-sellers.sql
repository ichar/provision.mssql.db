USE [PurchaseDB]
GO
/****** Object:  View [dbo].[WEB_Sellers_vw]    Script Date: 29.01.2022 8:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[WEB_Sellers_vw]
AS
SELECT        TID, Name, Title, Address, Code, Type, Contact, URL, Phone, Email, EditedBy, MD, RD
FROM            ProvisionDB.dbo.DIC_Sellers_tb AS s

GO
/****** Object:  StoredProcedure [dbo].[CHECK_Seller_sp]    Script Date: 29.01.2022 8:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CHECK & REGISTER GIVEN SELLER IF NOT EXISTS
--   @p_Name        -- given seller name: Name[|Title][|Address]
--   @p_ID          -- seller id (output)
--
-- 20190620: creating
--
ALTER PROCEDURE [dbo].[CHECK_Seller_sp]
    @p_Mode             int,
    @p_Name             varchar(2000),
    @p_MD               int,
    @p_ID               int output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_SellerID     int,
        @l_Name         varchar(100),
        @l_Title        varchar(250),
        @l_Address      varchar(1000),
        @l_Code         varchar(20),
        @l_Contact      varchar(200)

    if dbo.CHECK_IsEmpty_fn(@p_Name) = 1
    begin
        set @p_ID = null
        return(-1)
    end

    select * into #tmp from [dbo].[GET_SplittedStrings_fn](@p_Name, '||')
    
    select @l_Name=item from #tmp where n=0
    select @l_Title=item from #tmp where n=1
    select @l_Address=item from #tmp where n=2
    select @l_Code=item from #tmp where n=3
    select @l_Contact=item from #tmp where n=4

    drop table #tmp

    SELECT TOP 1 @l_SellerID=TID FROM [ProvisionDB].[dbo].[DIC_Sellers_tb] WHERE
        Name=@l_Name and (MD=@p_MD or MD is null)

    if @l_SellerID is null and ([dbo].[CHECK_IsEmpty_fn](@l_Name)=1 or charindex('задано', @l_Name) > 0) begin
        select top 1 @l_SellerID=TID from [ProvisionDB].[dbo].[DIC_Sellers_tb] where Name='---' or Name like '%- не задано -%' or [dbo].[CHECK_IsEmpty_fn](Name)=1

    end else if @l_SellerID is null
    begin
        INSERT INTO [ProvisionDB].[dbo].[DIC_Sellers_tb](Name, Title, Address, Code, Contact, MD) VALUES (@l_Name, @l_Title, @l_Address, @l_Code, @l_Contact, @p_MD)
        select top 1 @l_SellerID=TID from [ProvisionDB].[dbo].[DIC_Sellers_tb] where Name=@l_Name
        
        --select @l_SellerID = CAST(scope_identity() AS int)
    end else begin
        UPDATE [ProvisionDB].[dbo].[DIC_Sellers_tb] SET 
            Title=@l_Title, 
            Address=@l_Address,
            Code=@l_Code,
            Contact=@l_Contact
        WHERE TID=@l_SellerID
    end

    set @p_ID = @l_SellerID

    if @p_Mode = 0
        SELECT @l_SellerID FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[CHECK_Seller_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[DEL_Seller_sp]    Script Date: 29.01.2022 8:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- DEL PROVISION SELLER
-- --------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
ALTER PROCEDURE [dbo].[DEL_Seller_sp]
    @p_Mode             int,
    @p_SellerID         int,
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

    select @exists=1 from [dbo].[Orders_tb] where SellerID=@p_SellerID

    if @exists = 1 begin
        set @l_TID = @p_SellerID
        set @p_Output = 'Exists'
    end else if @p_SellerID > 0 begin
        set @l_TID = @p_SellerID

        DELETE FROM [ProvisionDB].[dbo].[DIC_Sellers_tb] WHERE TID=@l_TID

        set @p_Output = 'Removed'
    end else begin
        set @p_Output = 'Invalid'
    end

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[DEL_Seller_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
/****** Object:  StoredProcedure [dbo].[UPDATE_Seller_sp]    Script Date: 29.01.2022 8:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[UPDATE_Seller_sp] 
    @p_Mode             int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Name             varchar(100),
    @p_Title            varchar(250),
    @p_Address          varchar(1000),
    @p_Code             varchar(20),
    @p_Type             int,
    @p_Contact          varchar(200),
    @p_URL              varchar(200),
    @p_Phone            varchar(100),
    @p_Email            varchar(100),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_SellerID         int,
        @l_now              datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    select @exists=1 from [ProvisionDB].[dbo].[DIC_Sellers_tb] where TID=@p_ID

    set @p_Output = ''

    if @exists = 1
    begin
        UPDATE [ProvisionDB].[dbo].[DIC_Sellers_tb] SET
            Name=@p_Name,
            Title=@p_Title,
            Address=@p_Address,
            Code=@p_Code,
            Type=@p_Type,
            Contact=@p_Contact,
            URL=@p_URL,
            Phone=@p_Phone,
            Email=@p_Email,
            EditedBy=@p_Login,
            RD=@l_now
        WHERE TID=@p_ID

        set @l_SellerID = @p_ID
        set @p_Output = 'Refreshed'
    end else begin
        set @l_SellerID = 0
        set @p_Output = 'Invalid' 
            + ':' + case when @l_SellerID is null then 'NULL' else cast(@l_SellerID as varchar) end
            + ':' + cast(@exists as varchar)
    end

    set @p_Output = @p_Output + ':' + cast(@l_SellerID as varchar)

    if @p_Mode = 0
        SELECT @l_SellerID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[UPDATE_Seller_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END

GO
