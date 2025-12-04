import PySimpleGUI as sg

layout = [
    [sg.Text("Interfaz con PySimpleGUI")],
    [sg.Button("Saludar"), sg.Button("Salir")]
]

ventana = sg.Window("Ejemplo PySimpleGUI", layout)

while True:
    evento, valores = ventana.read()
    if evento in (sg.WINDOW_CLOSED, "Salir"):
        break
    if evento == "Saludar":
        sg.popup("¡Hola mundo con PySimpleGUI!")

ventana.close()
