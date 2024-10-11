USE Project;
GO

-- Insert dummy users
INSERT INTO [User] (computing_id, [name], email, phone_number) VALUES
('fpv5gx', 'Alice Smith', 'fpv5gx@virginia.edu', '1234567890'),
('umz4re', 'Bob Johnson', 'umz4re@virginia.edu', '2345678901'),
('abc0fde', 'Charlie Brown', 'abc0fde@virginia.edu', '3456789012'),
('xyz1qwe', 'David Wilson', 'xyz1qwe@virginia.edu', '4567890123'),
('ijk2gfh', 'Eve Davis', 'ijk2gfh@virginia.edu', '5678901234'),
('pqr3hjk', 'Frank Miller', 'pqr3hjk@virginia.edu', '6789012345'),
('stu4lmn', 'Grace Lee', 'stu4lmn@virginia.edu', '7890123456'),
('vwx5opq', 'Hannah Kim', 'vwx5opq@virginia.edu', '8901234567'),
('yzx6rst', 'Ian Brown', 'yzx6rst@virginia.edu', '9012345678'),
('abc7xyz', 'Jessica White', 'abc7xyz@virginia.edu', '0123456789'),
('def8abc', 'Kevin Harris', 'def8abc@virginia.edu', '1234567890'),
('ghi9def', 'Liam Martin', 'ghi9def@virginia.edu', '2345678901'),
('jkl0ghi', 'Mia Thompson', 'jkl0ghi@virginia.edu', '3456789012'),
('mno1jkl', 'Noah Garcia', 'mno1jkl@virginia.edu', '4567890123'),
('pqr2mno', 'Olivia Martinez', 'pqr2mno@virginia.edu', '5678901234'),
('stu3pqr', 'Paul Rodriguez', 'stu3pqr@virginia.edu', '6789012345'),
('vwx4stu', 'Quinn Lee', 'vwx4stu@virginia.edu', '7890123456'),
('yzx5vwx', 'Ryan Clark', 'yzx5vwx@virginia.edu', '8901234567'),
('abc6xyz', 'Sophie Lewis', 'abc6xyz@virginia.edu', '9012345678'),
('def7abc', 'Tyler Walker', 'def7abc@virginia.edu', '0123456789'),
('ghi8def', 'Uma Allen', 'ghi8def@virginia.edu', '1234567890'),
('jkl9ghi', 'Vera Young', 'jkl9ghi@virginia.edu', '2345678901'),
('mno0jkl', 'Will King', 'mno0jkl@virginia.edu', '3456789012'),
('pqr1mno', 'Xander Wright', 'pqr1mno@virginia.edu', '4567890123'),
('stu2pqr', 'Yara Scott', 'stu2pqr@virginia.edu', '5678901234'),
('vwx3stu', 'Zane Bennett', 'vwx3stu@virginia.edu', '6789012345'),
('abc4xyz', 'Amy Adams', 'abc4xyz@virginia.edu', '7890123456'),
('def5abc', 'Brian Carter', 'def5abc@virginia.edu', '8901234567'),
('ghi6def', 'Cathy Fisher', 'ghi6def@virginia.edu', '9012345678'),
('jkl7ghi', 'Danny Gonzalez', 'jkl7ghi@virginia.edu', '0123456789'),
('mno8jkl', 'Emily Hall', 'mno8jkl@virginia.edu', '1234567890'),
('pqr9mno', 'Fiona Ivey', 'pqr9mno@virginia.edu', '2345678901'),
('stu0pqr', 'George Jordan', 'stu0pqr@virginia.edu', '3456789012'),
('vwx1stu', 'Holly Lee', 'vwx1stu@virginia.edu', '4567890123'),
('yzx2vwx', 'Ivan Martinez', 'yzx2vwx@virginia.edu', '5678901234'),
('abc3xyz', 'Jack Nielson', 'abc3xyz@virginia.edu', '6789012345'),
('def4abc', 'Kimberly ONeill', 'def4abc@virginia.edu', '7890123456'),
('ghi5def', 'Leo Peterson', 'ghi5def@virginia.edu', '8901234567'),
('jkl6ghi', 'Megan Quinn', 'jkl6ghi@virginia.edu', '9012345678'),
('mno7jkl', 'Nina Roberts', 'mno7jkl@virginia.edu', '0123456789'),
('pqr8mno', 'Oscar Smith', 'pqr8mno@virginia.edu', '1234567890'),
('stu9pqr', 'Penny Thompson', 'stu9pqr@virginia.edu', '2345678901');

