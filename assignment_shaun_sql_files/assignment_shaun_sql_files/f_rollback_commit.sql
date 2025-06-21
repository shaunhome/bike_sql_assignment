-- Commit
START TRANSACTION; -- Begin the transaction

-- Insert a new order
INSERT INTO `Order` (CustomerID, OrderDate, ShippingDate, OrderStatusID, TotalAmount)
VALUES (1, '2023-12-01', '2023-12-05', 2, 1999.98);

-- Get the last inserted OrderID for linking with OrderDetails
SET @OrderID = LAST_INSERT_ID();

-- Insert products into OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES (@OrderID, 1, 1, 1299.99), -- Product 1
       (@OrderID, 2, 1, 699.99); -- Product 2

-- Update stock quantities for purchased products
UPDATE Product
SET StockQuantity = StockQuantity - 1
WHERE ProductID IN (1, 2);

-- Update customer points
UPDATE Customer
SET CustomerPoints = CustomerPoints + 20
WHERE CustomerID = 1;

-- Commit the transaction to finalise all changes
COMMIT;

DELIMITER //

CREATE PROCEDURE PlaceOrderWithStockCheck(
    IN customer_id INT,
    IN product_id INT,
    IN quantity INT,
    IN order_date DATE,
    IN shipping_date DATE,
    IN order_status INT,
    IN total_amount DECIMAL(10,2)
)
BEGIN
    DECLARE stock_available INT;

    -- Start the transaction
    START TRANSACTION;

    -- Check stock availability
    SELECT StockQuantity INTO stock_available
    FROM Product
    WHERE ProductID = product_id;

    IF stock_available < quantity THEN
        -- Insufficient stock, rollback transaction
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Insufficient stock for the requested product.';
    ELSE
        -- Insert order
        INSERT INTO `Order` (CustomerID, OrderDate, ShippingDate, OrderStatusID, TotalAmount)
        VALUES (customer_id, order_date, shipping_date, order_status, total_amount);

        -- Get the last inserted OrderID for linking with OrderDetails
        SET @OrderID = LAST_INSERT_ID();

        -- Insert order details
        INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
        VALUES (@OrderID, product_id, quantity, total_amount / quantity);

        -- Update stock quantities
        UPDATE Product
        SET StockQuantity = StockQuantity - quantity
        WHERE ProductID = product_id;

        -- Commit the transaction
        COMMIT;
    END IF;
END //

DELIMITER ;

-- Example Execution:
CALL PlaceOrderWithStockCheck(2, 3, 2, '2023-12-02', '2023-12-06', 1, 500.00);

