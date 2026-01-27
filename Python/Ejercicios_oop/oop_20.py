class Usuario
    def __init__(self, nombre):
        self.nombre = nombre
class Producto:
    def __init__(self, nombre, precio):
        self.nombre = nombre
        self.precio = precio
class Pedido:
    def __init__(self, usuario, producto, cantidad):
        self.usuario = usuario
        self.producto = producto
        self.cantidad = cantidad
    def precio(self):
        return self.producto.precio * self.cantidad