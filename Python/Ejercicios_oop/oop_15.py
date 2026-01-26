class Producto:
    def __init__(self, nombre, precio):
        self._nombre = nombre
        self._precio = precio
    def get_nombre(self):
        return self._nombre
    def get_precio(self):
        return self._precio
    def set_nombre(self, nombre):
        self._nombre = nombre
    def set_precio(self, precio):
        self._precio = precio
    def aplicar_descuento(self, porcentaje):
        precio = self.get_precio()
        descuento = precio * porcentaje / 100
        precio -= descuento
        self.set_precio(precio)

Patata = Producto("Patata", 10)
print(Patata.get_precio())
Patata.aplicar_descuento(15)
print(Patata.get_precio())