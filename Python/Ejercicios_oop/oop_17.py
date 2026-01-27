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

def sonidos(animales):
    for animal in animales:
        print(animal.hablar())

perro1 = Perro("Albondiga")
gato1 = Gato("Manoplas")

sonidos([perro1, gato1])