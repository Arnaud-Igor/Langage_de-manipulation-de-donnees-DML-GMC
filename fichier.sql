-- Active: 1713358404192@@127.0.0.1@3306@maBaseDDL
CREATE DATABASE maBaseDDL;

CREATE TABLE Customer (
    Customer_id VARCHAR(20) PRIMARY KEY,
    Customer_Name VARCHAR(20) NOT NULL,
    Customer_Tel INTEGER
);

CREATE TABLE Product (
    Product_id VARCHAR(20) PRIMARY KEY,
    Product_Name VARCHAR(20) NOT NULL,
    Price INTEGER,
    CHECK (Price > 0)
);

CREATE TABLE Orders (
    Customer_id VARCHAR(20),
    Product_id VARCHAR(20),
    Quantity INTEGER,
    Total_amount INTEGER,
    CONSTRAINT fk_CustomerOrder FOREIGN KEY (Customer_id) REFERENCES Customer (Customer_id),
    CONSTRAINT fk_ProductOrder FOREIGN KEY (Product_id) REFERENCES Product (Product_id),
    CONSTRAINT pk_Order PRIMARY KEY (Customer_id, Product_id)
);

ALTER TABLE Product ADD Category VARCHAR(20);

ALTER TABLE Orders ADD OrderDate DATE;

ALTER TABLE Orders ALTER OrderDate SET DEFAULT (SYSDATE());

/* ---------- INSERTION DES DONNEES DANS LES TABLES ---------- */

INSERT INTO `Customer` (`Customer_id`, `Customer_Name`, `Customer_Tel`) 
VALUES
    ('C01', 'ALI', '71321009'),
    ('C02', 'ASMA', '77345823');

INSERT INTO `Product` (`Product_id`, `Product_Name`, `Category`, `Price`) 
VALUES
    ('P01', 'Samsung Galaxy S20', 'Smartphone', '3299'),
    ('P02', 'ASUS Notebook', 'PC', '4599');

INSERT INTO `Orders` (`Customer_id`, `Product_id`, `OrderDate`, `Quantity`, `Total_amount`) 
VALUES
    ('C01', 'P01', NULL, '2', '9198'),
    ('C02', 'P02', '2020-05-28', '1', '3299');

