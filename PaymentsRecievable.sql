SELECT
	c.customerNumber,
    c.customerName,
    p.paymentDate,
    p.amount AS paymentAmount
FROM
	mintclassics.customers AS c
LEFT JOIN
	mintclassics.payments AS p ON c.customerNumber = p.customerNumber
ORDER BY
	paymentAmount DESC