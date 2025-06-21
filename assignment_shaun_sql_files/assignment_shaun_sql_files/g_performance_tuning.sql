-- Indexes for Product Searches
CREATE INDEX idx_ProductName ON Product (ProductName); 
-- Speeds up searches by product name select for index. The product name is the main attribute across the platform
CREATE INDEX idx_CategoryID ON Product (CategoryID); 
-- Optimises filtering by category as users will likely use this option regularly

-- Indexes for Order Lookups
CREATE INDEX idx_CustomerID ON `Order` (CustomerID); 
-- looking up by customer seems to be a useful tool in any business, this will be useful
CREATE INDEX idx_OrderDate ON `Order` (OrderDate); 
-- This will be useful in order to filter effiently on a popular attribute; OrderDate
