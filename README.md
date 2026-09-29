# SQL Basic Assignment

## Assignment Overview

This assignment demonstrates basic SQL concepts using an Online Bookstore database.

The assignment covers:

- Creating tables and defining constraints
- Inserting and retrieving data
- Filtering records using `WHERE`
- Sorting and limiting results
- Aggregate functions
- `GROUP BY` and `HAVING`
- `INNER JOIN`, `LEFT JOIN`, and `RIGHT JOIN`
- Inserting, updating, and deleting records
- Creating tables with SQL constraints

The SQL script contains all table creation statements, sample data, and queries for Tasks 1–21 in the same order as the assignment.

---

## Database Schema

### Authors

| Column | Data Type | Constraint |
|---|---|---|
| author_id | INT | PRIMARY KEY |
| author_name | VARCHAR(100) | |
| country | VARCHAR(50) | |

### Books

| Column | Data Type | Constraint |
|---|---|---|
| book_id | INT | PRIMARY KEY |
| title | VARCHAR(100) | |
| author_id | INT | FOREIGN KEY |
| category | VARCHAR(50) | |
| price | DECIMAL(10,2) | |
| published_year | INT | |

`Books.author_id` references `Authors.author_id`.

### Publishers

| Column | Data Type | Constraint |
|---|---|---|
| publisher_id | INT | PRIMARY KEY |
| publisher_name | VARCHAR(100) | NOT NULL, UNIQUE |
| country | VARCHAR(50) | |
| established_year | INT | DEFAULT 2000 |

---

## Steps to Execute the SQL Script

### 1. Install MySQL

Install:

- MySQL Community Server
- MySQL Workbench

### 2. Open MySQL Workbench

Open MySQL Workbench and connect to the local MySQL server using the `root` user.

### 3. Open the SQL Script

Open the `sql_basic_assignment.sql` file in MySQL Workbench.

### 4. Select the Database

The script creates and uses the `sql_training` database:

```sql
CREATE DATABASE IF NOT EXISTS sql_training;
USE sql_training;
```

### 5. Execute the Script

Run the SQL statements in order using the **Execute** button in MySQL Workbench.

The script will:

1. Create the `sql_training` database.
2. Create the `Authors` and `Books` tables.
3. Insert sample authors and books.
4. Execute Tasks 1–20.
5. Create the `Publishers` table for Task 21.

### 6. Verify the Tables

Run:

```sql
USE sql_training;

SHOW TABLES;
```

The following tables should be present:

```text
Authors
Books
Publishers
```

### 7. Verify the Data

To view the sample data:

```sql
SELECT * FROM Authors;

SELECT * FROM Books;
```

The SQL script can be executed using MySQL Workbench to reproduce the database structure, sample data, and assignment queries.
