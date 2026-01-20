class Libro:
    def __init__(self, titulo, autor, fecha, isbn):
        self.titulo = titulo
        self.autor = autor
        self.fecha = fecha
        self.isbn = isbn
#Metodo 'mágico' de Python para mostrar el contenido de un objeto cuando lo incluyamos en un print.
#Sin él, Python nos mostraria la dirección en memoria donde se almacena.
    def __str__(self):
        return( f"{self.titulo} | {self.autor} | {self.fecha} | ISBN:{self.isbn}")

class Biblioteca:
    def __init__(self):
        self.libros = []
    def addLibro(self, libro):
        self.libros.append(libro)
        print(f"Libro: {libro.titulo} añadido")
    def mostrarBiblioteca(self):
        for libro in self.libros:
            print(libro)

libro1 = Libro("El Quijote", "Cervantes", 1605, "978-456-123")
libro2 = Libro("1984", "Orwell", 1949, "198-448-914")
libro3 = Libro("Frankenstein", "Mary Shelley", 1818, "590-047-686")
libro4 = Libro("Fausto", "Goethe", 1808, "666-999-666")

bibliotecaClasica = Biblioteca()
bibliotecaClasica.addLibro(libro1)
bibliotecaClasica.addLibro(libro2)
bibliotecaClasica.addLibro(libro3)
bibliotecaClasica.addLibro(libro4)
bibliotecaClasica.mostrarBiblioteca()