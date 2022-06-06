USE [PurchaseDB]
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_Seller_sp]    Script Date: 29.01.2022 8:11:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_Seller_sp] 
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
