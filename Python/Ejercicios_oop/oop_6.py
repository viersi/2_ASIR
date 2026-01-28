class Coche:
    def __init__(self, marca, modelo):
        self.marca = marca
        self.modelo = modelo
        self.velocidad = 0
    def acelerar(self, cantidad):
        try:
            if cantidad < 0:
#raise genera un error intencionadamente para que pueda ser manejado por un except.
                raise ValueError
            else:
                self.velocidad += cantidad
        except ValueError:
            print("Velocidad negativa")
        except TypeError:
            print("Parametro no valido")
    def frenar(self, cantidad):
        try:
            if cantidad < 0:
                raise ValueError
            elif self.velocidad - cantidad < 0:
                raise ValueError
            else:
                self.velocidad -= cantidad
        except ValueError:
            print("Velocidad negativa")
        except TypeError:
            print("Parametro no valido")

Golf = Coche("Volkswagen", "Golf")
Golf.acelerar(120)
print(f"Velocidad actual: {Golf.velocidad}")
Golf.frenar(-30)
Golf.frenar(200)
Golf.frenar("a")
Golf.frenar(100)
print(f"Velocidad actual: {Golf.velocidad}")