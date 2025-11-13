import customtkinter as ctk
from tkinter import messagebox

def saludar():
    messagebox.showinfo("Saludo", "¡Hola mundo con CustomTkinter!")

ventana = ctk.CTk()
ventana.title("Ejemplo CustomTkinter")
ventana.geometry("300x200")

boton = ctk.CTkButton(ventana, text="Saludar", command=saludar)
boton.pack(pady=20)

ventana.mainloop()
