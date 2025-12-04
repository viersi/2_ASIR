from dearpygui.core import *
from dearpygui.simple import *

def saludar(sender, data):
    log_info("¡Hola mundo con Dear PyGui!")

with window("Ejemplo Dear PyGui"):
    add_text("Pulsa el botón para saludar")
    add_button("Saludar", callback=saludar)
    add_logger()

start_dearpygui()
