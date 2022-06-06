--
--  v1: [PurchaseDB].[dbo].[WEB_Orders_vw]
--

SELECT
    o.TID, 
    o.Login     AS Author, 
    o.Article, 
    o.Qty, 
    o.Purpose, 
    o.Price, 
    o.Currency, 
    o.Total, 
    o.Tax, 
    --v.Name      AS Company, 
    (select top 1 Name from dbo.WEB_Companies_vw where OrderID=o.TID) AS Company, 
    p.Name      AS Subdivision, 
    u.Name      AS Sector, 
    e.Title     AS Equipment, 
    e.Name      AS EquipmentName, 
    c.Name      AS Condition, 
    s.Name      AS Seller, 
    s.Code      AS SellerCode, 
    s.Type      AS SellerType, 
    s.Title     AS SellerTitle, 
    s.Address   AS SellerAddress, 
    s.Contact   AS SellerContact, 
    s.URL       AS SellerURL, 
    g.Name      AS Category, 
    o.Account, 
    o.URL, 
    o.Status,
    (select top 1 r.Status from dbo.Reviews_tb as r where r.OrderID=o.TID order by r.TID desc) AS ReviewStatus,
    dbo.GET_ReviewStatuses_fn(o.TID) AS ReviewStatuses,
    p.Code      AS SubdivisionCode, 
    p.TID       AS SubdivisionID, 
    u.TID       AS SectorID, 
    e.TID       AS EquipmentID, 
    s.TID       AS SellerID, 
    c.TID       AS ConditionID, 
    o.CategoryID, 
    o.StockListID,
    l.NodeCode  AS StockListNodeCode,
    dbo.GET_UnreadByLogin_fn(o.TID) AS UnreadByLogin,
    o.EditedBy,
    o.RowSpan,
    d.Created,
    d.Approved,
    d.ReviewDueDate,
    d.Paid,
    d.Delivered,
    d.AuditDate,
    d.Validated,
    d.FinishDueDate,
    d.Facsimile,
    o.MD,
    o.RD
FROM
    dbo.Orders_tb as o
    LEFT OUTER JOIN dbo.DIC_Subdivisions_tb AS p ON p.TID=o.SubdivisionID
    LEFT OUTER JOIN dbo.DIC_Sectors_tb AS u ON u.TID=o.SectorID
    LEFT OUTER JOIN dbo.DIC_Equipments_tb AS e ON e.TID=o.EquipmentID
    LEFT OUTER JOIN dbo.DIC_Conditions_tb AS c ON c.TID=o.ConditionID
    LEFT OUTER JOIN ProvisionDB.dbo.DIC_Sellers_tb AS s ON s.TID=o.SellerID
    LEFT OUTER JOIN dbo.DIC_Categories_tb AS g ON g.TID=o.CategoryID
    LEFT OUTER JOIN ProvisionDB.dbo.DIC_StockList_tb AS l ON l.TID=o.StockListID
    LEFT OUTER JOIN dbo.OrderDates_tb AS d ON d.OrderID=o.TID
    --LEFT OUTER JOIN dbo.WEB_Companies_vw AS v ON v.OrderID=o.TID

--
--  v1.1: [PurchaseDB].[dbo].[WEB_ReviewerOrders_vw]
--

SELECT
    o.*,
    r.Login     AS Reviewer
FROM 
    dbo.WEB_Orders_vw AS o
    LEFT OUTER JOIN dbo.Reviewers_tb AS r ON r.OrderID=o.TID

--
--  v1.2: [PurchaseDB].[dbo].[WEB_CostOrders_vw]
--

SELECT
    o.TID, 
    o.Login     AS Author, 
    o.Article, 
    o.Qty, 
    o.Price, 
    o.Currency, 
    o.Total, 
    o.Tax, 
    p.Name      AS Subdivision, 
    u.Name      AS Sector, 
    --e.Title     AS Equipment, 
    --c.Name      AS Condition, 
    s.Name      AS Seller, 
    --g.Name      AS Category, 
    o.Account, 
    --o.URL, 
    o.Status,
    --p.Code      AS SubdivisionCode, 
    p.TID       AS SubdivisionID, 
    u.TID       AS SectorID, 
    e.TID       AS EquipmentID, 
    s.TID       AS SellerID, 
    c.TID       AS ConditionID, 
    o.CategoryID, 
    o.StockListID,
    l.NodeCode  AS StockListNodeCode,
    c.Code      AS ConditionCode, 
    o.EditedBy,
    d.Created,
    d.Approved,
    d.Paid,
    d.Delivered,
    o.MD,
    o.RD
