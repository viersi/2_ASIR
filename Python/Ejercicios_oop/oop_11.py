class Contacto:
    def __init__(self, nombre, telefono):
        self.nombre = nombre
        self.telefono = telefono
class Agenda:
    def __init__(self, contactos):
        self.contactos = contactos
    def filtrar(self, nombre):
        encontrado = False
        for contacto in self.contactos:
            if contacto.nombre == nombre:
                print(f"Nombre: {contacto.nombre}\nTelefono: {contacto.telefono}")
                encontrado = True
        if not encontrado:
            print("Ningun contacto con ese nombre")


Diego = Contacto("Diego", 654821937)
Jenny = Contacto("Jenny", 612345897)
Sebas = Contacto("Sebas", 685741923)
MiAgenda = Agenda([Diego, Jenny, Sebas])
MiAgenda.filtrar("Diego")
MiAgenda.filtrar("Jesus")