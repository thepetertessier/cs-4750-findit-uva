USE Project;
GO

--number of users who've recieved each type of badge
SELECT b.[name], COUNT(u.computing_id) AS total_users FROM User_Earns_Badge u 
JOIN Badge b ON u.badge_id = b.badge_id 
GROUP BY b.[name];

--number of items in each category
SELECT c.category_name, COUNT(i.item_id) AS total_items FROM Item i
JOIN Category c ON i.category_id = c.category_id
GROUP BY c.category_name;

--list of users and the number of found report's they have made
SELECT u.computing_id, COUNT(fr.found_report_id) AS total_found_reports
FROM [User] u
LEFT JOIN Found_Report fr ON u.computing_id = fr.computing_id
GROUP BY u.computing_id, u.[name];

--list of users and the number of claim report's they have made
SELECT u.computing_id, COUNT(c.claim_report_id) AS total_claim_reports
FROM [User] u
LEFT JOIN Claim_Report c ON u.computing_id = c.computing_id
GROUP BY u.computing_id, u.[name];

--users who have lost an item and the number of items they've lost
SELECT u.computing_id, COUNT(l.item_id) AS lost_item_count
FROM [User] u INNER JOIN 
(SELECT l.item_id, i.reporter_id FROM Lost_Item l INNER JOIN Item i ON l.item_id = i.item_id) 
AS l ON u.computing_id = l.reporter_id 
GROUP BY u.computing_id;

--users who have found an item and the number of items they've found
SELECT u.computing_id, COUNT(f.item_id) AS found_item_count
FROM [User] u INNER JOIN 
(SELECT f.item_id, i.reporter_id FROM Found_Item f INNER JOIN Item i ON f.item_id = i.item_id) 
AS f ON u.computing_id = f.reporter_id 
GROUP BY u.computing_id;

--number of found reports for each status
SELECT [status], COUNT(*) AS report_count
FROM Found_Report GROUP BY [status];

--number of claim reports for each status
SELECT [status], COUNT(*) AS report_count
FROM Claim_Report GROUP BY [status];

--table of banned users and why they were banned
SELECT u.computing_id, u.[name],  b.reason FROM Admin_Bans b
JOIN [User] u ON b.banned_id = u.computing_id;

--table of removed item posts and why they were removed
SELECT i.item_id, i.item_name,  r.reason FROM Admin_Removes r
JOIN [Item] i ON r.item_id = i.item_id;

--sort users by most lost items and display count
SELECT u.computing_id, u.name, COUNT(li.item_id) AS lost_item_count
FROM [User] u
JOIN Item i ON u.computing_id = i.reporter_id
JOIN Lost_Item li ON i.item_id = li.item_id
GROUP BY u.computing_id, u.name
ORDER BY lost_item_count DESC;


--sort users by most found items and display count
SELECT u.computing_id, u.name, COUNT(f.item_id) AS found_item_count
FROM [User] u
JOIN Item i ON u.computing_id = i.reporter_id
JOIN Found_Item f ON i.item_id = f.item_id
GROUP BY u.computing_id, u.name
ORDER BY found_item_count DESC;

