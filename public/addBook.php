<?php
include('../includes/functions.php');
include('../includes/auth.php');
header('Content-Type: application/json');

if (isAdmin() && $_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);

    if (isset($data['title'], $data['author'], $data['publication_date'], $data['isbn13'], $data['description'])) {
        $title = $data['title'];
        $author = $data['author'];
        $publication_date = $data['publication_date'];
        $isbn13 = $data['isbn13'];
        $description = $data['description'];

        // Assuming cover_image is uploaded as base64 encoded string
        $cover_image = isset($data['cover_image']) ? $data['cover_image'] : '';

        addBook($title, $author, $publication_date, $isbn13, $description, $cover_image);
        echo json_encode(["message" => "Book added successfully"]);
    } else {
        echo json_encode(["message" => "Missing required fields"]);
    }
} else {
    echo json_encode(["message" => "Unauthorized"]);
}
?>