-- Insert dummy categories
INSERT INTO Category (category_name) VALUES
('Electronics'),
('Clothing'),
('Books'),
('Furniture'),
('Miscellaneous');

-- Insert dummy items
INSERT INTO Item (item_name, [description], [location], reporter_id, category_id, [image]) VALUES
('Black Wallet', 'Lost black leather wallet with UVA ID inside', 'Newcomb Hall', 'fpv5gx', 4, NULL),
('Silver Necklace', 'Found silver necklace near the bus stop', 'Main Street Bus Stop', 'umz4re', 4, NULL),
('Calculus Textbook', 'Lost Calculus textbook with notes inside', 'Clark Hall', 'abc0fde', 2, NULL),
('iPhone', 'Found black iPhone with cracked screen', 'University Bookstore', 'xyz1qwe', 1, NULL),
('Backpack', 'Lost blue North Face backpack with laptop inside', 'Chemistry Building', 'ijk2gfh', 5, NULL),
('Sunglasses', 'Found Ray-Ban sunglasses in the parking lot', 'South Garage', 'pqr3hjk', 4, NULL),
('Basketball', 'Lost orange Spalding basketball', 'Memorial Gym', 'stu4lmn', 5, NULL),
('Water Bottle', 'Found blue Hydro Flask water bottle', 'Engineering Quad', 'vwx5opq', 4, NULL),
('Laptop Charger', 'Lost MacBook charger', 'Alderman Library', 'yzx6rst', 1, NULL),
('Jacket', 'Found black jacket with keys in pocket', 'Dining Hall', 'abc7xyz', 3, NULL),
('Keychain', 'Lost keychain with several keys and a mini flashlight', 'Scott Stadium', 'def8abc', 4, NULL),
('Bike Helmet', 'Found white bike helmet near bike racks', 'O-Hill', 'ghi9def', 5, NULL),
('Earbuds', 'Lost white Apple AirPods', 'Wilsdorf Hall', 'jkl0ghi', 1, NULL),
('Notebook', 'Found spiral notebook with class notes', 'Chemistry Building', 'mno1jkl', 2, NULL),
('Calculator', 'Lost TI-84 calculator', 'Physics Building', 'pqr2mno', 1, NULL),
('Bracelet', 'Found gold bracelet near the fountain', 'Amphitheater', 'stu3pqr', 4, NULL),
('Laptop Sleeve', 'Lost gray laptop sleeve', 'Rice Hall', 'vwx4stu', 1, NULL),
('Umbrella', 'Found black umbrella', 'Old Cabell Hall', 'yzx5vwx', 4, NULL),
('Headphones', 'Lost Bose noise-canceling headphones', 'Fine Arts Library', 'abc6xyz', 1, NULL),
('Biology Textbook', 'Found Biology textbook', 'Gilmer Hall', 'def7abc', 2, NULL),
('Scarf', 'Lost red scarf', 'Bus Stop', 'ghi8def', 3, NULL),
('Watch', 'Found mens watch', 'Aquatic Center', 'jkl9ghi', 4, NULL),
('MacBook Pro', 'Lost silver MacBook Pro with stickers', 'Brown College', 'mno0jkl', 1, NULL),
('Gym Bag', 'Found black gym bag with clothes', 'Slaughter Gym', 'pqr1mno', 5, NULL),
('Baseball Cap', 'Lost UVA baseball cap', 'Scott Stadium', 'stu2pqr', 3, NULL),
('Earrings', 'Found pearl earrings', 'Madison Hall', 'vwx3stu', 4, NULL),
('Nike Sneakers', 'Lost white Nike sneakers', 'New Cabell Hall', 'abc4xyz', 3, NULL),
('Passport', 'Found US passport', 'International Center', 'def5abc', 4, NULL),
('USB Drive', 'Lost 32GB USB drive', 'Clemons Library', 'ghi6def', 1, NULL),
('Planner', 'Found 2022 planner', 'Ruffner Hall', 'jkl7ghi', 2, NULL),
('Camera', 'Lost Canon DSLR camera', 'McIntire Amphitheater', 'mno8jkl', 1, NULL),
('Ring', 'Found ring with inscription', 'Chapel', 'pqr9mno', 4, NULL),
('Gloves', 'Lost black leather gloves', 'Law School', 'stu0pqr', 3, NULL),
('ID Badge', 'Found staff ID badge', 'Hospital', 'vwx1stu', 4, NULL),
('Soccer Ball', 'Lost Adidas soccer ball', 'Lambeth Field', 'yzx2vwx', 5, NULL),
('Purse', 'Found small black purse', 'Corner', 'abc3xyz', 4, NULL),
('Car Keys', 'Lost set of car keys with remote', 'Parking Garage', 'def4abc', 4, NULL),
('Tablet', 'Found Samsung tablet', 'Thornton Hall', 'ghi5def', 1, NULL),
('Sweater', 'Lost green sweater', 'Library', 'jkl6ghi', 3, NULL),
('Yoga Mat', 'Found purple yoga mat', 'North Grounds', 'mno7jkl', 5, NULL),
('Novel', 'Lost personal copy of "The Great Gatsby"', 'South Lawn', 'pqr8mno', 2, NULL),
('Clutch Bag', 'Found red clutch bag', 'The Rotunda', 'stu9pqr', 4, NULL),
('Moleskine Notebook', 'Lost black Moleskine notebook', 'McLeod Hall', 'fpv5gx', 2, NULL),
('Montblanc Pen', 'Found Montblanc pen', 'Garrett Hall', 'umz4re', 4, NULL),
('Wool Socks', 'Lost pair of wool socks', 'Dorm Laundry Room', 'abc0fde', 3, NULL),
('Lab Coat', 'Found white lab coat', 'Chemistry Lab', 'xyz1qwe', 3, NULL),
('Math Textbook', 'Lost Advanced Mathematics textbook', 'Mathematics Building', 'ijk2gfh', 2, NULL);

INSERT INTO Found_Item (item_id) VALUES
(1), (2), (4), (5), (6), (8), (10), (11), (13), (15), (16), (18), (20), (21), (22), (24), (26), (27), (29), (30), (31), (32), (34), (35), (37), (38), (40), (41), (43), (45);

INSERT INTO Lost_Item (item_id, compensation) VALUES
(3, 'Reward: $20'), 
(7, 'Reward: $10'), 
(9, 'Reward: $15'), 
(12, 'Reward: $25'), 
(14, 'Reward: $30'), 
(17, 'Reward: $5'), 
(19, 'Reward: $15'), 
(23, 'Reward: $20'), 
(25, 'Reward: $10'), 
(28, 'Reward: $15'), 
(33, 'Reward: $20'), 
(36, 'Reward: $5'), 
(39, 'Reward: $30'), 
(42, 'Reward: $25'), 
(44, 'Reward: $10');

-- Insert dummy admins based on existing users
INSERT INTO Admin (computing_id, permissions) VALUES
('fpv5gx', 'All'),
('umz4re', 'Remove'),
('abc0fde', 'Ban'),
('xyz1qwe', 'All'),
('ijk2gfh', 'Remove');
