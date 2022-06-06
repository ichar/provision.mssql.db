select * from [ProvisionDB].[dbo].[DIC_StockList_tb] order by TID desc
SELECT TID, Name, NodeLevel, NodeCode as _____________________________________, Children, EditedBy FROM [ProvisionDB].[dbo].[DIC_StockList_tb] order by NodeCode

SELECT * FROM [ProvisionDB].[dbo].[WEB_Orders_vw] order by TID desc
SELECT * FROM [ProvisionDB].[dbo].[Orders_tb] order by TID desc
--
-- Get Node from and to
--
select * from [ProvisionDB].[dbo].[DIC_StockList_tb] where TID=222 -- from
select * from [ProvisionDB].[dbo].[DIC_StockList_tb] where TID=242 -- to (!!!)
select * from [ProvisionDB].[dbo].[DIC_StockList_tb] where NodeCode like '0001.0014%' order by NodeCode
select * from [ProvisionDB].[dbo].[DIC_StockList_tb] where NodeCode like '0001.0013.0002%' order by NodeCode

--print(SUBSTRING('0001.0014.0000', 10, len('0001.0014.0000')))

declare 
    @new_node varchar(100), 
    @new_level int, 
    @old_level int
select @new_node=NodeCode, @new_level=NodeLevel from [ProvisionDB].[dbo].[DIC_StockList_tb] where TID=242
select @old_level=NodeLevel from [ProvisionDB].[dbo].[DIC_StockList_tb] where TID=222
print(@new_node)
print(@new_level)
print(@old_level)
--
-- UPDATE NodeCode
--
select TID, Name,
--update [ProvisionDB].[dbo].[DIC_StockList_tb] set
NodeCode=@new_node+SUBSTRING(NodeCode, 10, len(NodeCode)), NodeLevel=NodeLevel-@old_level+@new_level
from [ProvisionDB].[dbo].[DIC_StockList_tb]
where NodeCode like '0001.0014.%' 
order by NodeCode
--
-- UPDATE Children
--
/*
select 
--update [ProvisionDB].[dbo].[DIC_StockList_tb] set
Children=(select Children from [ProvisionDB].[dbo].[DIC_StockList_tb] where TID=222)
from [ProvisionDB].[dbo].[DIC_StockList_tb]
where TID=242
*/
select TID, Name,
--update [ProvisionDB].[dbo].[DIC_StockList_tb] set 
Children=[ProvisionDB].[dbo].[GET_RowsNodeCount_fn](NodeCode)
from [ProvisionDB].[dbo].[DIC_StockList_tb]

--
-- Check Orders on new Node
--
SELECT * FROM [ProvisionDB].[dbo].[WEB_Orders_vw] where StockListNodeCode like '0001.0014%' order by TID desc
SELECT * FROM [ProvisionDB].[dbo].[WEB_Orders_vw] where StockListNodeCode like '0001.0013.0002%' order by TID desc

