SELECT 
	productCode,
    productName,
    quantityInStock,
    totalOrdered,
    (quantityInStock - totalOrdered) AS inventoryShortage
FROM 
	(
		SELECT
			p.productCode,
            p.productName,
            p.quantityInStock,
            SUM(od.quantityOrdered) AS totalOrdered
		FROM
			mintclassics.products AS p
		LEFT JOIN
			mintclassics.orderDetails as od ON p.productCode = od.productCode
		GROUP BY
			p.productCode,
            p.productName,
            p.quantityInStock
	) AS inventory_data
WHERE
	(quantityInStock - totalOrdered) > 0
ORDER BY
	inventoryShortage DESC;







#SELECT productCode, count(orderdetails.orderNumber) as total_orders, sum(quantityOrdered) as total_sold, MIN(orders.orderDate) as min_date, MAX(orders.orderDate) as maxDate
#FROM mintclassics.orderdetails
#INNER JOIN mintclassics.orders 
#ON orderdetails.orderNumber = orders.orderNumber
#WHERE maxDate - minDate = dateRange AND orderdetails.orderNumber / dateRange
#GROUP BY productCode
#HAVING STR >= AVG(STR)
#ORDER BY STR DESC