FROM
    dbo.Orders_tb as o
    LEFT OUTER JOIN dbo.DIC_Subdivisions_tb AS p ON p.TID=o.SubdivisionID
    LEFT OUTER JOIN dbo.DIC_Sectors_tb AS u ON u.TID=o.SectorID
    LEFT OUTER JOIN dbo.DIC_Equipments_tb AS e ON e.TID=o.EquipmentID
    LEFT OUTER JOIN dbo.DIC_Conditions_tb AS c ON c.TID=o.ConditionID
    LEFT OUTER JOIN ProvisionDB.dbo.DIC_Sellers_tb AS s ON s.TID=o.SellerID
    LEFT OUTER JOIN dbo.DIC_Categories_tb AS g ON g.TID=o.CategoryID
    LEFT OUTER JOIN ProvisionDB.dbo.DIC_StockList_tb AS l ON l.TID=o.StockListID
    LEFT OUTER JOIN dbo.OrderDates_tb AS d ON d.OrderID=o.TID

--
--  v2: [PurchaseDB].[dbo].[WEB_Reviews_vw]
--

SELECT
    r.TID, 
    o.TID       AS OrderID, 
    r.Login, 
    r.Reviewer, 
    r.Status, 
    d.Status    AS DecreeStatus,
    r.Note, 
    d.DueDate,
    o.MD,
    o.RD        AS RegistryDate,
    r.RD        AS StatusDate
FROM
    dbo.Reviews_tb AS r
    INNER JOIN dbo.Orders_tb AS o ON o.TID=r.OrderID
    LEFT OUTER JOIN dbo.Decrees_tb AS d ON d.ReviewID=r.TID

--
--  v2.1: [PurchaseDB].[dbo].[WEB_Decrees_vw]
--

SELECT
    d.TID,
    d.Login     AS Executor,
    d.Status    AS DecreeStatus,
    d.DueDate,
    d.ReportID,
    d.EditedBy,
    r.TID       AS ReviewID,
    r.OrderID,
    r.Login     AS Author,
    r.Reviewer,
    r.Note, 
    r.Status    AS ReviewStatus,
    r.RD        AS ReviewDate,
    d.Accepted,
    d.Reported,
    d.MD,
    d.RD
FROM
    dbo.Decrees_tb AS d
    INNER JOIN dbo.Reviews_tb AS r ON r.TID=d.ReviewID

--
--  v3: [PurchaseDB].[dbo].[WEB_Subdivisions_vw]
--

SELECT
    s.TID, 
    s.Name, 
    s.Code, 
    s.Manager,
    s.Name + ' (' + s.Manager + ')' AS FullName
FROM
    dbo.DIC_Subdivisions_tb AS s

--
--  v4: [PurchaseDB].[dbo].[WEB_Sellers_vw]
--

SELECT --DISTINCT
    s.TID, 
    s.Name, 
    s.Title,
    s.Address,
    s.Code,
    s.Type,
    s.Contact,
    s.URL,
    s.Phone,
    s.Email,
    s.EditedBy,
    s.MD,
    s.RD
FROM
    ProvisionDB.dbo.DIC_Sellers_tb AS s
--    LEFT OUTER JOIN dbo.Orders_tb AS o ON s.TID=o.SellerID
--WHERE o.SellerID is not null

--
--  v5: [PurchaseDB].[dbo].[WEB_Conditions_vw]
--

SELECT
    s.TID, 
    s.Name,
    s.Code
FROM
    dbo.DIC_Conditions_tb AS s

--
--  v6: [PurchaseDB].[dbo].[WEB_Equipments_vw]
--

SELECT
    s.TID, 
    d.Name      AS Subdivision, 
    s.Title,
    s.Name,
    s.SubdivisionID
FROM
    dbo.DIC_Equipments_tb AS s
    INNER JOIN dbo.DIC_Subdivisions_tb AS d ON d.TID=s.SubdivisionID

--
--  v7: [PurchaseDB].[dbo].[WEB_Params_vw]
--

SELECT
    s.TID, 
    s.Name,
    s.MD
FROM
    dbo.DIC_Params_tb AS s

--
--  v7.1: [PurchaseDB].[dbo].[WEB_OrderParams_vw]
--

SELECT
    s.TID, 
    s.OrderID,
    s.ParamID,
    s.Login, 
    p.Name, 
    p.Code, 
    s.Value,
    p.MD,
    s.RD
FROM
    dbo.Params_tb AS s
    INNER JOIN dbo.DIC_Params_tb AS p ON p.TID=s.ParamID

--
--  v8: [PurchaseDB].[dbo].[WEB_Payments_vw]
--

SELECT
    s.TID, 
    s.Name
FROM
    dbo.DIC_Payments_tb AS s

--
--  v8.1: [PurchaseDB].[dbo].[WEB_OrderPayments_vw]
--

