--Procedure 1: Insert a New User
IF OBJECT_ID('dbo.AddUser', 'P') IS NOT NULL
BEGIN
    DROP PROCEDURE dbo.AddUser;
END
GO

CREATE PROCEDURE AddUser
    @computing_id VARCHAR(7),
    @name VARCHAR(50),
    @phone_number VARCHAR(10),
    @user_id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @email VARCHAR(50);
    SET @email = @computing_id + '@virginia.edu';

    INSERT INTO [User] (computing_id, [name], email, phone_number)
    VALUES (@computing_id, @name, @email, @phone_number);

    -- Get the ID of the newly created user
    SET @user_id = SCOPE_IDENTITY();
END
GO

-- Example usage:
-- DECLARE @new_user_id INT;
-- EXEC AddUser 
--     @computing_id = 'abc5de',
--     @name = 'Alice Smith',
--     @phone_number = '1234567890',
--     @user_id = @new_user_id OUTPUT;
-- SELECT @new_user_id AS NewUserId;

-- Procedure 2: Insert a New Item
IF OBJECT_ID('dbo.NewItem', 'P') IS NOT NULL
BEGIN
    DROP PROCEDURE dbo.NewItem;
END
GO

CREATE PROCEDURE NewItem
    @item_name VARCHAR(100),
    @description VARCHAR(MAX),
    @location VARCHAR(255),
    @reporter_id VARCHAR(8),
    @category_id INT, 
    @image VARBINARY(MAX),
    @item_id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Item (item_name, [description], [location], reporter_id, category_id, [image]) 
    VALUES (@item_name, @description, @location, @reporter_id, @category_id, @image);

    SET @item_id = SCOPE_IDENTITY();
END
GO

--Example usage:
-- DECLARE @new_item_id INT;  -- Variable to hold the output parameter

-- EXEC NewItem 
--     @item_name = 'Laptop',
--     @description = 'A silver laptop',
--     @location = 'Building A',
--     @reporter_id = 'CS1234',
--     @category_id = 1,
--     @image = NULL,
--     @item_id = @new_item_id OUTPUT;  -- Passing the output parameter

-- SELECT @new_item_id AS NewItemId;

--Procedure 3: Insert a New Found Report
IF OBJECT_ID('dbo.NewFoundReport', 'P') IS NOT NULL
BEGIN
    DROP PROCEDURE dbo.NewFoundReport;
END
GO

CREATE PROCEDURE NewFoundReport
    @item_id INT,
    @computing_id VARCHAR(7),
    @status VARCHAR(20),
    @report_id INT OUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Found_Report (item_id, computing_id, [status])
    VALUES (@item_id, @computing_id, @status);

    SET @report_id = SCOPE_IDENTITY();
END
GO

-- DECLARE @new_report_id INT;

-- EXEC NewFoundReport 
--     @item_id = 1,
--     @computing_id = 'CS1234',
--     @status = 'Found',
--     @report_id = @new_report_id OUTPUT;

-- SELECT @new_report_id AS NewFoundReport;

--Procedure 4: Insert a New Claim Report
IF OBJECT_ID('dbo.NewClaimReport', 'P') IS NOT NULL
BEGIN
    DROP PROCEDURE dbo.NewClaimReport;
END
GO

CREATE PROCEDURE NewClaimReport
    @item_id INT,
    @computing_id VARCHAR(7),
    @status VARCHAR(20),
    @report_id INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Claim_Report (item_id, computing_id, [status])
    VALUES (@item_id, @computing_id, @status);

    SET @report_id = SCOPE_IDENTITY();
END
GO

-- Example usage:
-- DECLARE @new_report_id INT;

-- EXEC NewClaimReport 
--     @item_id = 1, 
--     @computing_id = 'CS1234', 
--     @status = 'Pending',
--     @report_id = @new_report_id OUTPUT;

-- SELECT @new_report_id AS NewReportId;

--Procedure 5: Update Status in Found Report
IF OBJECT_ID('dbo.UpdateStatusinFound', 'P') IS NOT NULL
BEGIN
    DROP PROCEDURE dbo.UpdateStatusinFound;
END
GO

CREATE PROCEDURE UpdateStatusinFound
    @found_report_id INT,
    @status VARCHAR(20),
    @success BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Found_Report
    SET [status] = @status
    WHERE found_report_id = @found_report_id;

    -- Indicate success if the row was updated
    IF @@ROWCOUNT > 0
        SET @success = 1;
    ELSE
        SET @success = 0;
END
GO

-- Example usage:
-- DECLARE @update_success BIT;

-- EXEC UpdateStatusinFound 
--     @found_report_id = 1, 
--     @status = 'Claimed',
--     @success = @update_success OUTPUT;

-- SELECT @update_success AS UpdateSuccess;

--Procedure 6: Update Status in Claim Report
IF OBJECT_ID('dbo.UpdateStatusinClaim', 'P') IS NOT NULL
BEGIN
    DROP PROCEDURE dbo.UpdateStatusinClaim;
END
GO

CREATE PROCEDURE UpdateStatusinClaim
    @claim_report_id INT,
    @status VARCHAR(20),
    @success BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Claim_Report
    SET [status] = @status
    WHERE claim_report_id = @claim_report_id;

    -- Indicate success if the row was updated
    IF @@ROWCOUNT > 0
        SET @success = 1;
    ELSE
        SET @success = 0;
END
GO

-- Example usage
-- DECLARE @update_success BIT;

-- EXEC UpdateStatusinClaim 
--     @claim_report_id = 1, 
--     @status = 'Resolved',
--     @success = @update_success OUTPUT;

-- SELECT @update_success AS UpdateSuccess;

--Function 1:

--Function 2:

--Function 3:


--View 1a
CREATE FoundReportView AS
SELECT 
    i.item_name,
    u.name,
    u.email,
    u.phone_number,
    r.datetime_reported, 
    r.status
FROM
Found_Report r
JOIN Item i on i.item_id = r.item_id
JOIN [User] u on u.computing_id = r.computing_id;

--View 1b
CREATE ClaimReportView AS
SELECT 
    i.item_name,
    u.name,
    u.email,
    u.phone_number,
    r.datetime_reported, 
    r.status
FROM
Claim_Report r
JOIN Item i on i.item_id = r.item_id
JOIN [User] u on u.computing_id = r.computing_id;


--View 2a
CREATE LostItemView AS
SELECT
    i.item_name,
    i.description,
    i.location,
    i.datetime_posted,
    c.category_name,
    i.image,
    l.compensation
FROM Item i 
JOIN Category c ON c.category_id = i.category_id
JOIN Lost_Item l ON l.item_id = i.item_id;

--View 2b
CREATE FoundItemView AS
SELECT
    i.item_name,
    i.description,
    i.location,
    i.datetime_posted,
    i.image,
    c.category_name
FROM Item i 
JOIN Category c ON c.category_id = i.category_id
JOIN Found_Item fi ON fi.item_id = i.item_id;

--View 3
CREATE UserProfile AS 
SELECT
    u.name,
    u.email,
    u.phone_number,
    b.name AS badge_name,
    b.icon
FROM [User] u
LEFT JOIN User_Earns_Badge ub ON ub.computing_id = u.computing_id
LEFT JOIN Badge b ON b.badge_id = ub.badge_id;

--Trigger


--Encryption