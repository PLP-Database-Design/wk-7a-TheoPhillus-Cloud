-- Step 1: Creating Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Step 2: Creating Product Table
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100)
);

-- Step 3: Creating OrderDetails Table
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Step 4: Inserting Customer Data into Orders Table
INSERT INTO Orders (OrderID, CustomerName) 
VALUES (101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 5: Inserting Product Data into Product Table
INSERT INTO Product (ProductID, ProductName) 
VALUES (1, 'Laptop'),
(2, 'Mouse'),
(3, 'Tablet'),
(4, 'Keyboard'),
(5, 'Phone');

-- Step 6: Inserting Order Details into OrderDetails Table
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) 
VALUES (101, 1, 2),
(101, 2, 1),
(102, 3, 3),
(102, 4, 1),
(102, 2, 2),
(103, 5, 1);

-- Step 7: Querying Full Order Details
SELECT Orders.OrderID, Orders.CustomerName, Product.ProductName, OrderDetails.Quantity
FROM Orders
INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
INNER JOIN Product ON OrderDetails.ProductID = Product.ProductID;