SELECT
    s.TID, 
    s.OrderID,
    s.PaymentID,
    s.Login, 
    p.Name  AS Purpose, 
    s.PaymentDate, 
    s.Total, 
    s.Tax, 
    s.Status,
    s.Currency,
    s.Comment,
    s.Rate,
    s.RD
FROM
    dbo.Payments_tb AS s
    INNER JOIN dbo.DIC_Payments_tb AS p ON p.TID=s.PaymentID

--
--  v8.2: [PurchaseDB].[dbo].[WEB_ReviewPayments_vw]
--

SELECT
    s.TID, 
    s.OrderID,
    o.SubdivisionID,
    o.Login         AS Author, 
    d.Name          AS Subdivision, 
    o.Article, 
    o.Currency      AS OrderCurrency, 
    o.Total         AS OrderTotal, 
    s.PaymentID,
    s.Login, 
    p.Name          AS Purpose,
    c.Name          AS Seller, 
    s.PaymentDate, 
    s.Total, 
    s.Total*s.Rate  AS TotalRub, 
    s.Tax, 
    s.Status,
    s.Currency,
    s.Rate,
    s.Comment,
    o.MD,
    s.RD
FROM
    dbo.Payments_tb AS s
    INNER JOIN dbo.Orders_tb AS o ON o.TID=s.OrderID
    INNER JOIN dbo.DIC_Payments_tb AS p ON p.TID=s.PaymentID
    LEFT OUTER JOIN dbo.DIC_Subdivisions_tb AS d ON d.TID=o.SubdivisionID
    LEFT OUTER JOIN ProvisionDB.dbo.DIC_Sellers_tb AS c ON c.TID=o.SellerID

--
--  v9: [PurchaseDB].[dbo].[WEB_Comments_vw]
--

SELECT
    s.TID, 
    s.Name
FROM
    dbo.DIC_Comments_tb AS s

--
--  v9.1: [PurchaseDB].[dbo].[WEB_OrderComments_vw]
--

SELECT
    s.TID, 
    s.OrderID,
    s.CommentID,
    s.Login, 
    p.Name  AS Author, 
    s.Note, 
    s.RD
FROM
    dbo.Comments_tb AS s
    INNER JOIN dbo.DIC_Comments_tb AS p ON p.TID=s.CommentID

--
--  v10: [PurchaseDB].[dbo].[WEB_OrderItems_vw]
--

SELECT
    s.TID, 
    s.OrderID,
    v.TID   AS VendorID,
    s.Login, 
    s.Name, 
    s.Qty, 
    s.Units, 
    s.Total, 
    s.Tax, 
    s.Currency,
    s.Account,
    v.Name  AS Vendor,
    s.RD
FROM
    dbo.Items_tb AS s
    LEFT OUTER JOIN dbo.DIC_Vendors_tb AS v ON v.TID=s.VendorID

--
--  v10.1: [PurchaseDB].[dbo].[WEB_OrderVendors_vw]
--

SELECT DISTINCT
    s.VendorID  AS TID,
    s.OrderID,
    s.Vendor    AS Name
FROM
    dbo.WEB_OrderItems_vw AS s
WHERE
    dbo.CHECK_IsEmpty_fn(s.Vendor) = 0

--
--  v11: [PurchaseDB].[dbo].[WEB_Authors_vw]
--

SELECT DISTINCT
    o.Login     AS Author,
FROM 
    dbo.Orders_tb as o

--
--  v12: [storage].[dbo].[WEB_OrderDocuments_vw]
--

SELECT
    d.TID, 
    d.UID, 
    d.OrderID,
    d.Login, 
    d.FileName, 
    d.FileSize,
    d.ContentType,
    case when d.Image is null then 0 else 1 end AS IsExist,
    d.Note,
    d.ForAudit,
    d.RD,
    d.MD
FROM
    dbo.OrderDocuments_tb AS d

--
--  v13: [PurchaseDB].[dbo].[WEB_OrderChanges_vw]
--

SELECT
    c.TID, 
    c.OrderID,
    c.Login, 
    c.Name, 
    c.Value,
    c.RD
FROM
    dbo.OrderChanges_tb AS c
    --INNER JOIN dbo.Orders_tb as o ON o.TID=c.OrderID

--
--  v14: [PurchaseDB].[dbo].[WEB_Categories_vw]
--

SELECT
    s.TID, 
    s.Name, 
    s.MD
FROM
    dbo.DIC_Categories_tb AS s

--
--  v15: [PurchaseDB].[dbo].[WEB_Schedule_vw]
--

