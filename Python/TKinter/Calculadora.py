#Importamos las librerias necesarias para crear interfaces.
#Le damos el alias tk a Tkinter para que sea mas sencillo acceder a sus recursos.
import tkinter as tk
from tkinter import *

#Definimos las 4 funciones que vamos a usar, una para cada operación.
#Función sumar.
def sumar():
#Usamos la estructura try para gestionar el manejo de errores. El bloque try ejecuta el codigo
#que incluyamos en él. En caso de haber un error durante la ejecución, se ejecutara el bloque except
#que corresponda con el error obtenido.
    try:
#Pasamos a float cada una de las entradas de nuestros dos entry, ya que por defecto se obtienen como string.
        num1 = float(entrada1.get())
        num2 = float(entrada2.get())
#Almacenamos en una variable el resultado de la operación.
        resultado = num1 + num2
#Mandamos el resultado a la etiqueta que hemos configurado para mostrarlo en la interfaz.
        resultado_lb.config(text=resultado, fg="black")
#En el bloque except indicamos la acción que se va realizar en caso de obtener un error en el bloque try.
#Para nuestro caso en la mayoria de operaciones el error sera un error de valor, ya que la funcion float()
#no puede convertir un valor alfabetico a numerico.
    except ValueError:
#Usamos fg para cambiar el color del texto a rojo en caso de obtener un error.
        resultado_lb.config(text="Entrada no valida", fg="red")

#Función restar.
def restar():
    try:
        num1 = float(entrada1.get())
        num2 = float(entrada2.get())
        resultado = num1 - num2
        resultado_lb.config(text=resultado, fg="black")
    except ValueError:
        resultado_lb.config(text="Entrada no valida", fg="red")

#Función multiplicar.
def multiplicar():
    try:
        num1 = float(entrada1.get())
        num2 = float(entrada2.get())
        resultado = num1 * num2
        resultado_lb.config(text=resultado, fg="black")
    except ValueError:
        resultado_lb.config(text="Entrada no valida", fg="red")

#Función dividir.    
def dividir():
    try:
        num1 = float(entrada1.get())
        num2 = float(entrada2.get())
        resultado = num1 / num2
        resultado_lb.config(text=resultado, fg="black")
#Añadimos el error resultante de dividir un numero entre cero. 
    except (ValueError, ZeroDivisionError):
        resultado_lb.config(text="Entrada no valida", fg="red")

#Creamos la ventana principal y la nombramos como ventana.
ventana = tk.Tk()

#Le damos un titulo a nuestra ventana.
ventana.title("Calculadora Simple")

#Creamos labels para mostrar texto y entries para introducirlo.
etiqueta1 = tk.Label(ventana, text="Primer número:")
#Usamos el metodo grid para organizar los elementos en torno a una cuadricula.
#Usamos pad(xy) para darle padding a los elementos.
etiqueta1.grid(row=0,columnspan=4, pady=(10, 5))

entrada1 = tk.Entry(ventana)
entrada1.grid(row=1,columnspan=4, padx=20, pady=5)

etiqueta2 = tk.Label(ventana, text="Segundo número:")
etiqueta2.grid(row=2,columnspan=4, pady=(10, 5))

entrada2 = tk.Entry(ventana)
entrada2.grid(row=3,columnspan=4, padx=20, pady=5)

#Con button podemos llamar a una función al pulsarlos
tk.Button(ventana, text="+", command=sumar, width=6, height=2).grid(row=4, column=0, padx=5, pady=5)
tk.Button(ventana, text="-", command=restar, width=6, height=2).grid(row=4, column=1, padx=5, pady=5)
tk.Button(ventana, text="*", command=multiplicar, width=6, height=2).grid(row=4, column=2, padx=5, pady=5)
tk.Button(ventana, text="/", command=dividir, width=6, height=2).grid(row=4, column=3, padx=5, pady=5)

resultado_titulo = tk.Label(ventana, text="Resultado:")
resultado_titulo.grid(row=5, columnspan=4, pady=(10, 5))
#Codificamos un label vacio para poder mostrar el resultado generado por las funciones.
resultado_lb = tk.Label(ventana, text="")
resultado_lb.grid(row=6, columnspan=4, pady=(10, 5))

#El metodo mainloop mantiene la ventana constantemente abierta y esperando inputs.
ventana.mainloop()