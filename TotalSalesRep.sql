SELECT
	e.employeeNumber,
    e.lastname,
    e.firstName,
    e.jobTitle,
    SUM(od.priceEach * od.quantityOrdered) AS totalSalesRep
FROM
	mintclassics.employees AS e
LEFT JOIN
	mintclassics.customers AS c ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN
	mintclassics.orders AS o ON c.customerNumber = c.customerNumber
LEFT JOIN
	mintclassics.orderdetails AS od ON o.orderNumber = od.orderNumber
GROUP BY
	e.employeeNumber, e.lastname, e.firstname, e.jobTitle
ORDER BY
	totalSalesRep DESC
    