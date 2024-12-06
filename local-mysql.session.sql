-- Table for users
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'user') DEFAULT 'user'
);

-- Table for books
CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publication_date DATE,
    isbn13 VARCHAR(13) NOT NULL UNIQUE,
    description TEXT,
    cover_image VARCHAR(255),
    price FLOAT NOT NULL DEFAULT 0,
    stock_quantity INT DEFAULT 0,
    currency CHAR(3) NOT NULL DEFAULT 'GBP' 
);

DROP TABLE books;

SELECT * FROM users;

-- delete all records in users
TRUNCATE TABLE users;

-- delete one row
DELETE FROM users WHERE id = 2;

-- Insert into table
INSERT INTO users (username, password, role)
VALUES ('admin', 'p455w0rd', 'admin');

SELECT * FROM books;