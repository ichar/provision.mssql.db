USE [ProvisionDB]
GO

select * from [ProvisionDB].[dbo].[DIC_Params_tb] where MD is NULL or MD=0 order by Name
--update [ProvisionDB].[dbo].[DIC_Params_tb] set Code='CO' where Name like 'Компания%'
--update [ProvisionDB].[dbo].[DIC_Params_tb] set Code='EX' where Name='Исполнитель'
--update [ProvisionDB].[dbo].[DIC_Params_tb] set Code='1C' where Name='Код номенклатуры 1С'
--update [ProvisionDB].[dbo].[DIC_Params_tb] set Code='IN' where Name='Счет-фактура'
/*
select OrderID, ParamID, Value from [ProvisionDB].[dbo].[Params_tb] p 
	inner join [ProvisionDB].[dbo].[DIC_Params_tb] d on d.TID=p.ParamID
	where Name like 'Аудит%'
insert into [ProvisionDB].[dbo].[Params_tb] values(3594,46,'stock','Многократно','')
*/
