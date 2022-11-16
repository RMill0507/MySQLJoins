/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
select p.name as productname, c.name as categoryname
from products as p -- alias for products
inner join categories as c -- alias for categories
on c.categoryid = p.categoryid
where c.name = 'computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 select p.Name, p.Price, r.Rating from products as p -- p is the alias for products
 inner join reviews as r on r.ProductID = p.ProductID -- we join through the Product ID column
 where r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.Firstname, e.lastname, Sum(s.Quantity) as total
from sales as s
inner join employees as e on e.EmployeeID = s.EmployeeID
group by e.EmployeeID
order by total desc
limit 3;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.name as 'Department name', c.name as 'Category name' from departments as d
inner join categories as c on c.DepartmentID = d.DepartmentID
where c.name = 'Appliances' or c.name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 select p.name, sum(s.quantity) as 'Total Sold', sum(s.quantity * s.pricePerUnit) as 'Total Price' -- giving names for total sold and total price and summing both
from products as p
inner join sales as s on s.ProductID = p.ProductID -- inner join means connect ProductID from sales and ProductID from products
where p.productid = 97; -- specify which product we are talking about. Hotel California which is 97 in products
 -- to verify its 97
 select * from sales where productID = 97;
 
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select p.name, r.reviewer, r.rating, r.Comment from products as p
inner join reviews as r on r.ProductID = p.ProductID -- linking columns bewteen reviews and productsreviews
where p.ProductID = 857 and r.rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name -- only exists on employee table
-  the name of each product -- only can get it from products table
-  and how many of that product they sold */ -- only get it from sales table
select e.employeeid, e.firstname, e.lastname, p.name, sum(s.quantity) as TotalSold -- sum up the quantity
from sales as s
inner join employees as e on e.EmployeeID = s.EmployeeID -- joining employees table and sales
inner join products as p on p.ProductID = s.ProductID -- joining products table to sales
group by e.EmployeeID, p.ProductID;
