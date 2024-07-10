USE ShopDB;

INSERT INTO Products (Name, Description, Price, WarehouseAmount)
    VALUES ("AwersomeProduct", "Product Description", 5, 42);

INSERT INTO Customers (FirstName, LastName, Email, Address)
    VALUES ("John", "Dou", "j@dou.ua", "far, far away");

INSERT INTO Orders (CustomerID, Date) 
VALUES (1, "2023-01-01");

SET @OrderID = LAST_INSERT_ID();

START TRANSACTION;

SET @Quantity = 1;

INSERT INTO OrderItems (OrderID, ProductID, Count) 
VALUES (@OrderID, 1, @Quantity);

UPDATE Products 
SET WarehouseAmount = WarehouseAmount - @Quantity 
WHERE ID = 1;

COMMIT;
