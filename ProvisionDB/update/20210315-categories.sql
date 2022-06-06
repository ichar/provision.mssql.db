USE [ProvisionDB]
GO

--select * from [dbo].[DIC_Categories_tb] order by TID desc
--SELECT * FROM [dbo].[WEB_Orders_vw] where CategoryID=4 order by TID desc

update [dbo].[Orders_tb] set CategoryID=14 where CategoryID=4
update [dbo].[DIC_Categories_tb] set Name='общехозяйственные расходы' where TID=14
update [dbo].[DIC_Categories_tb] set Name='периодический ежемесячный платеж' where TID=4
