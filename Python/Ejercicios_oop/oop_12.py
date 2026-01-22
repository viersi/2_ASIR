class Empleado:
    def __init__(self, nombre, salario):
        self.nombre = nombre
        self.salario = salario
class Empresa:
    def __init__(self, plantilla):
        self.plantilla = plantilla
    def GastoSalarios(self):
        total = 0
        for empleado in self.plantilla:
            total += empleado.salario
        print(f"Gasto total en salarios: {total}")

Diego = Empleado("Diego", 16576)
Jenny = Empleado("Jenny", 20000)
Sebastian = Empleado("Sebastian", 19745)
Medac = Empresa([Diego, Jenny, Sebastian])
Medac.GastoSalarios()