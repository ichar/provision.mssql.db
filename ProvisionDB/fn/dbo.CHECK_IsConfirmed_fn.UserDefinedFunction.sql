USE [ProvisionDB]
GO
/****** Object:  UserDefinedFunction [dbo].[CHECK_IsConfirmed_fn]    Script Date: 09/02/2022 04:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CHECK IF GIVEN STATUSES IS IN REVIEWS
--   @pReviews  -- source value
--   @pStatuses -- statuses: '1,2,3,4'
--   @pc        -- check after control status: ':5'
--
CREATE FUNCTION [dbo].[CHECK_IsConfirmed_fn](
    @pReviews   varchar(500), 
    @pStatuses  varchar(50),
    @pc         varchar(10)
)
returns bit
AS
BEGIN
    DECLARE
        @lReviews varchar(500),
        @exists bit,
        @p int

    set @p = CHARINDEX(@pc, @pReviews)
    set @lReviews = SUBSTRING(@pReviews, case when @p > 0 then @p else 1 end, LEN(@pReviews))

    select top 1 @exists=1 from [dbo].[GET_SplittedStrings_fn](@lReviews, ':') where 
        item in (select item from [dbo].[GET_SplittedStrings_fn](@pStatuses, ','))
    if @exists IS NULL
        return 0
    return 1
END
GO
