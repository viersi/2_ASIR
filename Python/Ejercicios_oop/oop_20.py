class Usuario:
    def __init__(self, nombre, telefono):
        self.nombre = nombre
        self.telefono = telefono
class Producto:
    def __init__(self, nombre, precio):
        self.nombre = nombre
        self.precio = precio
class Pedido:
    def __init__(self,id, usuario, producto, cantidad):
        self.id = id
        self.usuario = usuario
        self.producto = producto
        self.cantidad = cantidad
        self.precioTotal = 0
    def calcularPrecio(self):
        self.precioTotal = self.producto.precio * self.cantidad
        return self.precioTotal

Producto1 = Producto("Patata", 2)
Producto2 = Producto("Chorizo", 15)
Producto3 = Producto("Morcilla", 13)
Producto4 = Producto("Panceta", 9)

idPedido = 1
Usuarios = []
Productos = [Producto1, Producto2, Producto3, Producto4]
Pedidos = []

while True:
    print("1: Crear usuario")
    print("2: Ver catalogo")
    print("3: Crear pedidos")
    print("4: Consultar pedidos")
    print("5: Salir")
    opcion = input("Elige una opcion: ")

    if opcion == "1":
        nombre = input("Nombre: ")
        telefono = input("Teléfono (9 dígitos): ").strip()
        usuario = Usuario(nombre, telefono)
        Usuarios.append(usuario)
    elif opcion == "2":
        for p in Productos:
            print(f"Producto: {p.nombre} - Precio: {p.precio}")
    elif opcion == "3":
        usuario = input("Usuario: ").lower()
        while not any(u.nombre.lower() == usuario for u in Usuarios):
            usuario = input("Usuario no encontrado, introduce otro: ")
        usuarioObj = next(u for u in Usuarios if u.nombre.lower() == usuario)
        producto = input("Nombre de producto: ").strip().lower()
        while not any(p.nombre.lower() == producto for p in Productos):
            producto = input("Producto no encontrado, introduce otro: ")
        productoObj = next(p for p in Productos if p.nombre.lower() == producto)
        cantidad = int(input("Cantidad: "))
        while cantidad <= 0:
            print("Cantidad invalida")
            cantidad = int(input("Cantidad: "))
        pedido = Pedido(idPedido, usuarioObj, productoObj, cantidad)
        pedido.calcularPrecio()
        idPedido += 1
        Pedidos.append(pedido)
    elif opcion == "4":
        for p in Pedidos:
            print(f"Pedido {p.id}: {p.usuario.nombre} - Producto: {p.producto.nombre} - Precio: {p.precioTotal}€")
    elif opcion == "5":
        break
    else:
        print("Opcion no valida")