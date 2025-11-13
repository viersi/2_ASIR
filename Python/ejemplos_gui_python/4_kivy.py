from kivy.app import App
from kivy.uix.button import Button
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.label import Label

class MiApp(App):
    def build(self):
        layout = BoxLayout(orientation='vertical', padding=20)
        self.label = Label(text="Interfaz con Kivy")
        boton = Button(text="Saludar")
        boton.bind(on_press=self.saludar)
        layout.add_widget(self.label)
        layout.add_widget(boton)
        return layout

    def saludar(self, instance):
        self.label.text = "¡Hola mundo con Kivy!"

MiApp().run()
