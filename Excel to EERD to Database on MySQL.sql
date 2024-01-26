CREATE DATABASE GroceryStore;
USE GroceryStore;

CREATE TABLE Items (
    ItemID INT PRIMARY KEY,
    Description VARCHAR(255),
    QuantityOnHand INT,
    ItemType VARCHAR(50),
    Location VARCHAR(50),
    Unit VARCHAR(20)
);

CREATE TABLE Vendors (
    VendorID INT PRIMARY KEY,
    VendorName VARCHAR(255),
    StreetAddress VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(50),
    PostalCode VARCHAR(20)
);

-- bridge
CREATE TABLE Purchases (
    PurchaseID INT PRIMARY KEY auto_increment,
    ItemID INT,
    VendorID INT,
    PurchaseDate DATE,
    Quantity INT,
    Cost DECIMAL(10, 2),
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID),
    FOREIGN KEY (VendorID) REFERENCES Vendors(VendorID)
);
DROP TABLE Purchases;
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ItemID INT,
    SaleDate DATE,
    Quantity INT,
    Price DECIMAL(10, 2),
    CustomerID INT,
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
);

INSERT INTO Items (ItemID, ItemType, Description, Location, QuantityOnHand, Unit)
VALUES
(1000, 'Dairy', 'Bennet Farm free-range eggs', 'D12', 17, 'Dozen'),
(1100, 'Canned', 'Freshness White beans', 'A2', 26, '12 oz can'),
(1222, 'Canned', 'Freshness Green beans', 'A3', 28, '12 oz can'),
(1223, 'Canned', 'Freshness Green beans', 'A7', 15, '36 oz can'),
(1224, 'Canned', 'Freshness Wax beans', 'A3', 22, '12 OZ can'),
(2000, 'Produce', 'Ruby\'s Kale', 'P12', 21, 'Bunch'),
(2001, 'Produce', 'Ruby\'s Organic Kale', 'PO2', 7, 'Bunch');

INSERT INTO Vendors (VendorID, VendorName, StreetAddress, City, State, PostalCode)
VALUES
(1, 'Bennet Farms', 'Rt. 17', 'Evansville', 'IL', '55446'),
(2, 'Freshness Inc.', '202 Maple St.', 'St. Joseph', 'MO', '45678'),
(3, 'Ruby Redd Produce, LLC', '1212 Milam St.', 'Kenosha', 'AL', '34567');

INSERT INTO Purchases (PurchaseID, ItemID, VendorID, PurchaseDate, Quantity, Cost)
VALUES
(1, 1000, 1, '2022-02-01', 25, 2.35),
(8, 1100, 2, '2022-02-02', 40, 0.69),
(2, 1222, 2, '2022-02-10', 40, 0.59),
(3, 1223, 2, '2022-02-10', 10, 1.75),
(7, 1223, 2, '2022-02-15', 10, 1.8),
(4, 1224, 2, '2022-02-10', 30, 0.65),
(5, 2000, 3, '2022-02-12', 25, 1.29),
(6, 2001, 3, '2022-02-12', 20, 2.19);


INSERT INTO Sales (SaleID, ItemID, SaleDate, Quantity, Price, CustomerID)
VALUES
(1, 1000, '2022-02-11', 4, 5.49, 277177),
(9, 1000, '2022-02-02', 2, 5.49, 198765),
(12, 1000, '2022-02-04', 2, 5.99, 196777),
(2, 1100, '2022-02-11', 4, 1.49, NULL),
(10, 1100, '2022-02-02', 2, 1.49, 202900),
(13, 1100, '2022-02-07', 8, 1.49, 198765),
(3, 1222, '2022-02-12', 12, 1.29, 111000),
(5, 1223, '2022-02-13', 5, 3.49, 198765),
(4, 1224, '2022-02-12', 8, 1.55, NULL),
(8, 2000, '2022-02-15', 2, 3.99, 111000),
(11, 2000, '2022-02-02', 2, 3.99, NULL),
(6, 2001, '2022-02-13', 1, 6.99, 100988),
(7, 2001, '2022-02-14', 12, 6.99, 202900);


SELECT * FROM Sales;


SELECT Purchases.PurchaseID, Purchases.PurchaseDate, Purchases.Quantity, Purchases.Cost, 
       Items.ItemType, Items.Description, Items.Location, Items.QuantityOnHand
FROM Purchases
INNER JOIN Items ON Purchases.ItemID = Items.ItemID ORDER BY PurchaseID;

SELECT 
    *
FROM Items
LEFT JOIN Purchases ON Items.ItemID = Purchases.ItemID ORDER BY Items.ItemID;


SELECT 
    *
FROM Items
LEFT JOIN Purchases ON Items.ItemID = Purchases.ItemID
LEFT JOIN Sales ON Items.ItemID = Sales.ItemID ORDER BY Items.ItemID;