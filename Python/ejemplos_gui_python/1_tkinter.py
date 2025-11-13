import tkinter as tk
from tkinter import messagebox

def saludar():
    messagebox.showinfo("Saludo", "¡Hola mundo con Tkinter!")

ventana = tk.Tk()
ventana.title("Ejemplo Tkinter")
ventana.geometry("300x200")

tk.Label(ventana, text="Interfaz con Tkinter").pack(pady=10)
tk.Button(ventana, text="Saludar", command=saludar).pack(pady=10)

ventana.mainloop()
