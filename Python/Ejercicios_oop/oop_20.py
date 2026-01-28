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

#Creamos unos productos para el catalogo
Producto1 = Producto("Patata", 2)
Producto2 = Producto("Chorizo", 15)
Producto3 = Producto("Morcilla", 13)
Producto4 = Producto("Panceta", 9)

#Creamos unas listas para el catalogo, historial de pedidos y lista de usuarios.
#Creamos tambien un contador para que los ids de los pedidos vayan incrementando de manera automatica.
idPedido = 1
Usuarios = []
Productos = [Producto1, Producto2, Producto3, Producto4]
Pedidos = []

#Generamos un bucle while True en este caso ya que no permite mantener una estructura más sencilla
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
#any() busca si al menos un elemento cumple la condicion.
#usamos el bucle for para extraer el atributo nombre de la lista de objetos usuario
        while not any(u.nombre.lower() == usuario for u in Usuarios):
            usuario = input("Usuario no encontrado, introduce otro: ")
#Guardamos todo el objeto en una variable.
#la funcion next() devuelve el primer objeto en el que el valor de la clave requerida coincida con el input del usuario
        usuarioObj = next(u for u in Usuarios if u.nombre.lower() == usuario)
        producto = input("Nombre de producto: ").strip().lower()
        while not any(p.nombre.lower() == producto for p in Productos):
            producto = input("Producto no encontrado, introduce otro: ")
        productoObj = next(p for p in Productos if p.nombre.lower() == producto)
        cantidad = int(input("Cantidad: "))
        while cantidad <= 0:
            print("Cantidad invalida")
            cantidad = int(input("Cantidad: "))
#Pasamos los objetos usuario y producto como parametro al pedido para que podamos acceder a sus atributos más adelante
        pedido = Pedido(idPedido, usuarioObj, productoObj, cantidad)
#Usamos el metodo para calcular precio y asi modificar el atributo del objeto
        pedido.calcularPrecio()
#Aumentamos el contador para que el siguiente pedido tenga un id distinto
        idPedido += 1
        Pedidos.append(pedido)
    elif opcion == "4":
        for p in Pedidos:
#Al pasar objetos como parametros, podemos acceder a los atributos de esos objetos almacenados.
            print(f"Pedido {p.id}: {p.usuario.nombre} - Producto: {p.producto.nombre} - Precio: {p.precioTotal}€")
    elif opcion == "5":
#Salimos del bucle de manera sencilla para este caso concreto.
        break
    else:
        print("Opcion no valida")