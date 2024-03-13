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

-- _______________________________________________
-- Booking system for Little Lemon
-- Task 1
-- create a stored procedure called CheckBooking to check whether a table 
-- in the restaurant is already booked

CREATE PROCEDURE CheckBooking(IN bookingdate DATE, IN tablenbr INT)
SELECT 
  CASE 
    WHEN COUNT(*) > 0 THEN 'Table is already booked'
    ELSE 'Table is available'
  END AS BookingStatus
FROM Bookings
WHERE BookingDate = bookingdate AND TableNumber = tablenbr;

CALL  CheckBooking("2024-03-13", 3); 

-- ______________________________________________________________________
-- Creating insert, update and delete procedures on little lemon bookings table
-- Task 1
-- Creating insert procedure
delimiter //
create procedure AddBooking(BookingId int, bookingdate date, tablenbr int, customerId int)
insert into Bookings(BookingID, BookingDate, TableNumber, CustomerID)
values(BookingId, bookingdate, tablenbr, customerId);
select "New booking added" as Confirmation;
end//
delimiter ;

-- ___________________________________________________________________________
-- Task 2 
-- Creating update procedure
delimiter //
create procedure UpdateBooking(BookingId int, bookingdate date)
insert into Bookings(BookingID, BookingDate)
values(BookingId, bookingdate);
select "Booking updated" as Confirmation;
end //
delimiter ;

-- ___________________________________________________________________________
-- Task 3 
-- Creating update procedure
