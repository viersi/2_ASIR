class Producto:
    def __init__(self, nombre, precio):
        self.nombre = nombre
        self.precio = precio
    def aplicar_descuento(self, porcentaje):
        descuento = self.precio * porcentaje / 100
        self.precio -= descuento

Patata = Producto("Patata", 10)
print(f"Precio actual: {Patata.precio}")
Patata.aplicar_descuento(15)
print(f"Precio tras descuento: {Patata.precio}")