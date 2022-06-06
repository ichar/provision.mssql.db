USE [ProvisionDB]
GO
/****** Object:  Table [dbo].[OrdersNew_tb]    Script Date: 10/26/2020 05:41:08 ******/

--ALTER TABLE [dbo].[Orders_tb] SWITCH TO [dbo].[OrdersNew_tb];
--IF NOT EXISTS (SELECT * FROM [dbo].[Orders_tb]) DROP TABLE [dbo].[Orders_tb]

INSERT INTO [dbo].[OrdersNew_tb]
SELECT 
	[TID],
	[SubdivisionID],
	[EquipmentID],
	[ConditionID],
	[CategoryID],
	[SellerID],
	[StockListID],
	[Login],
	[Article],
	[Qty],
	[Purpose],
	[Price],
	[Currency],
	[Total],
	[Tax],
	[Status],
	[Account],
	[URL],
	[EditedBy],
	[RowSpan],
	[MD],
	[RD]
FROM [dbo].[Orders_tb] 
GO

DECLARE @rows1 int, @rows2 int

select @rows1 = count(*) from [dbo].[Orders_tb]
select @rows2 = count(*) from [dbo].[OrdersNew_tb]

IF @rows1 = @rows2 BEGIN
    DROP TABLE [dbo].[Orders_tb]
    EXEC sys.sp_rename 'OrdersNew_tb', 'Orders_tb', 'OBJECT';
    EXEC sys.sp_rename 'PK_OrdersNew_TID', 'PK_Orders_TID', 'OBJECT';
END
GO
