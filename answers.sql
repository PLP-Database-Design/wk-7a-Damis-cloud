--Transformed Table in 1NF (eliminating the multi-valued Products column by ensuring each product has its own row.)
| OrderID | CustomerName | Product   |
|---------|---------------|-----------|
| 101     | John Doe      | Laptop    |
| 101     | John Doe      | Mouse     |
| 102     | Jane Smith    | Tablet    |
| 102     | Jane Smith    | Keyboard  |
| 102     | Jane Smith    | Mouse     |
| 103     | Emily Clark   | Phone     |
-- Select the first product for OrderID 101 (John Doe's order)
SELECT 101 AS OrderID, 'John Doe' AS CustomerName, 'Laptop' AS Product
UNION ALL
-- Select the second product for OrderID 101 (John Doe's order)
SELECT 101, 'John Doe', 'Mouse'
UNION ALL
-- Select the first product for OrderID 102 (Jane Smith's order)
SELECT 102, 'Jane Smith', 'Tablet'
UNION ALL
-- Select the second product for OrderID 102 (Jane Smith's order)
SELECT 102, 'Jane Smith', 'Keyboard'
UNION ALL
-- Select the third product for OrderID 102 (Jane Smith's order)
SELECT 102, 'Jane Smith', 'Mouse'
UNION ALL
-- Select the first product for OrderID 103 (Emily Clark's order)
SELECT 103, 'Emily Clark', 'Phone';

 -- Select the first product for OrderID 101 (John Doe's order)
 --  | OrderID | CustomerName |
-- |---------|--------------|
-- | 101     | John Doe     |
-- | 102     | Jane Smith   |
-- | 103     | Emily Clark  |

-- | OrderID | Product  | Quantity |
-- |---------|----------|----------|
-- | 101     | Laptop   | 2        |
-- | 101     | Mouse    | 1        |
-- | 102     | Tablet   | 3        |
-- | 102     | Keyboard | 1        |
-- | 102     | Mouse    | 2        |
-- | 103     | Phone    | 1        |

     -- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);
--  Insert data into the Orders table
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName

  -- Create the OrderDetails table
  CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert data into the OrderDetails table
INSERT INTO OrderDetails (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;
