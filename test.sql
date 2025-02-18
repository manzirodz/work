-- ---------------------- Create Tables -----------------------------------------------
CREATE TABLE Customers (
    customer_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50)
);

CREATE TABLE Products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100),
    price NUMBER
);

CREATE TABLE Orders (
    order_id NUMBER PRIMARY KEY,
    order_date DATE,
    customer_id NUMBER,
    product_id NUMBER,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Students (
    student_id NUMBER PRIMARY KEY,
    student_name VARCHAR2(100)
);

CREATE TABLE Courses (
    course_id NUMBER PRIMARY KEY,
    course_name VARCHAR2(100)
);

-- Many-to-Many Relationship
CREATE TABLE Enrollment (
    student_id NUMBER,
    course_id NUMBER,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

------------------- JOIN ---------------------------
SELECT c.first_name, o.order_date, p.product_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Products p ON o.product_id = p.product_id;

------------------- DML ----------------------------------
-- Insert Data
INSERT INTO Customers (customer_id, first_name, last_name) VALUES (1, 'John', 'Doe');
INSERT INTO Products (product_id, product_name, price) VALUES (1, 'Laptop', 999.99);
INSERT INTO Orders (order_id, order_date, customer_id, product_id) VALUES (101, SYSDATE, 1, 1);

-- Update Data
UPDATE Customers SET first_name = 'Jane' WHERE customer_id = 1;

-- Delete Data
DELETE FROM Orders WHERE order_id = 101;

--------------- DCL and TCL -------------------------------------------------------
-- Granting Privileges (DCL)
GRANT SELECT, INSERT ON Customers TO user_name;

-- Committing a Transaction (TCL)
INSERT INTO Customers (customer_id, first_name, last_name) VALUES (2, 'Alice', 'Smith');
COMMIT;

------------------------ Executing Basic -----------------------------------
-- SELECT
SELECT * FROM Customers;

-- INSERT
INSERT INTO Orders (order_id, order_date, customer_id, product_id) VALUES (102, SYSDATE, 1, 1);

-- UPDATE
UPDATE Orders SET order_date = SYSDATE WHERE order_id = 102;

-- DELETE
DELETE FROM Orders WHERE order_id = 102;

--------------------------------------------------------
-- Inner Join 
SELECT c.first_name, o.order_date, p.product_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Products p ON o.product_id = p.product_id;

-- Subquery Example 
SELECT first_name, last_name 
FROM Customers 
WHERE customer_id NOT IN (SELECT customer_id FROM Orders);
