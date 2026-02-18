<?php
require 'config.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nombre = $_POST['nombre'];
    $consola = $_POST['consola'];
    $precio = $_POST['precio'];
    $stock = $_POST['stock'];

    $stmt = $pdo->prepare("INSERT INTO productos (nombre, consola, precio, stock) VALUES (:nombre, :consola, :precio, :stock)");
    $stmt->bindValue(':nombre', $nombre);
    $stmt->bindValue(':consola', $consola);
    $stmt->bindValue(':precio', $precio);
    $stmt->bindValue(':stock', $stock, PDO::PARAM_INT);
    $stmt->execute();

    header('Location: table.php');
}
?>
