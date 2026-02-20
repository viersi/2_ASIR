<?php
$host = "localhost";
$port = "3308";
$user = "root";
$password = "";
$database = "tienda_online";

$dsn = "mysql:host=$host;port=$port;dbname=$database";

try {
    $pdo = new PDO($dsn, $user, $password);
} catch (PDOException $e) {
    die("Error de conexión: " . $e->getMessage());
}
?>