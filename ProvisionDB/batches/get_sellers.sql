
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT * FROM [ProvisionDB].[dbo].[BATCH_Sellers_vw]
SELECT TID, Name, Orders FROM [ProvisionDB].[dbo].[BATCH_Sellers_vw]
where (Title is null or Title='') and Orders>0
--and TID in (54)
order by TID, Name

SELECT TID, Author, Article, SellerID FROM [ProvisionDB].[dbo].[WEB_Orders_vw] where SellerID=31
SELECT distinct * FROM [ProvisionDB].[dbo].[WEB_Sellers_vw] order by Name
SELECT * FROM [ProvisionDB].[dbo].[DIC_Sellers_tb] where TID=122

SELECT distinct * FROM [ProvisionDB].[dbo].[DIC_Sellers_tb] as s where TID in 
(8, 20, 30, 31, 54, 55, 56, 59, 66, 117, 122, 171, 178, 213, 241, 247, 350, 474, 497, 500, 530, 531) and 
exists(select 1 from [ProvisionDB].[dbo].[BATCH_Sellers_vw] where TID=s.TID and Orders=0)

select *
--delete 
from [ProvisionDB].[dbo].[Orders_tb] where TID in (69,168,153,405)
--delete from [ProvisionDB].[dbo].[DIC_Sellers_tb] where TID in (54,66,178,31,122)

----------------

SELECT TID, Name, Orders FROM [ProvisionDB].[dbo].[BATCH_Sellers_vw]
where (Title is null or Title='') and Orders>0
order by Name

----------------
--SELECT * FROM [ProvisionDB].[dbo].[DIC_Sellers_tb] order by Name
--SELECT * FROM [ProvisionDB].[dbo].[WEB_Sellers_vw] order by Name

SELECT DISTINCT 
s.TID, 
count(o.SellerID) as Orders,
/*
	(select count(TID) as Orders from [ProvisionDB].dbo.Orders_tb AS o where 
		o.SellerID is not null and s.TID=o.SellerID) as Orders,
*/
s.Name, s.Title, s.Address
FROM 
	[ProvisionDB].[dbo].[DIC_Sellers_tb] as s
	LEFT OUTER JOIN [ProvisionDB].dbo.Orders_tb AS o ON s.TID=o.SellerID
--WHERE o.SellerID is not null
	/*
	(select count(TID) as Orders from [ProvisionDB].dbo.Orders_tb AS o where 
		o.SellerID is not null and s.TID=o.SellerID) = 0
	*/
GROUP BY s.TID, s.Name, s.Title, s.Address
ORDER BY Orders asc
