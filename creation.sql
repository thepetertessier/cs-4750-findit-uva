DROP DATABASE Project;
GO
CREATE DATABASE Project;
GO


USE Project;
GO


CREATE TABLE [User] (
   computing_id VARCHAR(7) PRIMARY KEY CHECK (computing_id NOT LIKE '%[^a-zA-Z0-9]%' AND LEN(computing_id) = 7),
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

-- Insert dummy users
INSERT INTO [User] (computing_id, [name], email, phone_number) VALUES
('abcd123', 'Alice Smith', 'alice@virginia.edu', '1234567890'),
('efgh456', 'Bob Johnson', 'bob@virginia.edu', '2345678901'),
('ijkl789', 'Charlie Brown', 'charlie@virginia.edu', '3456789012'),
('mnop012', 'David Wilson', 'david@virginia.edu', '4567890123'),
('qrst345', 'Eve Davis', 'eve@virginia.edu', '5678901234');

-- Insert dummy categories
INSERT INTO Category (category_name) VALUES
('Electronics'),
('Clothing'),
('Books'),
('Furniture'),
('Miscellaneous');

-- Insert dummy items
INSERT INTO Item (item_name, [description], [location], reporter_id, category_id, [image]) VALUES
('Laptop', 'A silver laptop with a cracked screen', 'Library', 'abcd123', 1, NULL),
('Jacket', 'A blue winter jacket', 'Student Center', 'efgh456', 2, NULL),
('Textbook', 'Calculus 101 textbook', 'Chemistry Building', 'ijkl789', 3, NULL),
('Chair', 'Office chair, slightly damaged', 'Dorm Room', 'mnop012', 4, NULL),
('USB Drive', '16GB USB drive with files', 'Main Quad', 'qrst345', 5, NULL);

-- Insert dummy found items
INSERT INTO Found_Item (item_id) VALUES
(1),
(3),
(5);

-- Insert dummy lost items
INSERT INTO Lost_Item (item_id, compensation) VALUES
(2, 'Reward $20'),
(4, 'Reward $50');

-- Insert dummy admins
INSERT INTO Admin (computing_id, permissions) VALUES
('abcd123', 'All'),
('efgh456', 'Remove'),
('ijkl789', 'Ban');

-- Insert dummy found reports
INSERT INTO Found_Report (item_id, computing_id, [status]) VALUES
(1, 'abcd123', 'Pending'),
(3, 'efgh456', 'Claimed'),
(5, 'ijkl789', 'Reunited');

-- Insert dummy claim reports
INSERT INTO Claim_Report (item_id, computing_id, [status]) VALUES
(2, 'mnop012', 'Pending'),
(4, 'qrst345', 'Claimed');

-- Insert dummy badges
INSERT INTO Badge ([name], [description], icon) VALUES
('Newcomer', 'First time user', NULL),
('Helpful', 'Assisted 5 users', NULL),
('Veteran', 'Been around for a year', NULL);

-- Insert dummy admin removes
INSERT INTO Admin_Removes (item_id, admin_id, reason) VALUES
(1, 'abcd123', 'Inappropriate content'),
(2, 'efgh456', 'Violation of rules');

-- Insert dummy admin bans
INSERT INTO Admin_Bans (banned_id, admin_id, reason) VALUES
('ijkl789', 'abcd123', 'Harassment'),
('mnop012', 'efgh456', 'Spamming');

-- Insert dummy user earns badges
INSERT INTO User_Earns_Badge (computing_id, badge_id) VALUES
('abcd123', 1),
('efgh456', 2),
('ijkl789', 3),
('mnop012', 1),
('qrst345', 2);


-- Sample Queries --
-- List Items by Category
SELECT i.item_name, i.[description], c.category_name 
FROM Item i
JOIN Category c ON i.category_id = c.category_id;
GO

-- Find All Found Items with Report Status
SELECT fi.item_id, i.item_name, r.[status]
FROM Found_Item fi
JOIN Item i ON fi.item_id = i.item_id
JOIN Found_Report r ON fi.item_id = r.item_id;
GO

-- Find Users Who Have Earned Badges
SELECT u.computing_id, u.[name], b.[name] AS BadgeName
FROM User_Earns_Badge ueb
JOIN [User] u ON ueb.computing_id = u.computing_id
JOIN Badge b ON ueb.badge_id = b.badge_id;
GO

-- Retrieve All Reports for a Specific User
SELECT 'Found Report' AS ReportType, fr.found_report_id, fr.datetime_reported, fr.[status]
FROM Found_Report fr
WHERE fr.computing_id = 'abcd123'
UNION ALL
SELECT 'Claim Report' AS ReportType, cr.claim_report_id, cr.datetime_reported, cr.[status]
FROM Claim_Report cr
WHERE cr.computing_id = 'abcd123';
GO

-- Update User's Phone Number
UPDATE [User]
SET phone_number = '9876543210'
WHERE computing_id = 'abcd123';
GO

-- Delete a Found Report
DELETE FROM Found_Report
WHERE found_report_id = 1; -- Specify the report ID to delete
GO

-- List All Banned Users
SELECT u.computing_id, u.[name], ab.admin_id, ab.reason
FROM Admin_Bans ab
JOIN [User] u ON ab.banned_id = u.computing_id;
GO
