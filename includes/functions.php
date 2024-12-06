<?php
require_once('db.php');

// Add new book to database
function addBook($title, $author, $publication_date, $isbn13, $description, $cover_image) {
    $db = getDBConnection();
    $stmt = $db->prepare("INSERT INTO books (title, author, publication_date, isbn13, description, cover_image) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->execute([$title, $author, $publication_date, $isbn13, $description, $cover_image]);
}

// Get all books in stock
function getBooksInStock() {
    $db = getDBConnection();
    $stmt = $db->prepare("SELECT * FROM books WHERE stock_quantity > 0");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Update stock quantity
function updateBookStock($book_id, $quantity) {
    $db = getDBConnection();
    $stmt = $db->prepare("UPDATE books SET stock_quantity = ? WHERE id = ?");
    $stmt->execute([$quantity, $book_id]);
}
?>
