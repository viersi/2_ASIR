class Animal:
    def __init__(self, nombre):
        self.nombre = nombre
    def hablar(self):

class Perro:
    def hablar(self):
        return f"{self.nombre} "