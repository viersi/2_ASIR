import tkinter as tk
from tkinter import *

def sumar():
    try:
        num1 = float(entrada1.get())
        num2 = float(entrada2.get())
        resultado = num1 + num2
        resultado_lb.config(text=f"{resultado}")
    except ValueError:
        resultado_lb.config(text="Entrada no valida")

def restar():
    try:
        num1 = float(entrada1.get())
        num2 = float(entrada2.get())
        resultado = num1 - num2
        resultado_lb.config(text=f"{resultado}")
    except ValueError:
        resultado_lb.config(text="Entrada no valida")

def multiplicar():
    try:
        num1 = float(entrada1.get())
        num2 = float(entrada2.get())
        resultado = num1 * num2
        resultado_lb.config(text=f"{resultado}")
    except ValueError:
        resultado_lb.config(text="Entrada no valida")
    
def dividir():
    try:
        num1 = float(entrada1.get())
        num2 = float(entrada2.get())
        resultado = num1 / num2
        resultado_lb.config(text=resultado)
    except (ValueError, ZeroDivisionError):
        resultado_lb.config(text="Entrada no valida")

ventana = tk.Tk()

ventana.title("Calculadora Simple")
ventana.geometry("300x300")

etiqueta1 = tk.Label(ventana, text="Primer número:")
etiqueta1.grid(row=0,columnspan=4)

entrada1 = tk.Entry(ventana)
entrada1.grid(row=1,columnspan=4)

etiqueta2 = tk.Label(ventana, text="Segundo número:")
etiqueta2.grid(row=2,columnspan=4)

entrada2 = tk.Entry(ventana)
entrada2.grid(row=3,columnspan=4)

tk.Button(ventana, text="+", command=sumar).grid(row=4, column=0)
tk.Button(ventana, text="-", command=restar).grid(row=4, column=1)
tk.Button(ventana, text="*", command=multiplicar).grid(row=4, column=2)
tk.Button(ventana, text="/", command=dividir).grid(row=4, column=3)

resultado_titulo = tk.Label(ventana, text="Resultado:")
resultado_titulo.grid(row=5, columnspan=4)
resultado_lb = tk.Label(ventana, text="")
resultado_lb.grid(row=6, columnspan=4)

ventana.mainloop()