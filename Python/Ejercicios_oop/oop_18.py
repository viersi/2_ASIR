class Vehiculo:
    def __init__(self, marca):
        self.marca = marca
        self.velocidad = 0
    def acelerar(self, velocidad):
        self.velocidad = velocidad
class Coche(Vehiculo):
    def acelerar(self, velocidad):
        if velocidad <= 200:
            self.velocidad = velocidad
            print(f"Acelerando a: {self.velocidad}km/h")
        else:
            print(f"No se puede acelerar a más de 200km/h")
class Moto(Vehiculo):
    def acelerar(self, velocidad):
        if velocidad <= 160:
            self.velocidad = velocidad
            print(f"Acelerando a: {self.velocidad}km/h")
        else:
            print(f"La moto vibra mucho a {velocidad}km/h")

coche1 = Coche("Golf")
moto1 = Moto("Yamaha")
coche1.acelerar(180)
coche1.acelerar(300)
moto1.acelerar(180)
moto1.acelerar(160)