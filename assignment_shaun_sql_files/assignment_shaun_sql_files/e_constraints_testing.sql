-- Not Null Constraints test
-- Manufacturer Table
-- This test attempts to insert a row into manufacturer with the ManufacturerName NULL.
INSERT INTO Manufacturer (ManufacturerName, RegistrationDate, Address, Website)
VALUES (NULL, '2023-09-01', '123 xxx, London, SW1C 1CC', 'https://xxx.co.uk');
-- This test, if the code is correct, should fail because ManufacturerName cannot be NULL.


-- Customer Table
-- This test tries to enter a customername as null which is against the constraint.
INSERT INTO Customer (CustomerName, PhoneNumber, CustomerPoints)
VALUES (NULL, '+44 123 456 7890', 10);
-- -- This test, if the code is correct, should fail because CustomerName cannot be NULL.


-- Default Values
-- Customer Table
-- This test tries the scenario of entering no value for CustomerPoints.
INSERT INTO Customer (CustomerName, PhoneNumber)
VALUES ('xxxx', '+44 777 123 4567');
-- -- This test, if the code is correct, should insert CustomerPoints as 0 by default.


-- Cascading Deletes
-- Delete Manufacturer and Check Cascade in Product Table
-- This test tries to delete Manufacturer with an ID of 1 to test if the update cascades through to product
DELETE FROM Manufacturer WHERE ManufacturerID = 1;
-- -- This test, if the code is correct, should delete all products linked to ManufacturerID 1 in the Product table.


-- Delete Product and Check Cascade in ProductCategory Table
-- This test is the same as above but for Product.
DELETE FROM Product WHERE ProductID = 1;
-- -- This test, if the code is correct, should delete the associated rows in ProductCategory table for ProductID 1.


-- Foreign Key Constraints
-- Product Table
-- This test tries to insert a product with a ManufacturerID 12345
INSERT INTO Product (ProductName, ProductDescription, Price, StockQuantity, DiscountedPrice, LaunchDate, ManufacturerID, CategoryID)
VALUES ('xxxx', 'xxxx', 100.00, 10, NULL, '2023-10-01', 12345, 1);
-- -- This test, if the code is correct, should fail because ManufacturerID 12345 does not exist in Manufacturer table.


-- ManufacturerContactDetails Table
-- This test uses ManufacturerID 12345 again to see if there's any contact details for this non existant Manufacturer
INSERT INTO ManufacturerContactDetails (ManufacturerID, ContactID)
VALUES (12345, 1);
-- -- This test, if the code is correct, should fail because ManufacturerID 12345 does not exist.


-- Set NULL on Foreign Key
-- OrderStatus Table
-- This test tries another delete cascade
DELETE FROM OrderStatus WHERE OrderStatusID = 1;
-- -- This test, if the code is correct, should set OrderStatusID to NULL for all orders with OrderStatusID 1.


-- Primary Key and Auto-Increment Constraints
-- Manufacturer Table (Auto-Increment and Primary Key)
-- This test tries to make a ManufacturerID of 1 which already exists and shouldn't be allowed.
INSERT INTO Manufacturer (ManufacturerID, ManufacturerName, RegistrationDate, Address, Website)
VALUES (1, 'xxxx', '2019-01-01', '456 Shaun Street, London, SHA! 1BB', 'https://xxxx.co.uk');
-- -- This test, if the code is correct, should fail because ManufacturerID 1 already exists.


-- Check Constraints
-- Product Table (StockQuantity >= 0)
-- This test is trying to enter negative stock which shouldn't be allowed.
INSERT INTO Product (ProductName, ProductDescription, Price, StockQuantity, DiscountedPrice, LaunchDate, ManufacturerID, CategoryID)
VALUES ('xxxxxxxxx', 'xxxxxxx', 200.00, -5, NULL, '2019-10-01', 1, 1);
-- -- This test, if the code is correct, should fail because StockQuantity cannot be negative.


-- Feedback Table (Rating BETWEEN 1 AND 5)
-- This test is test that the rating constraint has been enforced
INSERT INTO Feedback (Rating, Comments, FeedbackDate, OverallExperience, ExperienceComments, ProductID, CustomerID)
VALUES (10, 'Test', '2024-12-25', 3, 'xxxx.', 1, 1);
-- -- This test, if the code is correct, should fail because Rating is outside the range 1-5.


-- Composite Primary Key Constraints
-- ManufacturerContactDetails Table
-- This test is trying to add a ManufacturerID/ ContactID pairing that already exists which shouldn't be allowed
INSERT INTO ManufacturerContactDetails (ManufacturerID, ContactID)
VALUES (1, 1);
-- -- This test, if the code is correct, should fail because the combination of ManufacturerID and ContactID already exists.

