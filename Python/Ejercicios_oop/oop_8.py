class Alumno:
    def __init__(self, nombre, nota):
        self.nombre = nombre
        self.nota = nota

class Clase:
    def __init__(self, alumnos):
        self.alumnos = alumnos
    def mediaNotas(self):
        notas = []
        for alumno in self.alumnos:
            notas.append(alumno.nota)
        return sum(notas) / len(notas)

alumno1 = Alumno("Jenny", 10)
alumno2 = Alumno("Andrea", 8)
alumno3 = Alumno("Diego", 7)
alumno4 = Alumno("Guille", 8)

ASIR = Clase([alumno1, alumno2, alumno3, alumno4])
print(f"Nota media: {ASIR.mediaNotas()}")