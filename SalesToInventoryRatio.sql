SELECT
	p.productLine,
    pl.textDescription AS productLineDescriptions,
    SUM(p.quantityINStock) AS totalInventory,
    SUM(od.quantityOrdered) AS totalSales,
    SUM(od.priceEach * od.quantityOrdered) AS totalRevenue,
    (SUM(od.quantityOrdered) / SUM9p.quantityInStock)) * 100 AS salesToInventoryPercentage
FROM 
	mintclassics.products AS p
LEFT JOIN
	mintclassics.productlines AS pl ON p.productLine = pl.productLine
LEFT JOIN
	mintclassics.orderdetails AS od ON p.productCode = od.productCode
GROUP BY
	p.productLine, pl.textDescription
ORDER BY
	salesToInventoryPercentage DESC