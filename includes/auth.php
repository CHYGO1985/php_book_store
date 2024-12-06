<?php
session_start();
require_once('db.php');

// User login
function login($username, $password) {
    $db = getDBConnection();
    $stmt = $db->prepare("SELECT * FROM users WHERE username = :username");
    $stmt->execute(['username' => $username]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user && password_verify($password, $user['password'])) {
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['role'] = $user['role'];
        return true;
    }
    return false;
}

// Check if user is login
function isLogin() {
  return isset($_SESSION['role']);
}

// Check if user is admin
function isAdmin() {
    return isset($_SESSION['role']) && $_SESSION['role'] === 'admin';
}

// Logout
function logout() {
    session_destroy();
    header("Location: login.php");
}
?>
