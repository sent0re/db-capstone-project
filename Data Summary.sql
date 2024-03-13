use LittleLemondm;

-- Task 1
-- OrdersView that focuses on OrderID, Quantity and Cost columns within 
-- the Orders table for all orders with a quantity greater than 2

create view OrdersView as 
select OrderID, Quantity, TotalCost
from Orders
where Quantity > 2
order by Quantity desc; 

select * from OrdersView;
-- ____________________________________
-- Task 2
-- Little Lemon need information from four tables(Customers, Bookings, Orders, Menu and MenuItems) on all customers 
select c.CustomerID, concat(c.FirstName, " ", c.LastName) as FullName, o.OrderID, o.TotalCost, m.Cuisine as MenuName, i.ItemName as CourseName
from Customers c
inner join Bookings b using(CustomerID)
inner join Orders o using(BookingID)
inner join Menu m using(MenuID)
inner join MenuItems i using(ItemID)
order by o.TotalCost asc;

-- _________________________________________
-- Task 3
-- menu items for which more than 2 orders have been placed.
select Cuisine as MenuName 
from Menu where MenuID = any(select MenuID from Orders where Quantity > 2);
