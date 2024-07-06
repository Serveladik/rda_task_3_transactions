USE ShopDB;

INSERT INTO Products (Name, Description, Price, WarehouseAmount) 
VALUES ('AwersomeProduct', 'This is an awesome product', 9999, 100);

INSERT INTO Customers (FirstName, LastName, Email, Address) 
VALUES ('John', 'Doe', 'john.doe@example.com', '123 Elm Street');

START TRANSACTION;

INSERT INTO Orders (CustomerID, Date) 
VALUES (1, '2023-01-01');

SET @OrderID = LAST_INSERT_ID();

INSERT INTO OrderItems (OrderID, ProductID) 
VALUES (@OrderID, 1);

UPDATE Products 
SET WarehouseAmount = WarehouseAmount - 1 
WHERE ID = 1;

COMMIT;

SELECT * FROM Orders;
SELECT * FROM OrderItems;
SELECT * FROM Products;