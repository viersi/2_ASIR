class Jugador:
    def __init__(self, nombre, puntos):
        self.nombre = nombre
        self.puntos = puntos
class Juego:
    def __init__(self, jugadores):
        self.jugadores = jugadores
    def TopPlayer(self):
