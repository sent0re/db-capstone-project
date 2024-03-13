show databases;

use littlelemondm;

-- select * from bookings;

INSERT INTO Employees (EmployeeID, FullName, Role, Address, ContactNumber, AnnualSalary)
VALUES ('001', 'John Smith', 'Manager', '123 Main Street', '5551234567', 85000.00),
       ('002', 'Jane Doe', 'Waiter', '456 Elm Street', '5557890123', 45000.00),
       ('003', 'Michael Lee', 'Chef', '789 Maple Street', '5554567890', 60000.00);
       
select * from Employees;

INSERT INTO MenuItems (ItemID, ItemName, Type, Price)
VALUES (1, 'Spaghetti', 'Main Course', 12.99),
       (2, 'Lasagna', 'Main Course', 14.99),
       (3, 'Pizza', 'Main Course', 10.99),
       (4, 'Steak frites', 'Main Course', 18.99),
       (5, 'Ratatouille', 'Main Course', 15.99),
       (6, 'Pad Thai', 'Main Course', 13.99);
       
select * from MenuItems;

INSERT INTO Menu (MenuID, ItemID, Cuisine)
VALUES (1,1, 'Italian'),
       (2,2, 'Italian'),
       (3,3, 'Italian'),
       (4,4, 'French'),
       (5,5, 'French'),
       (6,6, 'Thai');
       
       
select * from Menu;

INSERT INTO Customers (CustomerID, FirstName, LastName, ContactNumber, Address)
VALUES (1, 'Alice', 'Johnson', '5555551212', '100 Oak Street'),
       (2, 'Bob', 'Williams', '5555552323', '200 Elm Street'),
       (3, 'Charlie', 'Brown', '5555553434', '300 Maple Street');
       
select * from Customers;

INSERT INTO Bookings (BookingID, BookingDate,TableNumber, NumberOfGuests, CustomerID, EmployeeID)
VALUES (1, '2024-03-13', 4, 2, 1, '002'),
       (2, '2024-03-14', 5, 4, 2, '001'),
       (3, '2024-03-15',3, 6, 3, '003');
       
select * from Bookings;

-- INSERT INTO Orders (OrderID, BookingID, OrderDate, OrderTime, Status)
-- VALUES (1, 1, '2024-03-13', '18:30:00', 'Placed'),
--        (2, 2, '2024-03-14', '19:30:00', 'Completed'),
--        (3, 3, '2024-03-15', '20:15:00', 'In Progress');
       
       
INSERT INTO OrderDeliveryStatus (StatusID, DeliveryDate, DeliveryStatus)
VALUES (1, '2024-03-13', 'Preparing'),
       (2, '2024-03-13', 'Ready for Pick-Up'), 
       (3, '2024-03-14', 'Food Delivered'),  
       (4, '2024-03-15', 'Preparing Food');
       
select * from OrderDeliveryStatus;

INSERT INTO Orders (OrderID, OrderDate, TotalCost, MenuID, BookingID, Quantity, StatusID)
VALUES (1, '2024-03-13', 45.00, 1, 1, 5, 4),
	   (2, '2024-03-14', 23.50, 3, 2, 2, 1),
	   (3, '2024-03-15', 29.99, 2, 3, 3, 3);
       
select * from Orders;



