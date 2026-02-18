<?php
session_start();

if (!isset($_SESSION['admin'])) {
    header('Location: login.php');
    exit();
}

require 'config.php';

// ========== PROCESAR FORMULARIO ==========
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre = trim($_POST['nombre'] ?? '');
    $consola = trim($_POST['consola'] ?? '');
    $precio = $_POST['precio'] ?? '';
    $stock = $_POST['stock'] ?? '';
    
    // Validaciones
    $errores = [];
    
    if (empty($nombre)) {
        $errores[] = "El nombre es obligatorio";
    }
    
    if (empty($consola)) {
        $errores[] = "La consola es obligatoria";
    }
    
    if (!is_numeric($precio) || $precio < 0) {
        $errores[] = "El precio debe ser un número mayor o igual a 0";
    }
    
    if (!is_numeric($stock) || $stock < 0) {
        $errores[] = "El stock debe ser un número mayor o igual a 0";
    }
    
    // Si no hay errores, insertar
    if (empty($errores)) {
        $query = "INSERT INTO productos (nombre, consola, precio, stock) VALUES (?, ?, ?, ?)";
        $stmt = $pdo->prepare($query);
        $stmt->execute([$nombre, $consola, $precio, $stock]);
        
        header('Location: productos.php');
        exit();
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nuevo Producto - Tienda Videojuegos</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Añadir Nuevo Producto</h1>
    
    <nav>
        <a href="productos.php">← Volver al Inventario</a>
    </nav>
    
    <?php if (!empty($errores)): ?>
        <div style="color: red; border: 1px solid red; padding: 10px; margin: 10px 0;">
            <strong>Errores:</strong>
            <ul>
                <?php foreach ($errores as $error): ?>
                    <li><?= htmlspecialchars($error) ?></li>
                <?php endforeach; ?>
            </ul>
        </div>
    <?php endif; ?>
    
    <form method="POST">
        <div>
            <label for="nombre">Nombre del juego:</label><br>
            <input type="text" id="nombre" name="nombre" value="<?= htmlspecialchars($_POST['nombre'] ?? '') ?>" required>
        </div>
        
        <br>
        
        <div>
            <label for="consola">Consola:</label><br>
            <select id="consola" name="consola" required>
                <option value="">Selecciona...</option>
                <option value="Switch" <?= (isset($_POST['consola']) && $_POST['consola'] === 'Switch') ? 'selected' : '' ?>>Switch</option>
                <option value="PS5" <?= (isset($_POST['consola']) && $_POST['consola'] === 'PS5') ? 'selected' : '' ?>>PS5</option>
                <option value="Xbox" <?= (isset($_POST['consola']) && $_POST['consola'] === 'Xbox') ? 'selected' : '' ?>>Xbox</option>
                <option value="PC" <?= (isset($_POST['consola']) && $_POST['consola'] === 'PC') ? 'selected' : '' ?>>PC</option>
            </select>
        </div>
        
        <br>
        
        <div>
            <label for="precio">Precio (€):</label><br>
            <input type="number" id="precio" name="precio" step="0.01" min="0" value="<?= htmlspecialchars($_POST['precio'] ?? '') ?>" required>
        </div>
        
        <br>
        
        <div>
            <label for="stock">Stock:</label><br>
            <input type="number" id="stock" name="stock" min="0" value="<?= htmlspecialchars($_POST['stock'] ?? '') ?>" required>
        </div>
        
        <br>
        
        <button type="submit">Guardar Producto</button>
    </form>
</body>
</html>
