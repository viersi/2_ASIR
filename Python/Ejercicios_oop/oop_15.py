class Producto:
    def __init__(self, nombre, precio):
#Al poner _ antes de un atributo lo hacemos privado, haciendo que no sea accesible desde fuera del objeto.
        self._nombre = nombre
        self._precio = precio
#Podemos usar un metodo del objeto que nos devuelva los atributos privados
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