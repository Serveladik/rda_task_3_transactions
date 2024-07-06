CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Products (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    Description VARCHAR(100),
    Price INT,
    WarehouseAmount INT,
    PRIMARY KEY (ID)
);

CREATE TABLE Customers (
    ID INT AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(50),
    Address VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Orders (
    ID INT AUTO_INCREMENT,
    CustomerID INT, 
    Date DATE,
    PRIMARY KEY (ID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(ID) ON DELETE SET NULL
);

CREATE TABLE OrderItems (
    ID INT AUTO_INCREMENT,
    OrderID INT, 
    ProductID INT, 
    Count INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (OrderID) REFERENCES Orders(ID) ON DELETE SET NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE SET NULL
);

INSERT INTO Products (Name, Description, Price, WarehouseAmount)
    VALUES ("AwersomeProduct", "Product Description", 5, 42);

INSERT INTO Customers (FirstName, LastName, Email, Address)
    VALUES ("John", "Dou", "j@dou.ua", "far, far away");

START TRANSACTION;

SET @Quantity = 1;

INSERT INTO Orders (CustomerID, Date) 
VALUES (1, "2023-01-01");

SET @OrderID = LAST_INSERT_ID();

INSERT INTO OrderItems (OrderID, ProductID, Count) 
VALUES (@OrderID, 1, @Quantity);

UPDATE Products 
SET WarehouseAmount = WarehouseAmount - @Quantity 
WHERE ID = 1;

COMMIT;

SELECT * FROM Orders;
SELECT * FROM OrderItems;
SELECT * FROM Products;