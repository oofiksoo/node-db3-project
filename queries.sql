--- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT p.productName as "Product", c.categoryName as "Category"
FROM product p
JOIN category c
    ON p.CategoryId = c.Id;
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.id AS "Order ID", s.companyName AS "Shipper Name", o.OrderDate
FROM [order] o
JOIN shipper s
    ON o.ShipVia = s.id
WHERE (o.OrderDate < '2012-08-09');
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT p.productName AS "Product Name", od.Quantity
FROM [order]  o
JOIN orderDetail  od
    ON od.OrderId = o.id
JOIN product  p
    ON od.ProductId = p.id
WHERE o.id = 10521;
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.id AS "Order ID", c.companyName AS "Customer Company Name", e.lastName AS "Employee Last Name"
FROM [order]  o
JOIN customer c
    ON c.id = o.CustomerId
JOIN employee e
    ON e.id = o.EmployeeId;
-- Stretch

-- Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.

SELECT c.CategoryName, COUNT(c.categoryId) as "Count"
FROM categories c
JOIN products p
	ON p.categoryId = c.CategoryId
GROUP BY p.categoryId;
-- Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.

SELECT od.orderId, COUNT(od.orderId) as "OrderCount"
FROM orderDetails od
GROUP BY od.orderId;