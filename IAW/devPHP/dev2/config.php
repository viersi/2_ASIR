<?php
$host = 'localhost';
$db = 'tienda_videojuegos';
$user = 'root';
$pass = '';
$port = 3308;

$dsn = "mysql:host=$host;dbname=$db;port=$port";

try {
    $pdo = new PDO($dsn, $user, $pass);
} catch (PDOException $e) {
    echo "<h1>No se puede conectar a $db</h1>";
    echo "<h3>" . $e->getMessage() . "</h3>";
}
?>