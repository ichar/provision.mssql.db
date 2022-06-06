USE [SaleDB]
GO
/****** Object:  StoredProcedure [dbo].[CHECK_Vendor_sp]    Script Date: 29.01.2022 8:08:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CHECK & REGISTER GIVEN VENDOR IF NOT EXISTS
--   @p_Name        -- given vendor name
--   @p_ID          -- vendor id (output)
--
-- 20201114: creating
--
CREATE PROCEDURE [dbo].[CHECK_Vendor_sp]
    @p_Mode             int,
    @p_VendorID         int,
    @p_Name             varchar(100),
    @p_ID               int output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_VendorID     int,
        @l_Name         varchar(100)

    if dbo.CHECK_IsEmpty_fn(@p_Name) = 1
    begin
        set @p_ID = @p_VendorID
        return(-1)
    end

    set @l_Name = @p_Name

    SELECT TOP 1 @l_VendorID=TID FROM [dbo].[DIC_Vendors_tb] WHERE
        Name=@l_Name

    if @l_VendorID is null
    begin
        INSERT INTO [dbo].[DIC_Vendors_tb](Name) VALUES (@l_Name)
        select top 1 @l_VendorID=TID from [dbo].[DIC_Vendors_tb] where Name=@l_Name
        
        --select @l_VendorID = CAST(scope_identity() AS int)
    end

    set @p_ID = @l_VendorID

    if @p_Mode = 0
        SELECT @l_VendorID FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[CHECK_Vendor_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
