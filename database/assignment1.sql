

--#####.1. Create the classification Table 
CREATE TABLE classification (
    classification_id SERIAL PRIMARY KEY,
    classification_name VARCHAR NOT NULL
);

--#####.2. Create the inventory Table
CREATE TABLE inventory (
    inv_id SERIAL PRIMARY KEY,
    inv_make VARCHAR NOT NULL,
    inv_model VARCHAR NOT NULL,
    inv_year CHAR(4) NOT NULL,
    inv_description TEXT,
    inv_image VARCHAR,
    inv_thumbnail VARCHAR,
    inv_price NUMERIC(9,2) NOT NULL,
    inv_miles INTEGER NOT NULL,
    inv_color VARCHAR NOT NULL,
    classification_id INTEGER NOT NULL,
    CONSTRAINT fk_classification FOREIGN KEY (classification_id) 
        REFERENCES classification (classification_id) ON DELETE CASCADE
);

--#####.3. Create the account Table
CREATE TABLE account (
    account_id SERIAL PRIMARY KEY,
    account_firstname VARCHAR NOT NULL,
    account_lastname VARCHAR NOT NULL,
    account_email VARCHAR UNIQUE NOT NULL,
    account_password VARCHAR NOT NULL,
    account_type VARCHAR CHECK (account_type IN ('admin', 'user')) NOT NULL
);


--#####.4. Insert Sample Data

-- Insert into classification
INSERT INTO classification (classification_name) VALUES ('Sedan'), ('SUV'), ('Truck');

-- Insert into inventory
INSERT INTO inventory (inv_make, inv_model, inv_year, inv_description, inv_image, inv_thumbnail, inv_price, inv_miles, inv_color, classification_id)
VALUES 
('Toyota', 'Corolla', '2020', 'Reliable compact car', '/images/toyota_corolla.jpg', '/images/toyota_corolla_thumb.jpg', 20000.00, 30000, 'Blue', 1),
('Ford', 'Explorer', '2021', 'Spacious family SUV', '/images/ford_explorer.jpg', '/images/ford_explorer_thumb.jpg', 35000.00, 15000, 'Black', 2);

-- Insert into account
INSERT INTO account (account_firstname, account_lastname, account_email, account_password, account_type)
VALUES 
('John', 'Doe', 'john.doe@example.com', 'hashedpassword123', 'admin'),
('Jane', 'Smith', 'jane.smith@example.com', 'securepassword456', 'user');

--#####.5. Select Data Queries

-- View all classifications
SELECT * FROM classification;

-- View all inventory
SELECT * FROM inventory;

-- View all accounts
SELECT * FROM account;

-- Join Inventory with Classification
SELECT 
    inventory.inv_id, 
    inventory.inv_make, 
    inventory.inv_model, 
    inventory.inv_year, 
    classification.classification_name
FROM inventory
JOIN classification ON inventory.classification_id = classification.classification_id;
