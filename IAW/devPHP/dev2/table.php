<?php
require 'config.php';

$pageobj = 4;

$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;

$offset = ($page - 1) * $pageobj;

$filtro = isset($_GET['filtro']) ? $_GET['filtro'] : '';

if (!empty($filtro)) {
    $stmt = $pdo->prepare("SELECT * FROM productos WHERE consola = :filtro LIMIT :limit OFFSET :offset");
    $stmt->bindValue(':filtro', $filtro);
    $stmt->bindValue(':limit', $pageobj, PDO::PARAM_INT);
    $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
    $stmt->execute();
    $datos = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $stmtCount = $pdo->prepare("SELECT COUNT(*) FROM productos WHERE consola = :filtro");
    $stmtCount->execute([':filtro' => $filtro]);
    $rowcount = $stmtCount->fetchColumn();
} else {
    $stmt = $pdo->prepare("SELECT * FROM productos LIMIT :limit OFFSET :offset");
    $stmt->bindValue(':limit', $pageobj, PDO::PARAM_INT);
    $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
    $stmt->execute();
    $datos = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $rowcount = $pdo->query("SELECT COUNT(*) FROM productos")->fetchColumn();
}
$totalpages = ceil($rowcount / $pageobj);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TABLA</title>
</head>
<body>
    <form method="GET">
        <input type="text" name="filtro" placeholder="busqueda por consola">
        <button type="submit">buscar</button>
    <table border="1">
        <tr>
            <?php foreach(array_keys($datos[0]) as $columna): ?>
                <th><?= $columna ?></th>
            <?php endforeach; ?>
        </tr>
        <?php foreach($datos as $fila): ?>
            <tr>
                <?php foreach($fila as $celda): ?>
                    <td><?= $celda ?></td>
                <?php endforeach ?>
            </tr>
        <?php endforeach; ?>
    </table>
    <p>
        <?php for($i = 1; $i <= $totalpages; $i++): ?>
            <?php if($i == $page): ?>
                <strong><?= $i ?></strong>
            <?php else: ?>
                <a href="?page=<?= $i ?>"><?= $i ?></a>
            <?php endif; ?>
        <?php endfor; ?>
    </p>
    <a href="/..">inicio</a>
    <a href="new.php">pedido</a>
</body>
</html>