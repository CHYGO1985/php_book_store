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

-- Tbale shopping cart
CREATE TABLE cart (
    id INT AUTO_INCREMENT PRIMARY KEY,        -- Unique cart item ID
    user_id INT NOT NULL,                     -- The ID of the user who owns the cart
    book_id INT NOT NULL,                     -- The ID of the book from the books table
    name VARCHAR(255) NOT NULL,               -- The name of the book
    cover_image VARCHAR(255) NOT NULL,        -- Thumbnail URL for the book cover image
    price DECIMAL(10, 2) NOT NULL,            -- The unit price of the book
    quantity INT NOT NULL DEFAULT 1,          -- Quantity of the book in the cart
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp when the cart item was added
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Last updated timestamp
    -- Foreign keys
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE, -- Links to the users table
    FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE -- Links to the books table
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