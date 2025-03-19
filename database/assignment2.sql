--1. Insert a new record into the account table
INSERT INTO account (account_firstname, account_lastname, account_email, account_password) 
VALUES ('Tony', 'Stark', 'tony@starkent.com', 'Iam1ronM@n');

--2. Update Tony Stark's account to Admin
UPDATE account 
SET account_type = 'Admin' 
WHERE account_email = 'tony@starkent.com';

--3. Delete Tony Stark's record
DELETE FROM account 
WHERE account_email = 'tony@starkent.com';

--4. Modify GM Hummer’s description
UPDATE inventory 
SET inv_description = REPLACE(inv_description, 'small interiors', 'a huge interior') 
WHERE inv_make = 'GM' AND inv_model = 'Hummer';

--5. Use an INNER JOIN to get Sport category inventory
SELECT i.inv_make, i.inv_model, c.classification_name 
FROM inventory i
INNER JOIN classification c ON i.classification_id = c.classification_id
WHERE c.classification_name = 'Sport';

--6. Update file paths in inv_image and inv_thumbnail
UPDATE inventory 
SET inv_image = REPLACE(inv_image, '/images/', '/images/vehicles/'),
    inv_thumbnail = REPLACE(inv_thumbnail, '/images/', '/images/vehicles/');