<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>nuevo</title>
</head>
<body>
    <form action="insert.php" method="POST">
        <label>nombre</label><br>
        <input type="text" name="nombre" required><br>
        <label>consola</label><br>
        <input type="text" name="consola" required><br>
        <label>precio</label><br>
        <input type="text" name="precio" required><br>
        <label>stock</label><br>
        <input type="text" name="stock" required><br>
        <button type="submit">guardar</button>
    </form>
</body>
</html>