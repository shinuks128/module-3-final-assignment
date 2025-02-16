CREATE DATABASE library;
USE library;

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) 
VALUES 
(1, 101, 'Main Street, City A', '1234567890'),
(2, 102, 'Highway Road, City B', '0987654321'),
(3, 103, 'Park Lane, City C', '1122334455'),
(4, 104, 'Seaside Blvd, City D', '2233445566'),
(5, 105, 'King Street, City E', '3344556677'),
(6, 106, 'North Avenue, City F', '4455667788'),
(7, 107, 'River Road, City G', '5566778899'),
(8, 108, 'Sunset Blvd, City H', '6677889900');
select * from Branch;

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) 
VALUES 
(108, 'John Doe', 'Manager', 60000, 6),
(109, 'Jane Smith', 'Clerk', 35000, 1),
(110, 'Alice Johnson', 'Manager', 65000, 2),
(111, 'Bob Brown', 'Assistant', 40000, 2),
(112, 'Charlie White', 'Clerk', 30000, 3),
(113, 'David Green', 'Manager', 70000, 4),
(114, 'Eva Blue', 'Assistant', 42000, 5),
(115, 'Frank Black', 'Clerk', 28000, 1);
select * from Employee;

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) 
VALUES 
(101, 'The Great Gatsby', 'Fiction', 30.00, 'Yes', 'F. Scott Fitzgerald', 'Scribner'),
(102, 'To Kill a Mockingbird', 'Fiction', 25.00, 'Yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
(103, '1984', 'Dystopian', 20.00, 'No', 'George Orwell', 'Secker & Warburg'),
(104, 'Moby Dick', 'Adventure', 35.00, 'Yes', 'Herman Melville', 'Harper & Brothers'),
(105, 'Pride and Prejudice', 'Romance', 28.00, 'No', 'Jane Austen', 'T. Egerton'),
(106, 'The Catcher in the Rye', 'Fiction', 22.00, 'Yes', 'J.D. Salinger', 'Little, Brown and Company'),
(107, 'The Hobbit', 'Fantasy', 40.00, 'Yes', 'J.R.R. Tolkien', 'George Allen & Unwin'),
(108, 'History of Time', 'History', 50.00, 'Yes', 'Leo Tolstoy', 'The Russian Messenger');
select * from Books;

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) 
VALUES 
(1, 'Michael Brown', 'Street 1, City A', '2021-05-10'),
(2, 'Sarah Lee', 'Avenue 2, City B', '2020-08-22'),
(3, 'James White', 'Boulevard 3, City C', '2019-11-05'),
(4, 'Linda Black', 'Lane 4, City D', '2022-03-16'),
(5, 'Robert Green', 'Park 5, City E', '2021-06-28'),
(6, 'William Blue', 'River 6, City F', '2020-12-12'),
(7, 'Elizabeth Gray', 'North Road 7, City G', '2022-01-03'),
(8, 'Barbara Red', 'East Ave 8, City H', '2021-07-18');
select * from Customer;

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) 
VALUES 
(1, 1, 'The Great Gatsby', '2023-06-10', 101),
(2, 2, '1984', '2023-06-15', 103),
(3, 3, 'Moby Dick', '2023-07-02', 104),
(4, 4, 'The Catcher in the Rye', '2023-06-25', 106),
(5, 5, 'The Hobbit', '2023-05-19', 107),
(6, 6, 'War and Peace', '2023-07-10', 108),
(7, 7, 'To Kill a Mockingbird', '2023-06-30', 102),
(8, 8, 'Pride and Prejudice', '2023-07-05', 105);
select * from IssueStatus;

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) 
VALUES 
(1, 1, 'The Great Gatsby', '2023-06-20', 101),
(2, 2, '1984', '2023-06-25', 103),
(3, 3, 'Moby Dick', '2023-07-10', 104),
(4, 4, 'The Catcher in the Rye', '2023-07-05', 106),
(5, 5, 'The Hobbit', '2023-06-30', 107),
(6, 6, 'War and Peace', '2023-07-15', 108),
(7, 7, 'To Kill a Mockingbird', '2023-07-05', 102),
(8, 8, 'Pride and Prejudice', '2023-07-15', 105);
select  * from ReturnStatus;

# 1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price 
FROM Books
WHERE Status = 'Yes';

# 2. List the employee names and their respective salaries in descending order of salary
SELECT Emp_name, Salary 
FROM Employee
ORDER BY Salary DESC;

# 3. Retrieve the book titles and the corresponding customers who have issued those books

SELECT Books.Book_title, Customer.Customer_name
FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

# 4.Display the total count of books in each category

SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

#6. List the customer names who registered before 2022-01-01 and have not issued any books yet.

SELECT Customer_name 
FROM Customer
WHERE Reg_date < '2022-01-01' 
  AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

#7. Display the branch numbers and the total count of employees in each branch.

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

#8.  Display the names of customers who have issued books in the month of June 2023. 

SELECT Customer.Customer_name
FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

#9. Retrieve book_title from book table containing history.

SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

#10. .Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

# 11. Retrieve the names of employees who manage branches and their respective branch addresses

SELECT Employee.Emp_name, Branch.Branch_address
FROM Employee
JOIN Branch ON Employee.Emp_Id = Branch.Manager_Id;

#12.  Display the names of customers who have issued books with a rental price higher than Rs. 25. Score Distribution

SELECT DISTINCT Customer.Customer_name
FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE Books.Rental_Price > 25;