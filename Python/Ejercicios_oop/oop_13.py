class Producto:
    def __init__(self, nombre, precio):
        self.nombre = nombre
        self.precio = precio
class Pedido:
    def __init__(self, numero, productos):
        self.numero = numero
        self.productos = productos
    def calcPrecio(self):
        total = 0
        for p in self.productos:
            total += p.precio
        print(f"El precio del pedido es: {total}")

Chorizo = Producto("Chorizo", 29.99)
Morcilla = Producto("Morcilla", 27.49)
Panceta = Producto("Panceta", 14.99)
pedido01 = Pedido(1, [Chorizo, Morcilla])
pedido02 = Pedido(2, [Panceta, Morcilla])
pedido03 = Pedido(3, [Panceta, Chorizo, Morcilla])
pedido01.calcPrecio()
pedido02.calcPrecio()
pedido03.calcPrecio()