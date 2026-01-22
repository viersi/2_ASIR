
class Tienda:
    def __init__(self, catalogo):
        self.catalogo = catalogo
    def calcPrecio(self):
        total = 0
        for producto in self.catalogo:
            total += producto.prclass Producto:
    def __init__(self, nombre, precio):
        self.nombre = nombre
        self.precio = precioecio
        print(f"Precio total de todo el stock: {total}")

Chorizo = Producto("Chorizo", 29.99)
Morcilla = Producto("Morcilla", 27.49)
Panceta = Producto("Panceta", 14.99)
Consum = Tienda([Chorizo, Morcilla, Panceta])
Consum.calcPrecio()