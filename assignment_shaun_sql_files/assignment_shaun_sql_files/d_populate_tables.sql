-- Manufacturer Table
INSERT INTO Manufacturer (ManufacturerName, RegistrationDate, Address, Website)
VALUES 
('Shauny Cycles', '2000-11-24', '123 Mayweather, London, SW1A 1AA', 'https://shauncycles.co.uk'),
('Gareth Bikes', '2022-12-01', '45 Gareth Lane, Manchester, M1 111', 'https://garethbikes.co.uk'),
('Gaynorfied', '2022-03-29', '78 Wonderscope, Birmingham, B2 G81', NULL),
('Adamtastic', '2025-01-01', '321, Cardiff, CF10 1DD', 'https://adamstastic.co.uk');

-- ContactDetails Table
INSERT INTO ContactDetails (ContactType, ContactValue)
VALUES 
('Email', 'support@shauncycles.co.uk'),
('Phone', '+44 70770553'),
('Email', 'infoworld@garethbikes.co.uk'),
('Phone', '+44 12345678');

-- ManufacturerContactDetails Table
INSERT INTO ManufacturerContactDetails (ManufacturerID, ContactID)
VALUES 
(1, 1),
(1, 2),
(2, 3),
(4, 4);

-- Category Table
INSERT INTO Category (CategoryName, CategoryDescription)
VALUES 
('Road Bikes', 'High-performance bikes designed for road cycling.'),
('Mountain Bikes', 'Durable bikes built for off-road terrains.'),
('Hybrid Bikes', 'Versatile bikes suitable for both road and trails.'),
('Mystical Bikes', 'The bikes are the hidden gem of the store - magic bikes.');

-- Product Table
INSERT INTO Product (ProductName, ProductDescription, Price, StockQuantity, DiscountedPrice, LaunchDate, ManufacturerID, CategoryID)
VALUES 
('Masterful 3000', 'A road bike.', 1299.99, 50, 1199.99, '2023-04-01', 1, 1),
('Fail Nay-ser', 'A mountain bike.', 999.99, 30, NULL, '2023-05-15', 2, 2),
('Scary ether', 'A hybrid bike.', 799.99, 40, 749.99, '2023-06-20', 3, 3),
('Magic Mark', 'A high-quality cycling helmet.', 59.99, 100, 49.99, '2023-07-01', 4, 4);

-- ProductCategory Table
INSERT INTO ProductCategory (ProductID, CategoryID)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Tags Table
INSERT INTO Tags (TagName)
VALUES 
('Lightweight'),
('Durable'),
('Eco-Friendly'),
('Magical');

-- ProductTags Table
INSERT INTO ProductTags (ProductID, TagID)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Dimensions Table
INSERT INTO Dimensions (ProductLength, ProductWidth, ProductHeight)
VALUES 
(6.50, 9.50, 12.00),
(20.00, 7.70, 5.30),
(80.50, 100.50, 111.00),
(123.90, 120.65, 1201.25);

-- ProductDimensions Table
INSERT INTO ProductDimensions (ProductID, DimensionID)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Customer Table
INSERT INTO Customer (CustomerName, PhoneNumber, CustomerPoints)
VALUES 
('Dafydd Jones', '+44 123 456 7890', 50),
('Carys Williams', '+44 987 654 3210', 100),
('Rhys Morgan', '+44 123 123 4567', 75),
('Sian Evans', '+44 444 444 6543', 60);

-- OrderStatus Table
INSERT INTO OrderStatus (StatusName, OrderStatusDescription)
VALUES 
('Pending', 'Waiting confirmation.'),
('Confirmed', 'The Order has been confirmed.'),
('Shipped', 'Shipped!!.'),
('Delivered', 'Delivered!!!!.');

-- Order Table
INSERT INTO `Order` (CustomerID, OrderDate, ShippingDate, OrderStatusID, TotalAmount)
VALUES 
(1, '2023-08-15', '2024-06-21', 3, 1299.99),
(2, '2023-08-16', '2024-01-01', 4, 999.99),
(3, '2023-08-17', '2025-01-02', 2, 799.99),
(4, '2023-08-18', '2025-01-03', 1, 59.99);

-- OrderDetails Table
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES 
(1, 1, 1, 1299.99),
(2, 2, 1, 999.99),
(3, 3, 1, 799.99),
(4, 4, 1, 59.99);

-- Feedback Table
INSERT INTO Feedback (Rating, Comments, FeedbackDate, OverallExperience, ExperienceComments, ProductID, CustomerID)
VALUES 
(5, 'Cynnyrch rhagorol, cadarn iawn!', '2023-08-20', 5, 'Pryniant gorau erioed.', 1, 1),
(4, 'Ansawdd da ond ychydig yn ddrud.', '2023-08-21', 4, 'Boddhaol iawn.', 2, 2),
(3, 'Profiad cyffredin.', '2023-08-22', 3, 'Gallai fod yn well.', 3, 3),
(5, 'Amazingly lightweight, the flight was the best part!', '2023-08-23', 5, 'Terrific :).', 4, 4);
