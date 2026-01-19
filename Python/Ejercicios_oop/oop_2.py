class CuentaBancaria:
    def __init__(self, titular):
        self.titular = titular
        self.saldo = 0
    def ingresar(self, cantidad):
        self.saldo += cantidad
    def retirar(self, cantidad):
        if self.saldo - cantidad < 0:
            print("Saldo insuficiente")
        else:
            self.saldo -= cantidad
    def mostrar_saldo(self):
        print(self.saldo)

Bankia = CuentaBancaria("Juan Perez")
Bankia.ingresar(10)
Bankia.ingresar(20)
Bankia.mostrar_saldo()

Santander = CuentaBancaria("Romeo Santos")
Santander.ingresar(100)
Santander.retirar(200)
Santander.mostrar_saldo()