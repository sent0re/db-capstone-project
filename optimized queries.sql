use LittleLemondm;
-- _____________________________________________
-- Task 1
-- Creating a procedure 
-- that displays the maximum ordered quantity in the Orders table.

create procedure GetMaxQuantity()
select max(Quantity) as "Max Quantity in Order"
from Orders;

call GetMaxQuantity();

-- ____________________________________________
-- Task 2
-- Creating prepared statement called GetOrderDetail that  returns the 
-- order id, the quantity and the order cost from the Orders table
-- and using id as a variable to execute the statement


prepare GetOrderDetail from
'select o.OrderID, o.Quantity, o.TotalCost 
from Customers c
inner join Bookings b using(CustomerID) 
inner join Orders o using(BookingID) 
where c.CustomerID = ?';

set @id = 1;
execute GetOrderDetail using @id;

-- _________________________________________________
-- Task 3
-- Creating CancelOrder procedure and display message that says "order cancelled"
delimiter //
create procedure CancelOrder(in Id int)
begin
delete from Orders 
where OrderID = Id;
select 'order cancelled' as message;
end //

delimiter ;

call CancelOrder(2);