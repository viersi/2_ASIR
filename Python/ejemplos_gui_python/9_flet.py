import flet as ft

def main(page: ft.Page):
    page.title = "Ejemplo con Flet"
    texto = ft.Text("Pulsa el botón para saludar")
    
    def saludar(e):
        texto.value = "¡Hola mundo con Flet!"
        page.update()

    boton = ft.ElevatedButton("Saludar", on_click=saludar)
    page.add(texto, boton)

ft.app(target=main)
