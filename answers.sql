-- 1. transforming this table into **1NF**, ensuring that each row represents a single product for an order

CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255)
);

INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');

-- 2. transforming this table into **2NF** by removing partial dependencies. Ensure that each non-key column fully depends on the entire primary key.
-- 2.1 creating Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- 2.2 Creating OrdersDetails Table
CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- 2.3 Inserting into Orders (Customer info)
INSERT INTO Orders (OrderID, CustomerName) VALUES 
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');

-- 2.4 Inserting into OrderDetails (Product info)
INSERT INTO OrderDetails (OrderID, Product, Quantity) VALUES 
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);

-- 2.5 Querying the Normalized Data: To get full order details, use an INNER JOIN.

SELECT Orders.OrderID, Orders.CustomerName, OrderDetails.Product, OrderDetails.Quantity
FROM Orders
INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID;