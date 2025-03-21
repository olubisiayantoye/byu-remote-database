--1. Insert a new record into the account table

INSERT INTO account (account_firstname, account_lastname, account_email, account_password, account_type)
VALUES ('Tony', 'Stark', 'tony@starkent.com', 'Iam1ronM@n', 'user');

--2. Update Tony Stark's account to Admin
UPDATE account 
SET account_type = 'admin' 
WHERE account_email = 'tony@starkent.com';

--3. Delete Tony Stark's record
DELETE FROM account 
WHERE account_email = 'tony@starkent.com';

--4. Modify Toyota Corolla’s description
UPDATE inventory 
SET inv_description = REPLACE(inv_description, 'Reliable compact car', 'a huge interior') 
WHERE inv_make = 'Toyota' AND inv_model = 'Corolla';

--5. Use an INNER JOIN to get Sport category inventory
SELECT i.inv_make, i.inv_model, c.classification_name 
FROM inventory i
INNER JOIN classification c ON i.classification_id = c.classification_id
WHERE c.classification_name = 'Toyota';

--6. Update file paths in inv_image and inv_thumbnail
UPDATE inventory 
SET inv_image = REPLACE(inv_image, '/images/', '/images/vehicles/'),
    inv_thumbnail = REPLACE(inv_thumbnail, '/images/', '/images/vehicles/');