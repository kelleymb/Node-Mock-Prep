--- GET ALL RESTAURANTS
SELECT * FROM restaurants;

--- GET ALL ITALIAN RESTAURANTS
SELECT * FROM restaurants WHERE cuisine = 'Italian';

--- GET 10 ITALIAN RESTAURANTS, SUBSET OF FIELDS
--- RETURN ID AND NAME FIELDS
SELECT id, name FROM restaurants WHERE cuisine = 'Italian' LIMIT 10;

--- COUNT OF THAI RESTAURANTS
SELECT COUNT(*) FROM restaurants WHERE cuisine = 'Thai';

--- COUNT OF RESTAURANTS
SELECT COUNT(*) FROM restaurants;

-- COUNT OF THAI RESTAURANTS IN ZIP CODE
--- 11372
SELECT COUNT(*) FROM restaurants WHERE cuisine = 'Thai' AND address_zipcode = '11372';

--- ITALIAN RESTAURANTS IN ONE OF SEVERAL ZIP CODES
SELECT id, name FROM restaurants WHERE cuisine = 'Italian' 
AND address_zipcode in ('10012', '10013', '10014') ORDER BY name ASC LIMIT 5;

--- CREATE A RESTAURANT
INSERT INTO restaurants
(name, borough, cuisine, address_building_number, address_street, address_zipcode)
VALUES 
('Byte Cafe', 'Brooklyn', 'coffee', '123', 'Atlantic Avenue', '11231');

--- CREATE A RESTAURANT AND RETURN ID AND NAME
INSERT INTO restaurants
(name, borough, cuisine, address_building_number, address_street, address_zipcode)
VALUES 
('Frosty', 'Brooklyn', 'icecream', '555', 'Baltic Avenue', '11231') RETURNING id, name;

--- CREATE 3 RESTAURANTS AND RETURN ID AND NAME
INSERT INTO restaurants
(name, borough, cuisine, address_building_number, address_street, address_zipcode)
VALUES 
('Pub', 'Brooklyn', 'fruity', '876', 'Atlantic Avenue', '11231'),
('Ello', 'Brooklyn', 'gourmet', '432', 'Atlantic Avenue', '11231'),
('Goodbye', 'Brooklyn', 'peaches', '321', 'Atlantic Avenue', '11231') RETURNING id, name;

--- UPDATE A RECORD
UPDATE restaurants
SET name = 'DJ Reynolds Pub and Restaurant'
WHERE nyc_restaurant_id = '30191841';

--- DELETE BY ID
DELETE FROM grades
WHERE id = 10;

--- A BLOCKED DELETE, COPY AND PASTE ERROR 
DELETE FROM restaurants
where id = 22;
--- SQL Error [23503]: 
--- ERROR: update or delete on table "restaurants" violates foreign key constraint "grades_restaurant_id_fkey" on table "grades"
--- Detail: Key (id)=(22) is still referenced from table "grades".

--- CREATE A TABLE
--- Note that the borough property requires you to use an enumerated type,
--- which is a list of set values you can use for a property. 
--- You can use an existing enumerated type that will already be in the table: borough_options.
CREATE TABLE inspectors (
id serial PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
borough borough_options
);

--- UPDATE A TABLE
ALTER TABLE grades 
ADD COLUMN notes text NULL;

--- DROP A TABLE
DROP TABLE inspectors;

