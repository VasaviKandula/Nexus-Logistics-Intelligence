-- 1. Create the Database
CREATE DATABASE NexusLogisticsDB;
GO

USE NexusLogisticsDB;
GO

-- 2. Create Dimension Tables (The "Who", "What", "Where", "When")

-- Products: Electronics focus
CREATE TABLE Dim_Product (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    UnitCost DECIMAL(10, 2),
    UnitPrice DECIMAL(10, 2)
);

-- Customers: B2B Clients
CREATE TABLE Dim_Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(100),
    Region NVARCHAR(50),
    Segment NVARCHAR(50) -- e.g., 'Corporate', 'Small Business'
);

-- Date: Essential for Time Intelligence
CREATE TABLE Dim_Date (
    DateKey DATE PRIMARY KEY,
    Year INT,
    Month INT,
    MonthName NVARCHAR(20),
    Quarter NVARCHAR(10)
);

-- 3. Create Fact Tables (The "Transactions")

-- Sales Transactions
CREATE TABLE Fact_Sales (
    SalesID INT PRIMARY KEY IDENTITY(1,1),
    DateKey DATE FOREIGN KEY REFERENCES Dim_Date(DateKey),
    ProductID INT FOREIGN KEY REFERENCES Dim_Product(ProductID),
    CustomerID INT FOREIGN KEY REFERENCES Dim_Customer(CustomerID),
    Quantity INT,
    TotalRevenue DECIMAL(10, 2),
    TotalCost DECIMAL(10, 2),
    GrossProfit DECIMAL(10, 2)
);

-- 4. Seed Data (Insert Dummy Data to make it work)

-- Insert Products
INSERT INTO Dim_Product VALUES 
(1, 'Nexus X1 Laptop', 'Laptops', 800.00, 1200.00),
(2, 'Nexus Pro Tablet', 'Tablets', 300.00, 500.00),
(3, 'Wireless Headphones', 'Accessories', 40.00, 100.00),
(4, 'Smart Monitor 4K', 'Monitors', 150.00, 300.00),
(5, 'Ergo Mouse', 'Accessories', 15.00, 40.00);

-- Insert Customers
INSERT INTO Dim_Customer VALUES 
(101, 'TechFlow Solutions', 'North America', 'Corporate'),
(102, 'Alpha Dynamics', 'Europe', 'Small Business'),
(103, 'Global Corp', 'Asia', 'Corporate'),
(104, 'StartUp Inc', 'North America', 'Small Business');

-- Insert Dates (Simplified for example)
INSERT INTO Dim_Date VALUES 
('2024-01-01', 2024, 1, 'January', 'Q1'),
('2024-01-02', 2024, 1, 'January', 'Q1'),
('2024-02-01', 2024, 2, 'February', 'Q1');

-- Insert Transactions (Simulating Sales)
INSERT INTO Fact_Sales (DateKey, ProductID, CustomerID, Quantity, TotalRevenue, TotalCost, GrossProfit)
VALUES 
('2024-01-01', 1, 101, 5, 6000.00, 4000.00, 2000.00), -- 5 Laptops
('2024-01-01', 3, 102, 10, 1000.00, 400.00, 600.00),  -- 10 Headphones
('2024-01-02', 2, 103, 4, 2000.00, 1200.00, 800.00),  -- 4 Tablets
('2024-02-01', 1, 104, 2, 2400.00, 1600.00, 800.00),  -- 2 Laptops
('2024-02-01', 5, 101, 20, 800.00, 300.00, 500.00);   -- 20 Mice

-- Check the data
SELECT * FROM Fact_Sales;