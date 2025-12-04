import tkinter as tk
from tkinter import messagebox

def saludar():
    messagebox.showinfo("Saludo", "¡Hola mundo con Tkinter!")
    messagebox.showinfo("tung tung tung tung tung tung sahur!", "tung tung tung tung tung tung sahur!")
    messagebox.showerror("Error", "Algo salió mal")

def test():
    messagebox.showinfo("Hola papi", "Ñiñelmo mi rey")
    messagebox.showinfo("sal ya", "te pires ya coññññooooo")

ventana = tk.Tk()
ventana.title("Ejemplo Tkinter")
ventana.geometry("500x500")

tk.Label(ventana, text="Interfaz con Tkinter").pack(pady=20)
tk.Button(ventana, text="Saludar", command=saludar).pack(pady=20)
tk.Button(ventana, text="New Game +", command=test).pack(pady=10)

ventana.mainloop()
