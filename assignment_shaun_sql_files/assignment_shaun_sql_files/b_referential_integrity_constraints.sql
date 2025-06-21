check these are in my tables already but do not include in file 1

-- Manufacturer ↔ Product
ALTER TABLE Product
ADD CONSTRAINT fk_Product_Manufacturer
FOREIGN KEY (ManufacturerID) REFERENCES Manufacturer(ManufacturerID)
ON DELETE CASCADE;

-- Product ↔ Category (via ProductCategory)
ALTER TABLE ProductCategory
ADD CONSTRAINT fk_ProductCategory_Product
FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
ON DELETE CASCADE;

ALTER TABLE ProductCategory
ADD CONSTRAINT fk_ProductCategory_Category
FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
ON DELETE CASCADE;

-- Product ↔ Tags (via ProductTags)
ALTER TABLE ProductTags
ADD CONSTRAINT fk_ProductTags_Product
FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
ON DELETE CASCADE;

ALTER TABLE ProductTags
ADD CONSTRAINT fk_ProductTags_Tag
FOREIGN KEY (TagID) REFERENCES Tags(TagID)
ON DELETE CASCADE;

-- Product ↔ Dimensions (via ProductDimensions)
ALTER TABLE ProductDimensions
ADD CONSTRAINT fk_ProductDimensions_Product
FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
ON DELETE CASCADE;

ALTER TABLE ProductDimensions
ADD CONSTRAINT fk_ProductDimensions_Dimension
FOREIGN KEY (DimensionID) REFERENCES Dimensions(DimensionID)
ON DELETE CASCADE;

-- Customer ↔ Order
ALTER TABLE `Order`
ADD CONSTRAINT fk_Order_Customer
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
ON DELETE CASCADE;

-- Order ↔ OrderStatus
ALTER TABLE `Order`
ADD CONSTRAINT fk_Order_OrderStatus
FOREIGN KEY (OrderStatusID) REFERENCES OrderStatus(OrderStatusID)
ON DELETE SET NULL;

-- Order ↔ OrderDetails
ALTER TABLE OrderDetails
ADD CONSTRAINT fk_OrderDetails_Order
FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID)
ON DELETE CASCADE;

ALTER TABLE OrderDetails
ADD CONSTRAINT fk_OrderDetails_Product
FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
ON DELETE CASCADE;

-- Customer ↔ Feedback
ALTER TABLE Feedback
ADD CONSTRAINT fk_Feedback_Customer
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
ON DELETE CASCADE;

-- Product ↔ Feedback
ALTER TABLE Feedback
ADD CONSTRAINT fk_Feedback_Product
FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
ON DELETE CASCADE;
