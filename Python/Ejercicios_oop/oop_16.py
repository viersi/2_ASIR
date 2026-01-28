class Animal:
    def __init__(self, nombre):
        self.nombre = nombre
    def hablar(self):
#Usamos pass como un 'marcador vacio', ya que debe haber algo escrito, o tendremos un error de indentación
        pass
#Estas clases heredaran los atributos de la clase padre.
class Perro(Animal):
#La clase hija puede definir el comportamiento del metodo heredado para su caso concreto
    def hablar(self):
        return(f"Guau Guau")
class Gato(Animal):
    def hablar(self):
        return(f"Miau Miau")

perro1 = Perro("Albondiga")
gato1 = Gato("Manoplas")

print(f"{perro1.nombre} hace {perro1.hablar()}")
print(f"{gato1.nombre} hace {gato1.hablar()}")