-- DROP DATABASE Project;
-- GO
-- CREATE DATABASE Project;
-- GO


USE Project;
GO


-- Drop tables if they already exist to ensure a fresh start
IF OBJECT_ID('Admin_Removes', 'U') IS NOT NULL DROP TABLE Admin_Removes;
IF OBJECT_ID('Admin_Bans', 'U') IS NOT NULL DROP TABLE Admin_Bans;
IF OBJECT_ID('User_Earns_Badge', 'U') IS NOT NULL DROP TABLE User_Earns_Badge;
IF OBJECT_ID('Claim_Report', 'U') IS NOT NULL DROP TABLE Claim_Report;
IF OBJECT_ID('Found_Report', 'U') IS NOT NULL DROP TABLE Found_Report;
IF OBJECT_ID('Admin', 'U') IS NOT NULL DROP TABLE Admin;
IF OBJECT_ID('Lost_Item', 'U') IS NOT NULL DROP TABLE Lost_Item;
IF OBJECT_ID('Found_Item', 'U') IS NOT NULL DROP TABLE Found_Item;
IF OBJECT_ID('Item', 'U') IS NOT NULL DROP TABLE Item;
IF OBJECT_ID('User', 'U') IS NOT NULL DROP TABLE [User];
IF OBJECT_ID('Category', 'U') IS NOT NULL DROP TABLE Category;
IF OBJECT_ID('Badge', 'U') IS NOT NULL DROP TABLE Badge;
IF OBJECT_ID('Item_Log', 'U') IS NOT NULL DROP TABLE Item_Log;


CREATE TABLE [User] (
   computing_id VARCHAR(7) PRIMARY KEY CHECK (computing_id NOT LIKE '%[^a-zA-Z0-9]%' AND LEN(computing_id) >= 5 AND LEN(computing_id) <= 7),
   [name] VARCHAR(50),
   email VARCHAR(50) CHECK (email LIKE '%@virginia.edu'),
   phone_number VARCHAR(10)
);


CREATE TABLE Category (
   category_id INT PRIMARY KEY IDENTITY(1,1),
   category_name VARCHAR(50) NOT NULL
);


CREATE TABLE Item (
   item_id INT PRIMARY KEY IDENTITY(1,1),
   item_name VARCHAR(100) NOT NULL,
   [description] VARCHAR(MAX),
   [location] VARCHAR(255),
   reporter_id VARCHAR(7),
   datetime_posted DATETIME DEFAULT CURRENT_TIMESTAMP, -- Changed to DATETIME
   category_id INT,
   [image] VARBINARY(MAX), -- Specified size for VARBINARY
   FOREIGN KEY (reporter_id) REFERENCES [User](computing_id),
   FOREIGN KEY (category_id) REFERENCES Category(category_id)
);


CREATE TABLE Found_Item (
   item_id INT,
   FOREIGN KEY (item_id) REFERENCES Item(item_id)
);


CREATE TABLE Lost_Item (
   item_id INT PRIMARY KEY,
   compensation VARCHAR(255),
   FOREIGN KEY (item_id) REFERENCES Item(item_id)
);


CREATE TABLE Admin (
   computing_id VARCHAR(7) PRIMARY KEY,
   permissions VARCHAR(20) CHECK (permissions IN ('Ban', 'Remove', 'All')),
   FOREIGN KEY (computing_id) REFERENCES [User](computing_id)
);


CREATE TABLE Found_Report (
   found_report_id INT PRIMARY KEY IDENTITY(1,1),
   item_id INT,
   computing_id VARCHAR(7),
   datetime_reported DATETIME DEFAULT CURRENT_TIMESTAMP, -- Changed to DATETIME
   [status] VARCHAR(20) CHECK ([status] IN ('Pending', 'Claimed', 'Reunited')),
   FOREIGN KEY (item_id) REFERENCES Item(item_id),
   FOREIGN KEY (computing_id) REFERENCES [User](computing_id)
);


CREATE TABLE Claim_Report (
   claim_report_id INT PRIMARY KEY IDENTITY(1,1),
   item_id INT,
   computing_id VARCHAR(7),
   datetime_reported DATETIME DEFAULT CURRENT_TIMESTAMP, -- Changed to DATETIME
   [status] VARCHAR(20) CHECK ([status] IN ('Pending', 'Claimed', 'Reunited')),
   FOREIGN KEY (item_id) REFERENCES Item(item_id),
   FOREIGN KEY (computing_id) REFERENCES [User](computing_id)
);


CREATE TABLE Badge (
   badge_id INT PRIMARY KEY IDENTITY(1,1),
   [name] VARCHAR(50),
   [description] VARCHAR(500),
   icon VARBINARY(MAX)
);


CREATE TABLE Admin_Removes (
   item_id INT PRIMARY KEY,
   admin_id VARCHAR(7),
   datetime_removed DATETIME DEFAULT CURRENT_TIMESTAMP, -- Changed to DATETIME
   reason VARCHAR(500),
   FOREIGN KEY (item_id) REFERENCES Item(item_id),
   FOREIGN KEY (admin_id) REFERENCES Admin(computing_id)
);


CREATE TABLE Admin_Bans (
   banned_id VARCHAR(7) PRIMARY KEY,
   admin_id VARCHAR(7),
   datetime_removed DATETIME DEFAULT CURRENT_TIMESTAMP, -- Changed to DATETIME
   reason VARCHAR(500),
   FOREIGN KEY (banned_id) REFERENCES [User](computing_id),
   FOREIGN KEY (admin_id) REFERENCES Admin(computing_id)
);


CREATE TABLE User_Earns_Badge (
   computing_id VARCHAR(7),
   badge_id INT,
   datetime_earned DATETIME DEFAULT CURRENT_TIMESTAMP, -- Changed to DATETIME
   PRIMARY KEY (computing_id, badge_id), -- Added composite primary key
   FOREIGN KEY (computing_id) REFERENCES [User](computing_id),
   FOREIGN KEY (badge_id) REFERENCES Badge(badge_id)
);


CREATE TABLE Item_Log (
   item_log_id INT IDENTITY(1,1) PRIMARY KEY,
   item_id INT,
   action NVARCHAR(50),
   action_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);
