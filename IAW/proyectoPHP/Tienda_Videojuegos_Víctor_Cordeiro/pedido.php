<?php
session_start();

if (!isset($_SESSION['admin'])) {
    header('Location: login.php');
    exit();
}

require 'config.php';

if (isset($_GET['action']) && $_GET['action'] === 'clear') {
    unset($_SESSION['pedido']);
    header('Location: pedido.php');
    exit();
}

$productos = [];
$total = 0;

if (!empty($_SESSION['pedido'])) {
    // Crear placeholders para IN (?, ?, ?)
    $placeholders = implode(',', array_fill(0, count($_SESSION['pedido']), '?'));
    
    $query = "SELECT * FROM productos WHERE id IN ($placeholders)";
    $stmt = $pdo->prepare($query);
    $stmt->execute($_SESSION['pedido']);
    $productos = $stmt->fetchAll();
    
    // Calcular total
    foreach ($productos as $producto) {
        $total += $producto['precio'];
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Pedido - Tienda Videojuegos</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Mi Lista de Pedido</h1>
    
    <nav>
        <a href="productos.php">← Volver al Inventario</a>
    </nav>
    
    <?php if (empty($productos)): ?>
        <p>No hay productos en tu lista de pedido.</p>
        <p><a href="productos.php">Añadir productos</a></p>
    <?php else: ?>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Consola</th>
                    <th>Precio</th>
                    <th>Stock</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($productos as $producto): ?>
                <tr>
                    <td><?= $producto['id'] ?></td>
                    <td><?= htmlspecialchars($producto['nombre']) ?></td>
                    <td><?= htmlspecialchars($producto['consola']) ?></td>
                    <td><?= number_format($producto['precio'], 2) ?>€</td>
                    <td><?= $producto['stock'] ?></td>
                </tr>
                <?php endforeach; ?>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="3"><strong>TOTAL:</strong></td>
                    <td colspan="2"><strong><?= number_format($total, 2) ?>€</strong></td>
                </tr>
            </tfoot>
        </table>
        
        <br>
        
        <a href="?action=clear" onclick="return confirm('¿Vaciar la lista de pedido?')">Vaciar Lista</a>
    <?php endif; ?>
</body>
</html>
