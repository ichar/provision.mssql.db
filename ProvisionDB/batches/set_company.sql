    use ProvisionDB
	go
	declare @OrderID int, @exists bit
	DECLARE x CURSOR READ_ONLY FOR SELECT TID FROM [dbo].[WEB_Orders_vw] WHERE
        /*
		SubdivisionID in (
			--8,19,30
			--37
			--10,32
			--11
			39
		) and
		*/
		RD > '2021-01-01' and 
        MD=0
    OPEN x
    while (1=1) begin
	    set @exists = null
        FETCH NEXT FROM x INTO @OrderID
        if @@fetch_status = -1
            break
		select @exists=1 from [dbo].[Params_tb] where OrderID=@OrderID and ParamID=45
		if @exists is null begin
		    insert into [dbo].[Params_tb](OrderID, ParamID, Login, Value) values(@OrderID, 45, 'admin', 
				--'Розан Даймонд, ЗАО'
				--'ЭкспрессКард, ЗАО'
				--'Розан Логистик, ООО'
				--'Розан СПБ'
				--'3Д ПЭЙ'
				'Розан Файнэнс, АО'
			)
			print @OrderID
		end
    end
    CLOSE x
    DEALLOCATE x
