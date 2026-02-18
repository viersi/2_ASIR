<?php
session_start();

if (!isset($_SESSION['admin'])) {
    header('Location: login.php');
    exit();
}

require 'config.php';

$limit = 8;
$pagina = isset($_GET['pagina']) ? (int)$_GET['pagina'] : 1;
$offset = ($pagina - 1) * $limit;

$consola = $_GET['consola'] ?? '';

if ($consola) {
    $query = "SELECT * FROM productos WHERE consola = ? LIMIT ? OFFSET ?";
    $stmt = $pdo->prepare($query);
    $stmt->bindValue(1, $consola, PDO::PARAM_STR);
    $stmt->bindValue(2, $limit, PDO::PARAM_INT);
    $stmt->bindValue(3, $offset, PDO::PARAM_INT);
    $stmt->execute();
    $productos = $stmt->fetchAll();

    $countQuery = "SELECT COUNT(*) as total FROM productos WHERE consola = ?";
    $stmtCount = $pdo->prepare($countQuery);
    $stmtCount->execute([$consola]);
    $total = $stmtCount->fetch()['total'];
} else {
    $query = "SELECT * FROM productos LIMIT ? OFFSET ?";
    $stmt = $pdo->prepare($query);
    $stmt->bindValue(1, $limit, PDO::PARAM_INT);
    $stmt->bindValue(2, $offset, PDO::PARAM_INT);
    $stmt->execute();
    $productos = $stmt->fetchAll();
    
    $countQuery = "SELECT COUNT(*) as total FROM productos";
    $total = $pdo->query($countQuery)->fetch()['total'];
}

$totalPaginas = ceil($total / $limit);

if (isset($_GET['action']) && $_GET['action'] === 'add' && isset($_GET['id'])) {
    if (!isset($_SESSION['pedido'])) {
        $_SESSION['pedido'] = [];
    }
    $idProducto = (int)$_GET['id'];
    if (!in_array($idProducto, $_SESSION['pedido'])) {
        $_SESSION['pedido'][] = $idProducto;
    }
    header('Location: productos.php');
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventario - Tienda Videojuegos</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Inventario de Productos</h1>
    
    <nav>
        <a href="nuevo.php">Nuevo Producto</a> | 
        <a href="pedido.php">Mi Pedido (<?= count($_SESSION['pedido'] ?? []) ?>)</a>
    </nav>
    
    <h3>Filtrar por consola:</h3>
    <div>
        <a href="productos.php">Ver Todos</a> | 
        <a href="?consola=Switch">Switch</a> | 
        <a href="?consola=PS5">PS5</a> | 
        <a href="?consola=Xbox">Xbox</a> | 
        <a href="?consola=PC">PC</a>
    </div>
    
    <?php if ($consola): ?>
        <p>Mostrando: <strong><?= htmlspecialchars($consola) ?></strong></p>
    <?php endif; ?>
    
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Consola</th>
                <th>Precio</th>
                <th>Stock</th>
                <th>Acciones</th>
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
                <td>
                    <a href="?action=add&id=<?= $producto['id'] ?><?= $consola ? '&consola=' . $consola : '' ?><?= $pagina > 1 ? '&pagina=' . $pagina : '' ?>">
                        Añadir a Pedido
                    </a>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    
    <div>
        <p>Página <?= $pagina ?> de <?= $totalPaginas ?></p>
        
        <?php for ($i = 1; $i <= $totalPaginas; $i++): ?>
            <?php if ($i === $pagina): ?>
                <strong><?= $i ?></strong>
            <?php else: ?>
                <a href="?pagina=<?= $i ?><?= $consola ? '&consola=' . $consola : '' ?>"><?= $i ?></a>
            <?php endif; ?>
        <?php endfor; ?>
    </div>
</body>
</html>
