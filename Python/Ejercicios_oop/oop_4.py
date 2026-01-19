class Alumno:
    def __init__(self, nombre, nota):
        self.nombre = nombre
        self.nota = nota
    def aprobado(self):
        if self.nota >= 5:
            return True
        else:
            return False

Victor = Alumno("Victor", 10)
print(f"Aprobado: {Victor.aprobado()}")