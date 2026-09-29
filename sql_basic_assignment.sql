-- Database creation 
CREATE DATABASE IF NOT EXISTS sql_training;
USE sql_training;

-- ---------------------------------------------------------------------------
-- Table creation

-- Create authors table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100),
    country VARCHAR(50)
);

-- Books table
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    category VARCHAR(50),
    price DECIMAL(10,2),
    published_year INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- ---------------------------------------------------------------------------
-- Sample Authors
INSERT INTO Authors (author_id, author_name, country)
VALUES
(1, 'Robert Martin', 'USA'),
(2, 'James Clear', 'Canada'),
(3, 'Yuval Noah Harari', 'Israel'),
(4, 'Paulo Coelho', 'Brazil'),
(5, 'Khaled Hosseini', 'Afghanistan');


-- Sample Books
INSERT INTO Books (book_id, title, author_id, category, price, published_year)
VALUES
(1, 'Clean Code', 1, 'Programming', 750.00, 2008),
(2, 'The Clean Coder', 1, 'Programming', 650.00, 2011),
(3, 'Atomic Habits', 2, 'Self-Help', 550.00, 2018),
(4, 'The 5 AM Club', 2, 'Self-Help', 700.00, 2018),
(5, 'Sapiens', 3, 'History', 800.00, 2011),
(6, 'Homo Deus', 3, 'History', 900.00, 2015),
(7, 'The Alchemist', 4, 'Fiction', 450.00, 1988),
(8, 'The Archer', 4, 'Fiction', 600.00, 2020),
(9, 'Sea Prayer', 5, 'Fiction', 500.00, 2021),
(10, 'The Kite Runner', 5, 'Fiction', 850.00, 2003);

-- ---------------------------------------------------------------------------
-- Section 1: Basic Queries

-- Task 1: Display all books
SELECT *
FROM Books;

-- Task 2: Display only the book title and price.
SELECT title,price
FROM Books;

-- Task 3: Display the book title as Book Name and price as Book Price using column aliases.
SELECT title as 'Book Name',
       price as 'Book Price'
FROM Books;

-- Task 4: Display all unique book categories.
SELECT DISTINCT category
FROM Books;

-- ---------------------------------------------------------------------------
-- Section 2: Filtering Data

-- Task 5: Display books priced above ₹700.
SELECT *
FROM Books
WHERE price > 700;

-- Task 6: Display books priced between ₹500 and ₹800.
SELECT *
FROM Books
WHERE price BETWEEN 500 AND 800;

-- Task 7: Display books that belong to the Programming category.
SELECT *
FROM Books
WHERE category  = 'Programming';

-- Task 8: Display books whose titles start with the letter S.
SELECT *
FROM Books
WHERE title LIKE 'S%';

-- Task 9: Display books published after 2020.
SELECT *
FROM Books
WHERE published_year > 2020;

-- ---------------------------------------------------------------------------
-- Section 3: Sorting and Limiting Results

-- Task 10: Display books sorted by price in descending order.
SELECT *
FROM Books
ORDER BY price DESC;

-- Task 11: Display the top 3 most expensive books.
SELECT *
FROM Books
ORDER BY price DESC
LIMIT 3;

-- ---------------------------------------------------------------------------
-- Section 4: Aggregate Functions

-- Task 12: Find total number of books, total price,
-- average price, highest price, and lowest price

SELECT
    COUNT(*) AS 'Total Number of Books',
    SUM(price) AS 'Total Price of All Books',
    AVG(price) AS 'Average Book Price',
    MAX(price) AS 'Highest Book Price',
    MIN(price) AS 'Lowest Book Price'
FROM Books;

-- ---------------------------------------------------------------------------
-- Section 5: GROUP BY and HAVING

-- Task 13: Display the average book price for each category
SELECT
    category,
    AVG(price) AS 'Average Book Price'
FROM Books
GROUP BY category;

-- Task 14: Display categories whose average book price is greater than ₹650
SELECT
    category,
    AVG(price) AS 'Average Book Price'
FROM Books
GROUP BY category
HAVING AVG(price) > 650;

-- ---------------------------------------------------------------------------
-- Section 6: Joins

-- Task 15: Display each book along with its author's name using an INNER JOIN
SELECT
    Books.title,
    Authors.author_name
FROM Books
INNER JOIN Authors
    ON Books.author_id = Authors.author_id;

-- Task 16: Display all authors along with the books they have written using a LEFT JOIN
SELECT
    Authors.author_name,
    Books.title
FROM Authors
LEFT JOIN Books
    ON Authors.author_id = Books.author_id;

-- Task 17: Display all books along with their author details using a RIGHT JOIN
   SELECT Books.title, 
		  Authors.author_id, 
          Authors.author_name, 
          Authors.country
   FROM Authors
   RIGHT JOIN Books
       ON Books.author_id = Authors.author_id;

-- ---------------------------------------------------------------------------    
-- Section 7: Data Manipulation

-- Task 18: Insert a new book into the Books table
INSERT INTO Books (book_id, title, author_id, category, price, published_year)
VALUES (11, 'The Psychology of Money', 2, 'Finance', 600.00, 2020);

-- Task 19: Update the price of the book you inserted
UPDATE Books
SET price = 650.00
WHERE book_id = 11;

-- Task 20: Delete the book record that you inserted
DELETE FROM Books
WHERE book_id = 11;

-- ---------------------------------------------------------------------------
-- Section 8: Creating Tables and Constraints

-- Task 21: Create Publishers table
CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(100) NOT NULL UNIQUE,
    country VARCHAR(50),
    established_year INT DEFAULT 2000
);