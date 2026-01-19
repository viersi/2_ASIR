class Contador:
    def __init__(self):
        self.valor = 0
    def incrementar(self):
        self.valor += 1
    def decrementar(self):
        self.valor -= 1
    def resetear(self):
        self.valor = 0

counter = Contador()
counter.incrementar()
counter.incrementar()
counter.incrementar()
counter.incrementar()
print(counter.valor)
counter.decrementar()
print(counter.valor)
counter.resetear()
print(counter.valor)