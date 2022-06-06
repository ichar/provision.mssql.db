/****** Script for SelectTopNRows command from SSMS  ******/
SELECT top 10 * FROM [ProvisionDB].[dbo].[OrderDocuments_tb]
SELECT * FROM [ProvisionDB].[dbo].[WEB_OrderDocuments_vw]  order by TID desc

insert into [storage].[dbo].[OrderDocuments_tb] (
	UID, OrderID, Login, FileName, FileSize, ContentType, ForAudit, Note, Image
	)
	select UID, OrderID, Login, FileName, FileSize, ContentType, ForAudit, Note, Image 
	from [ProvisionDB].[dbo].[OrderDocuments_tb] as d where d.TID<10000 and 
	not exists
		(select 1 from [storage].[dbo].[OrderDocuments_tb] as d2 where d2.uid=d.uid)

SELECT * FROM [storage].[dbo].[OrderDocuments_tb]
SELECT * FROM [storage].[dbo].[WEB_OrderDocuments_vw] order by TID desc
SELECT * FROM [ProvisionDB].[dbo].[WEB_OrderDocuments_vw]  order by TID desc
/*
use [ProvisionDB]
go
drop view [WEB_OrderDocuments_vw]
drop table [OrderDocuments_tb]
*/
SELECT   FileName,FileSize,ContentType,Image FROM [storage].[dbo].[OrderDocuments_tb] WHERE UID='EBAE1DA2-04F9-4992-8D6B-1947CD9EBA6316291051637542'

------------

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT top 10 * FROM [ProvisionDB].[dbo].[OrderDocuments_tb]
SELECT * FROM [ProvisionDB].[dbo].[WEB_OrderDocuments_vw]  order by TID desc

insert into [storage].[dbo].[OrderDocuments_tb] (
	UID, OrderID, Login, FileName, FileSize, ContentType, ForAudit, Note, Image
	)
	select UID, OrderID, Login, FileName, FileSize, ContentType, ForAudit, Note, Image 
	from [ProvisionDB].[dbo].[OrderDocuments_tb] as d where d.TID<10000 and 
	not exists
		(select 1 from [storage].[dbo].[OrderDocuments_tb] as d2 where d2.uid=d.uid)

SELECT * FROM [storage].[dbo].[OrderDocuments_tb]
SELECT * FROM [storage].[dbo].[WEB_OrderDocuments_vw] order by TID desc
SELECT * FROM [ProvisionDB].[dbo].[WEB_OrderDocuments_vw]  order by TID desc

SELECT   FileName,FileSize,ContentType,Image FROM [storage].[dbo].[OrderDocuments_tb] WHERE UID='EBAE1DA2-04F9-4992-8D6B-1947CD9EBA6316291051637542'

-------------

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT top 10 * FROM [ProvisionDB].[dbo].[OrderDocuments_tb]
SELECT * FROM [ProvisionDB].[dbo].[WEB_OrderDocuments_vw]

insert into [storage].[dbo].[OrderDocuments_tb]
	select * from [ProvisionDB].[dbo].[OrderDocuments_tb] as d where d.TID<5000 and not exists
		(select 1 from [storage].[dbo].[OrderDocuments_tb] as d2 where d2.uid=d.uid)

SELECT * FROM [storage].[dbo].[OrderDocuments_tb]
SELECT * FROM [storage].[dbo].[WEB_OrderDocuments_vw] order by TID desc
