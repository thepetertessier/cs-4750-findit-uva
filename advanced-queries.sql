--Procedure 1: Insert a New User
CREATE PROCEDURE AddUser
    @computing_id VARCHAR(7),
    @[name] VARCHAR(50),
    @email VARCHAR(50),
    @phone_number VARCHAR(10)
AS BEGIN
INSERT INTO [User] (computing_id, [name], email, phone_number)
VALUES (@computing_id, @[name], @email, @phone_number);
END;

--Procedure 2: Insert a New Item
CREATE PROCEDURE NewItem
    @item_name VARCHAR(100),
    @[description] VARCHAR(MAX),
    @[location] VARCHAR(255),
    @reporter_id VARCHAR(8),
    @category_id INT, 
    @[image] VARBINARY(MAX)
AS BEGIN
INSERT INTO Item (item_name, [description], [location], reporter_id, category_id, [image]) 
VALUES (@item_name, @[description], @[location], @reporter_id, @category_id, @[image]) 
END;


--Procedure 3: Insert a New Found Report
CREATE PROCEDURE NewFoundReport
    @item_id INT,
    @computing_id VARCHAR(7),
    @[status] VARCHAR(20),
AS BEGIN
INSERT INTO Found_Report (item_id, computing_id, [status])
VALUES (@item_id, @computing_id, @[status])
END;

--Procedure 4: Insert a New Claim Report

--Procedure 5: Update Status in Found Report

--Procedure 6: Update Status in Claim Report

--Function 1:

--Function 2:

--Function 3:
