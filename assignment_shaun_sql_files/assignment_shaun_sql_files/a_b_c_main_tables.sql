-- Manufacturer Table
CREATE TABLE IF NOT EXISTS Manufacturer ( -- Creates the table if not already present
    ManufacturerID INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for manufacturers, auto increments
    ManufacturerName VARCHAR(255) NOT NULL, -- Manufacturer's name. Not null means the attribute value cannot be empty
    RegistrationDate DATE NOT NULL, -- Date (formatted as a date) of registration onto AdventureWorks Cycles database
    Address VARCHAR(255), -- Address of the manufacturer 
    Website VARCHAR(255) -- Manufacturer's website
);

-- ContactDetails Table
CREATE TABLE IF NOT EXISTS ContactDetails ( -- Same as previous line in previous table
    ContactID INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for contact details
    ContactType VARCHAR(50), -- Type of contact (e.g., any contact type but typically email, phone.)
    ContactValue VARCHAR(255) -- The data associated with the contact type (e.g, a phone number for the type phone)
);

-- ManufacturerContactDetails Table
CREATE TABLE IF NOT EXISTS ManufacturerContactDetails ( -- Same as previous line in previous table
    ManufacturerID INT NOT NULL, -- Foreign Key to Manufacturer (the Primary Key for the mentioned table is used here again as a Foreign Key)
    ContactID INT NOT NULL, -- Foreign Key to ContactDetails (the Primary Key for the mentioned table is used here again as a Foreign Key)
    PRIMARY KEY (ManufacturerID, ContactID), -- Composite Primary Key
    FOREIGN KEY (ManufacturerID) REFERENCES Manufacturer(ManufacturerID),
    FOREIGN KEY (ContactID) REFERENCES ContactDetails(ContactID)
);

-- Category Table
CREATE TABLE IF NOT EXISTS Category ( -- Same as previous line in previous table
    CategoryID INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for categories
    CategoryName VARCHAR(255) NOT NULL, -- Category name
    CategoryDescription VARCHAR(255) -- Description of what the category is
);

-- Product Table
CREATE TABLE IF NOT EXISTS Product ( -- Same as previous line in previous table
    ProductID INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for products
    ProductName VARCHAR(255) NOT NULL, -- Product name
    ProductDescription VARCHAR(255), -- Description of what the product is
    Price DECIMAL(10,2) NOT NULL, -- Product price
    StockQuantity INT NOT NULL CHECK (StockQuantity >= 0), -- Non-negative stock by using check
    DiscountedPrice DECIMAL(10,2), -- Discounted price
    LaunchDate DATE, -- Launch date of said product
    ManufacturerID INT NOT NULL, -- Foreign Key to Manufacturer
    CategoryID INT NOT NULL, -- Foreign Key to Category
    FOREIGN KEY (ManufacturerID) REFERENCES Manufacturer(ManufacturerID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- ProductCategory Table
CREATE TABLE IF NOT EXISTS ProductCategory ( -- Same as previous line in previous table
    ProductID INT, -- Foreign Key to Product
    CategoryID INT, -- Foreign Key to Category
    PRIMARY KEY (ProductID, CategoryID), -- Composite Primary Key
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- Tags Table
CREATE TABLE IF NOT EXISTS Tags ( -- Same as previous line in previous table
    TagID INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for tags
    TagName VARCHAR(255) NOT NULL -- Name of the tag
);

-- ProductTags Table
CREATE TABLE IF NOT EXISTS ProductTags ( -- Same as previous line in previous table
    ProductID INT NOT NULL, -- Foreign Key to Product
    TagID INT NOT NULL, -- Foreign Key to Tags
    PRIMARY KEY (ProductID, TagID), -- Composite Primary Key
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (TagID) REFERENCES Tags(TagID)
);

-- Dimensions Table
CREATE TABLE IF NOT EXISTS Dimensions ( -- Same as previous line in previous table
    DimensionID INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for dimensions
    ProductLength DECIMAL(10,2), -- Length of the product. 
    ProductWidth DECIMAL(10,2), -- Width of the product
    ProductHeight DECIMAL(10,2) -- Height of the product
);

-- ProductDimensions Table
CREATE TABLE IF NOT EXISTS ProductDimensions ( -- Same as previous line in previous table
    ProductID INT NOT NULL, -- Foreign Key to Product
    DimensionID INT NOT NULL, -- Foreign Key to Dimensions
    PRIMARY KEY (ProductID, DimensionID), -- Composite Primary Key
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (DimensionID) REFERENCES Dimensions(DimensionID)
);

-- Customer Table
CREATE TABLE IF NOT EXISTS Customer ( -- Same as previous line in previous table
    CustomerID INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for customers
    CustomerName VARCHAR(255) NOT NULL, -- Customer's name
    PhoneNumber VARCHAR(20), -- Customer's phone number
    CustomerPoints INT DEFAULT 0 -- Customers can gain points by using this attribute
);

-- OrderStatus Table
CREATE TABLE IF NOT EXISTS OrderStatus ( -- Same as previous line in previous table
    OrderStatusID INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each order status
    StatusName VARCHAR(255) NOT NULL, -- Name of the status
    OrderStatusDescription VARCHAR(255) -- Description of the status
);

-- Order Table
CREATE TABLE IF NOT EXISTS `Order` ( -- Same as previous line in previous table
    OrderID INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for orders
    CustomerID INT NOT NULL, -- Foreign Key to Customer
    OrderDate DATE NOT NULL, -- Date of the order
    ShippingDate DATE, -- Shipping date
    OrderStatusID INT NOT NULL, -- Foreign Key to OrderStatus
    TotalAmount DECIMAL(10,2) NOT NULL, -- Total amount for the order
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (OrderStatusID) REFERENCES OrderStatus(OrderStatusID)
);

-- OrderDetails Table
CREATE TABLE IF NOT EXISTS OrderDetails ( -- Same as previous line in previous table
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for order details
    OrderID INT NOT NULL, -- Foreign Key to Order
    ProductID INT NOT NULL, -- Foreign Key to Product
    Quantity INT CHECK (Quantity > 0) NOT NULL, -- The amount of product. Quantity must be positive, the check ensures this.
    Price DECIMAL(10,2) NOT NULL, -- Price of the product
    LineTotal DECIMAL(10,2) AS (Quantity * Price) STORED, -- Calculated line total
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Feedback Table
CREATE TABLE IF NOT EXISTS Feedback ( -- Same as previous line in previous table
    FeedbackID INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for feedback
    Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 5), -- This is the scoring the user decides to give. Rating 1-5
    Comments VARCHAR(255), -- Customer feedback on product by accepting 255 characters of critism/praise
    FeedbackDate DATE NOT NULL, -- Feedback date
    OverallExperience INT CHECK (OverallExperience BETWEEN 1 AND 5), -- Overall experience
    ExperienceComments VARCHAR(255), -- Customer feedback on experience by accepting 255 characters of critism/praise
    ProductID INT NOT NULL, -- Foreign Key to Product
    CustomerID INT NOT NULL, -- Foreign Key to Customer
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
