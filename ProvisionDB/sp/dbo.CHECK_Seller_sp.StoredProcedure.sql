USE [ProvisionDB]
GO
/****** Object:  StoredProcedure [dbo].[CHECK_Seller_sp]    Script Date: 01.08.2019 17:34:13 ******/
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

    SELECT TOP 1 @l_SellerID=TID FROM [dbo].[DIC_Sellers_tb] WHERE
        Name=@l_Name and (MD=@p_MD or MD is null)

    if @l_SellerID is null and ([dbo].[CHECK_IsEmpty_fn](@l_Name)=1 or charindex('задано', @l_Name) > 0) begin
        select top 1 @l_SellerID=TID from [dbo].[DIC_Sellers_tb] where Name='---' or Name like '%- не задано -%' or [dbo].[CHECK_IsEmpty_fn](Name)=1

    end else if @l_SellerID is null
    begin
        INSERT INTO [dbo].[DIC_Sellers_tb](Name, Title, Address, Code, Contact, MD) VALUES (@l_Name, @l_Title, @l_Address, @l_Code, @l_Contact, @p_MD)
        select top 1 @l_SellerID=TID from [dbo].[DIC_Sellers_tb] where Name=@l_Name
        
        --select @l_SellerID = CAST(scope_identity() AS int)
    end else begin
        UPDATE [dbo].[DIC_Sellers_tb] SET 
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
