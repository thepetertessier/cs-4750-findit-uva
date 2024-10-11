-- Sample Queries --
USE Project;
GO

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
