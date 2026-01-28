class Jugador:
    def __init__(self, nombre, puntos):
        self.nombre = nombre
        self.puntos = puntos
class Juego:
    def __init__(self, jugadores):
        self.jugadores = jugadores
    def TopPlayer(self):
#La función max() busca un máximo en una lista.
#key = lambda crea una función anonima que usa los puntos de cada jugador para pasarselos a la función max()
        mejor = max(self.jugadores, key = lambda p: p.puntos)
        print(f"Mejor jugador: {mejor.nombre} --> {mejor.puntos} puntos")

Jenny = Jugador(nombre="Jenny", puntos=5)
Victor = Jugador(nombre="Victor", puntos=1000000)
Andrea = Jugador(nombre="Andrea", puntos=8)

Isaac = Juego(jugadores = [Jenny, Victor, Andrea])

Isaac.TopPlayer()