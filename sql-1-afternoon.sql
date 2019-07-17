--TABLE - person
-- Create a table called person that records a person's id, name, age, height ( in cm ), city, favorite_color.
-- id should be an auto-incrementing id/primary key - Use type: SERIAL
-- Add 5 different people into the person database.
-- Remember to not include the person_id because it should auto-increment.
-- List all the people in the person table by height from tallest to shortest.
-- List all the people in the person table by height from shortest to tallest.
-- List all the people in the person table by age from oldest to youngest.
-- List all the people in the person table older than age 20.
-- List all the people in the person table that are exactly 18.
-- List all the people in the person table that are less than 20 and older than 30.
-- List all the people in the person table that are not 27 (Use not equals).
-- List all the people in the person table where their favorite color is not red.
-- List all the people in the person table where their favorite color is not red and is not blue.
-- List all the people in the person table where their favorite color is orange or green.
-- List all the people in the person table where their favorite color is orange, green or blue (use IN).
-- List all the people in the person table where their favorite color is yellow or purple (use IN).
CREATE TABLE person
(
    user_id serial PRIMARY KEY,
    name VARCHAR (50) NOT NULL,
    age INT NOT NULL,
    height INT NOT NULL,
    city VARCHAR (100) NOT NULL,
    favorite_color VARCHAR (30) NOT NULL

);

INSERT INTO person
    (user_id, name, age, height, city, favorite_color)
VALUES
    (1, 'Max', 12, 500, 'Arlington', 'Blue' ),
    (2, 'John', 21, 600, 'Dallas', 'White' ),
    (3, 'Jane', 32, 400, 'El Paso', 'Purple' ),
    (4, 'Rick', 43, 700, 'Georgia', 'Black' ),
    (5, 'Sam', 28, 5000, 'Arlington', 'Black' )

SELECT *
FROM person
ORDER BY height DESC
SELECT *
FROM person
ORDER BY height ASC
SELECT *
FROM person
ORDER BY age DESC
SELECT *
FROM person
WHERE age > 20
SELECT *
FROM person
WHERE age = 18
SELECT *
FROM person
WHERE age < 20 AND age > 30
SELECT *
FROM person
WHERE age != 27
SELECT *
FROM person
WHERE favorite_color NOT IN ('Red')
SELECT *
FROM person
WHERE favorite_color NOT IN ('Red', 'Blue')
SELECT *
FROM person
WHERE favorite_color IN ('Orange', 'Green')
SELECT *
FROM person
WHERE favorite_color IN ('Orange', 'Green', 'Blue')
SELECT *
FROM person
WHERE favorite_color IN ('Yellow', 'Purple')


-- Create a table called orders that records: order_id, person_id, product_name, product_price, quantity.
-- Add 5 orders to the orders table.
-- Make orders for at least two different people.
-- person_id should be different for different people.
-- Select all the records from the orders table.
-- Calculate the total number of products ordered.
-- Calculate the total order price.
-- Calculate the total order price by a single person_id.

CREATE TABLE orders
(
    order_id serial PRIMARY KEY,
    person_id INT NOT NULL,
    product_name VARCHAR (100) NOT NULL,
    product_price NUMERIC NOT NULL,
    quantity INT NOT NULL
);

INSERT INTO orders
    (order_id, person_id, product_name, product_price, quantity)
VALUES
    (1, 144, 'Carrot', 7, 3),
    (2, 2312, 'Rabbit', 9999, 1),
    (3, 33, 'Breadcrumbs', 1, 100),
    (4, 35, 'Mystery Meat', 15.50, 50),
    (5, 12, 'Caviar', 100, 2)

SELECT *
FROM orders
SELECT sum(quantity)
FROM orders
SELECT sum(product_price * quantity)
FROM orders
SELECT sum(product_price * quantity)
FROM orders
WHERE person_id = 12

--   Add 3 new artists to the artist table. ( It's already created )
-- Select 10 artists in reverse alphabetical order.
-- Select 5 artists in alphabetical order.
-- Select all artists that start with the word 'Black'.
-- Select all artists that contain the word 'Black'.

INSERT INTO artist
    (artist_id, name)
VALUES
    (300, 'Daft Punk'),
    (301, 'Dance With The Dead'),
    (302, 'Scattle')

SELECT *
FROM artist
ORDER BY name DESC LIMIT 10
SELECT * FROM artist
WHERE name LIKE 'A%' LIMIT 5
SELECT *
FROM artist
WHERE name LIKE '%' || 'Black' || '%';

-- List all employee first and last names only that live in Calgary.
-- Find the birthdate for the youngest employee.
-- Find the birthdate for the oldest employee.
-- Find everyone that reports to Nancy Edwards (Use the ReportsTo column).
-- You will need to query the employee table to find the Id for Nancy Edwards
-- Count how many people live in Lethbridge.

SELECT (first_name, last_name
) FROM employee WHERE city = 'Calgary'
SELECT *
FROM employee
ORDER BY birth_date DESC LIMIT 1
SELECT * FROM employee
ORDER BY birth_date ASC LIMIT 1
SELECT *
FROM employee
WHERE reports_to = 2;
SELECT COUNT (*)
FROM employee
WHERE city = 'Lethbridge'

-- Count how many orders were made from the USA.
-- Find the largest order total amount.
-- Find the smallest order total amount.
-- Find all orders bigger than $5.
-- Count how many orders were smaller than $5.
-- Count how many orders were in CA, TX, or AZ (use IN).
-- Get the average total of the orders.
-- Get the total sum of the orders.

SELECT COUNT(*)
FROM invoice
WHERE billing_country = 'USA'
SELECT max(total)
FROM invoice
SELECT min(total)
FROM invoice
SELECT *
FROM invoice
WHERE total > 5
SELECT COUNT(*)
FROM invoice
WHERE total < 5
SELECT COUNT(*)
FROM invoice
WHERE billing_state IN ('CA', 'TX', 'AZ')
SELECT avg(total)
FROM invoice
SELECT sum(total)
FROM invoice 
