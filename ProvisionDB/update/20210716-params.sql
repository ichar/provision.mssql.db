USE [ProvisionDB]
GO

select * from [ProvisionDB].[dbo].[DIC_Params_tb] where MD is NULL or MD=0 order by Name
--update [ProvisionDB].[dbo].[DIC_Params_tb] set Code='CO' where Name like '��������%'
--update [ProvisionDB].[dbo].[DIC_Params_tb] set Code='EX' where Name='�����������'
--update [ProvisionDB].[dbo].[DIC_Params_tb] set Code='1C' where Name='��� ������������ 1�'
--update [ProvisionDB].[dbo].[DIC_Params_tb] set Code='IN' where Name='����-�������'
/*
select OrderID, ParamID, Value from [ProvisionDB].[dbo].[Params_tb] p 
	inner join [ProvisionDB].[dbo].[DIC_Params_tb] d on d.TID=p.ParamID
	where Name like '�����%'
insert into [ProvisionDB].[dbo].[Params_tb] values(3594,46,'stock','�����������','')
*/
