<?php
include('../includes/auth.php');
header('Content-Type: application/json');

// Check if user sent a POST request
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    if (isset($data['username']) && isset($data['password'])) {
        $username = $data['username'];
        $password = $data['password'];

        if (login($username, $password)) {
            echo json_encode(["message" => "Login successful"]);
        } else {
            echo json_encode(["message" => "Invalid credentials"]);
        }
    } else {
        echo json_encode(["message" => "Username and password are required"]);
    }
}
?>
