class Persona:
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad
    def saludar(self):
        print(f"Hola, me llamo {self.nombre} y tengo {self.edad}")

Guille = Persona("Guillermo", 37)
Guille.saludar()

Andrea = Persona("Andrea", 40)
Andrea.saludar()