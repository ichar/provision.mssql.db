USE [ProvisionDB]
GO
/****** Object:  UserDefinedFunction [dbo].[CHECK_IsInReviews_fn]    Script Date: 12/06/2020 04:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- CHECK IF GIVEN STATUSES IS IN REVIEWS
--   @pReviews  -- source value
--   @pStatuses -- statuses: '1,2,3,4'
--
CREATE FUNCTION [dbo].[CHECK_IsInReviews_fn](
    @pReviews   varchar(MAX), 
    @pStatuses  varchar(50)    
)
returns bit
AS
BEGIN
    DECLARE
        @exists  bit

    select top 1 @exists=1 from [dbo].[GET_SplittedStrings_fn](@pReviews, ':') where 
        item in (select item from [dbo].[GET_SplittedStrings_fn](@pStatuses, ','))
    if @exists IS NULL
        return 0
    return 1
END
GO
