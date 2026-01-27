from datetime import datetime

class Logger:
    def __init__(self):
        self.historial = []
    def registrar(self, mensaje):
        timestamp = datetime.now().strftime("%d-%m-%y %H:%M:%S")
        entrada = f"[{timestamp}] {mensaje}"
        self.historial.append(entrada)
        print(f"Registrado: {entrada}")
    def mostrar_historial(self):
        if not self.historial:
            print("No hay mensajes registrados.")
        else:
            print("\n=== HISTORIAL COMPLETO ===")
            for entrada in self.historial:
                print(entrada)
            print("=== Fin historial ===\n")

logger = Logger()
logger.registrar("Primer mensaje")
logger.mostrar_historial()
logger.registrar("Segundo mensaje")
logger.registrar("ERROR CRITICO")
logger.registrar("ABORTANDO PROCESO")
logger.mostrar_historial()