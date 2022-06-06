USE [storage]
GO
/****** Object:  Table [dbo].[OrderDocuments_tb]    Script Date: 26.08.2021 11:50:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDocuments_tb](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [char](50) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[FileName] [varchar](255) NOT NULL,
	[FileSize] [int] NULL,
	[ContentType] [varchar](20) NULL,
	[Note] [varchar](1000) NULL,
	[Image] [image] NULL,
	[RD] [datetime] NULL,
	[ForAudit] [bit] NULL,
 CONSTRAINT [PK_OrderDocuments_tb] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[WEB_OrderDocuments_vw]    Script Date: 26.08.2021 11:50:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WEB_OrderDocuments_vw]
AS
SELECT     TID, UID, OrderID, Login, FileName, FileSize, ContentType, CASE WHEN d .Image IS NULL THEN 0 ELSE 1 END AS IsExist, Note, ForAudit, RD
FROM         dbo.OrderDocuments_tb AS d


GO
/****** Object:  Index [WX_OrderDocuments_OrderID]    Script Date: 26.08.2021 11:50:02 ******/
CREATE NONCLUSTERED INDEX [WX_OrderDocuments_OrderID] ON [dbo].[OrderDocuments_tb]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [WX_OrderDocuments_UID]    Script Date: 26.08.2021 11:50:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [WX_OrderDocuments_UID] ON [dbo].[OrderDocuments_tb]
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDocuments_tb] ADD  CONSTRAINT [DF_OrderDocuments_RD]  DEFAULT (getdate()) FOR [RD]
GO
/****** Object:  StoredProcedure [dbo].[DEL_Document_sp]    Script Date: 26.08.2021 11:50:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- DEL NEW PROVISION PAYMENT
-- -------------------------
--   @p_OrderID      -- Order ID
--   @p_ID           -- TID
--   @p_Login        -- login of reviewer
--
CREATE PROCEDURE [dbo].[DEL_Document_sp]
    @p_Mode             int,
    @p_OrderID          int,
    @p_ID               int,
    @p_Login            varchar(50),
    @p_Output           varchar(20) output
AS
BEGIN
    SET NOCOUNT ON

    DECLARE
        @l_TID          int = null,
        @l_now          datetime

    set @l_now = getdate()

    declare 
        @exists bit = null

    set @exists=1

    if @exists = 1 and @p_ID > 0
        select top 1 @l_TID = TID from [dbo].[OrderDocuments_tb] where OrderID=@p_OrderID and TID=@p_ID

    if @l_TID > 0
    begin
        DELETE FROM [dbo].[OrderDocuments_tb] WHERE TID=@l_TID

        set @p_Output = 'Removed'
    end else begin
        set @p_Output = 'Invalid'
    end

    if @p_Mode = 0
        SELECT @l_TID, @p_Output FROM 
            dbo.sysobjects where id = object_id(N'[dbo].[DEL_Document_sp]') and OBJECTPROPERTY(id, N'IsProcedure') = 1
    else
        return(0)
END


GO
