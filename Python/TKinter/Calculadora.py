import tkinter as tk
from tkinter import *

def sumar():
    num1 = float(entrada1.get())
    num2 = float(entrada2.get())
    resultado = num1 + num2
    resultado_lb.config(text=f"{num1 + num2}")

def restar():
    num1 = float(entrada1.get())
    num2 = float(entrada2.get())
    resultado = num1 - num2
    resultado_lb.config(text=f"{resultado}")

def multiplicar():
    num1 = float(entrada1.get())
    num2 = float(entrada2.get())
    resultado = num1 * num2
    resultado_lb.config(text=f"{resultado}")
def dividir():
    num1 = float(entrada1.get())
    num2 = float(entrada2.get())
    resultado = num1 / num2
    resultado_lb.config(text=resultado)

ventana = tk.Tk()

ventana.title("Calculadora Simple")
ventana.geometry("500x500")

etiqueta1 = tk.Label(ventana, text="Primer número:")
etiqueta1.pack()

entrada1 = tk.Entry(ventana)
entrada1.pack()

etiqueta2 = tk.Label(ventana, text="Segundo número:")
etiqueta2.pack()

entrada2 = tk.Entry(ventana)
entrada2.pack()

tk.Button(ventana, text="+", command=sumar).pack()
tk.Button(ventana, text="-", command=restar).pack()
tk.Button(ventana, text="*", command=multiplicar).pack()
tk.Button(ventana, text="/", command=dividir).pack()

resultado_lb = tk.Label(ventana, text="resultado")
resultado_lb.pack()

ventana.mainloop()
