class Animal:
    def __init__(self, nombre):
        self.nombre = nombre
    def hablar(self):
        pass
class Perro(Animal):
    def hablar(self):
        return(f"Guau Guau")
class Gato(Animal):
    def hablar(self):
        return(f"Miau Miau")

perro1 = Perro("Albondiga")
gato1 = Gato("Manoplas")

print(f"{perro1.nombre} hace {perro1.hablar()}")
print(f"{gato1.nombre} hace {gato1.hablar()}")