SELECT
    o.TID       AS OrderID, 
    o.Author, 
    o.Price, 
    o.Status    AS OrderStatus, 
    o.RD        AS RegistryDate,
    r.TID       AS ReviewID, 
    r.Login     AS Reviewer, 
    r.Status    AS ReviewStatus, 
    d.Created,
    d.Approved,
    d.Paid,
    d.Delivered,
    d.ReviewDueDate,
    d.FinishDueDate,
    d.AuditDate,
    d.Validated,
    o.CategoryID, 
    o.SubdivisionID, 
    o.SubdivisionCode,
    o.StockListID,
    o.MD,
    r.RD        AS StatusDate
FROM
    dbo.Reviews_tb AS r
    RIGHT OUTER JOIN dbo.WEB_Orders_vw AS o ON o.TID=r.OrderID
    LEFT OUTER JOIN dbo.OrderDates_tb AS d ON o.TID=d.OrderID

--
--  v16: [PurchaseDB].[dbo].[WEB_Stocks_vw]
--

SELECT 
    s.TID, 
    s.Name, 
    s.Title, 
    s.ShortName,
    s.NodeLevel,
    s.NodeCode,
    s.RefCode1C,
    s.Params,
    s.Comment,
    s.EditedBy, 
    s.RD,
    s.Children,
    (select count(*) from dbo.Orders_tb o where o.StockListID=s.TID) as Orders
FROM
    ProvisionDB.dbo.DIC_StockList_tb AS s

--
--  v16.1: [PurchaseDB].[dbo].[WEB_StocksChildren_vw]
--

SELECT 
    s.TID, 
    s.Name, 
    s.Title, 
    s.ShortName,
    s.NodeLevel,
    s.NodeCode,
    s.RefCode1C,
    s.Comment,
    s.EditedBy, 
    s.RD,
    s.Children,
    (select count(*) from [dbo].Orders_tb o where o.StockListID in (
		select TID from ProvisionDB.dbo.DIC_StockList_tb where NodeCode like s.NodeCode+'%'
		)
	) as Orders
FROM
    ProvisionDB.dbo.DIC_StockList_tb AS s

--
--  v17: [PurchaseDB].[dbo].[WEB_Vendors_vw]
--

SELECT
    s.TID, 
    s.Name
FROM
    dbo.DIC_Vendors_tb AS s

--
--  v18: [PurchaseDB].[dbo].[BATCH_Sellers_vw]
--

SELECT DISTINCT 
    s.TID, 
    count(o.SellerID) as Orders,
    s.Name, 
    s.Title, 
    s.Address
FROM 
	ProvisionDB.dbo.DIC_Sellers_tb as s
	LEFT OUTER JOIN dbo.Orders_tb AS o ON s.TID=o.SellerID
GROUP BY s.TID, s.Name, s.Title, s.Address

--
--  v19: [PurchaseDB].[dbo].[WEB_Links_vw]
--

SELECT
    s.TID, 
    s.Name,
    s.MD
FROM
    dbo.DIC_Refers_tb AS s

--
--  v20: [PurchaseDB].[dbo].[WEB_OrderRefers_vw]
--

SELECT
    r.TID, 
    r.OrderID, 
    r.ReferID, 
    r.OrderReferID, 
    r.Login, 
    p.Name      AS ReferType, 
    o.Article   AS Name, 
    o.Qty, 
    o.Currency, 
    o.Total, 
    r.Note, 
    o.RD        AS RegistryDate,
    r.RD        AS ReferDate
FROM
    dbo.OrderRefers_tb AS r
    INNER JOIN dbo.DIC_Refers_tb AS p ON p.TID=r.ReferID
    INNER JOIN dbo.Orders_tb AS o ON o.TID=r.OrderReferID

--
--  v21: [PurchaseDB].[dbo].[WEB_Sectors_vw]
--

SELECT
    s.TID, 
    s.Name, 
    s.Code, 
    s.Manager,
    s.Name + ' (' + s.Manager + ')' AS FullName
FROM
    dbo.DIC_Sectors_tb AS s

--
--  v22: [PurchaseDB].[dbo].[WEB_ParamValues_vw]
--

SELECT DISTINCT
    p.ParamID,
    p.Value
FROM
    dbo.Params_tb AS p

--
--  v23: [PurchaseDB].[dbo].[WEB_Companies_vw]
--

SELECT DISTINCT
    p.OrderID,
    p.Value AS Name
FROM
    dbo.Params_tb AS p
    inner join dbo.DIC_Params_tb d on d.TID=p.ParamID
WHERE Name like 'Компания%'

--
--  v24: [PurchaseDB].[dbo].[WEB_Activities_vw]
--

SELECT
    s.TID, 
    s.Name,
    s.Code
FROM
    dbo.DIC_Activities_tb AS s
