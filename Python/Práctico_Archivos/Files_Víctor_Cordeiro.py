#Importamos librerias como os, o shutil para comprobar existencia de archivos,
#y usar comandos de terminal como copiar.
import shutil
import os
#Importamos el modulo datetime dentro de la libreria datetime para simplificar la sintaxis.
from datetime import datetime

#1. Crear un archivo saludo.txt y escribir Hola Python
with open("resources/saludo.txt", "x") as f:
    f.write("Hola Python")

#2. Leer saludo.txt
with open("resources/saludo.txt", "r") as f:
    print(f.read())

#3. Añadir tu nombre al archivo
with open("resources/saludo.txt", "a") as f:
    f.write("\nVíctor")

#4. Leer línea a línea
with open("resources/saludo.txt", "r") as f:
    for i in f:
        print(i)

#5. Crear numeros.txt del 1 al 10
with open("resources/numeros.txt", "x") as f:
    for i in range(1, 11):
        f.write(str(i) + "\n")

#6. Mostrar solo pares
with open("resources/numeros.txt", "r") as f:
    for i in f:
        if int(i) % 2 == 0:
            print(str(i))

#7. Contar líneas
with open("resources/numeros.txt", "r") as f:
    c = 0
    for i in f:
        c += 1
    print(str(c))

#8. Copiar archivo
#Con el metodo copy podemos ejecutar el comando copia con el archivo deseado.
shutil.copy("resources/saludo.txt", "resources/copy_saludo.txt")

#9. Guardar frase del usuario
frase = input("Escribe algo que guardar: ")
with open("resources/user.txt", "w") as f:
    f.write(frase)

#10. Contar caracteres
#Manera con metodo .read(). Cuenta cada caracter.
with open("resources/user.txt", "r") as f:
#El metodo .read() lee las lineas de un texto, o los caracteres de una linea, en función del contenido
#sobre el que lo ejecutemos
    content = f.read()
    chars = len(content)
    print(chars)

#Manera con for anidado, el primer for lee lineas, el segundo caracteres de cada linea.
with open("resources/user.txt", "r") as f:
#El primer for itera sobre lineas, el anidado itera sobre los caracteres de cada linea.
    count = 0
    for i in f:
        for j in i:
            count += 1
    print(count)

#Manera con for para contar solo los 'caracteres reales'.
with open("resources/user.txt", "r") as f:
    count = 0
    for i in content:
        for j in i:
            if j != " " and j != "\n":
                count += 1
    print(count)

#11. Comprobar si existe
#Metodo para comprobar con ruta relativa la existencia de un archivo
file_exists = os.path.exists("resources/user.txt")
if file_exists:
    print("El archivo existe")
else:
    print("El archivo no existe")

#12. Usar writelines
texto = ["Hola Mundo!\n", "El salto de linea viene incluido en el metodo."]
#.writelines() toma una lista y la pasa a un archivo.
with open("resources/write_lines.txt", "w") as f:
    f.writelines(texto)

#13. Guardar líneas en lista
#.readlines() lee linea a linea, y podemos almacenar cada linea como elementos de una lista
with open("resources/numeros.txt", "r") as f:
    lineas = f.readlines()

#14. Borrar archivo si existe
#Creamos una variable para almacenar la existencia del archivo y poder usar condicionales de manera
#más sencilla.
file_exists = os.path.exists("resources/delete_test.txt")
if file_exists:
    print("Borrando archivo")
    os.remove("resources/delete_test.txt")
else:
    print("Nada que borrar")

#15. Sobrescribir archivo
with open("resources/overwrite_test.txt", "w") as f:
    f.write("SOBREESCRITO.")

#16. Filtrar palabra
with open("resources/user.txt", "r") as f:
    filtro = "mundo"
    for i in f:
        if filtro in i:
            print(filtro)

#17. Mayúsculas a otro archivo
#Con .read() almacenamos texto en una variable, y con .write() lo pasamos a otro.
#.upper sobre la variable que almacena el texto lo pasa a mayusculas.
with open("resources/saludo.txt", "r") as f_original:
    texto = f_original.read()
with open("resources/saludo_mayus.txt", "w") as f_upper:
    f_upper.write(texto.upper())

#18. try-except
try:
    with open("resources/newFile.txt", "r") as f:
        print(f.read())
except FileNotFoundError:
    print("Ese archivo no existe")

#19. Guardar fecha
fecha = datetime.now()
#Tenemos que pasar la fecha a string.
with open("resources/dateFile.txt", "w") as f:
    f.write(str(fecha))

#20. Crear log.log
#Cada vez que no se pueda llevar a cabo la operación alamacenaremos en un log
#el error que ha ocurrido, y la fecha y hora en que sucedio.
def simpCalc(a, o, b):
    res = 0
#Usamos el metodo .strftime() para pasar la fecha y hora a string en el formato deseado.
    timestamp = datetime.now().strftime("%d/%m/%Y %H:%M:%S")
#Comprobamos si nuestro log existe, para crearlo, o añadir registros sobre él si ya existe.
    fileExists = os.path.exists("resources/testLog.log")
    try:
        if o == "+":
            try:
                res = a + b
                return res
            except ValueError:
                if fileExists:
                    with open("resources/testLog.log", "a") as f:
                        f.write(f"Error de valores | {timestamp}\n")
                else:
                    with open("resources/testLog.log", "w") as f:
                        f.write(f"Error de valores | {timestamp}\n")
            except TypeError:
                if fileExists:
                    with open("resources/testLog.log", "a") as f:
                        f.write(f"Error de tipo | {timestamp}\n")
                else:
                    with open("resources/testLog.log", "w") as f:
                        f.write(f"Error de tipo | {timestamp}\n")
        elif o == "-":
            try:
                res = a - b
                return res
            except ValueError:
                if fileExists:
                    with open("resources/testLog.log", "a") as f:
                        f.write(f"Error de valores | {timestamp}\n")
                else:
                    with open("resources/testLog.log", "w") as f:
                        f.write(f"Error de valores | {timestamp}\n")
            except TypeError:
                if fileExists:
                    with open("resources/testLog.log", "a") as f:
                        f.write(f"Error de tipo | {timestamp}\n")
                else:
                    with open("resources/testLog.log", "w") as f:
                        f.write(f"Error de tipo | {timestamp}\n")
        elif o == "*":
            try:
                res = a * b
                return res
            except ValueError:
                if fileExists:
                    with open("resources/testLog.log", "a") as f:
                        f.write(f"Error de valores | {timestamp}\n")
                else:
                    with open("resources/testLog.log", "w") as f:
                        f.write(f"Error de valores | {timestamp}\n")
        elif o == "/":
            try:
                res = a / b
                return res
            except ValueError:
                if fileExists:
                    with open("resources/testLog.log", "a") as f:
                        f.write(f"Error de valores | {timestamp}\n")
                else:
                    with open("resources/testLog.log", "w") as f:
                        f.write(f"Error de valores | {timestamp}\n")
            except TypeError:
                if fileExists:
                    with open("resources/testLog.log", "a") as f:
                        f.write(f"Error de tipo | {timestamp}\n")
                else:
                    with open("resources/testLog.log", "w") as f:
                        f.write(f"Error de tipo | {timestamp}\n")
            except ZeroDivisionError:
                if fileExists:
                    with open("resources/testLog.log", "a") as f:
                        f.write(f"Error de división | {timestamp}\n")
                else:
                    with open("resources/testLog.log", "w") as f:
                        f.write(f"Error de división | {timestamp}\n")
    except ValueError:
        if fileExists:
            with open("resources/testLog.log", "a") as f:
                f.write(f"Error de operando | {timestamp}\n")
        else:
            with open("resources/testLog.log", "w") as f:
                f.write(f"Error de operando | {timestamp}\n")
    except TypeError:
        if fileExists:
            with open("resources/testLog.log", "a") as f:
                f.write(f"Error de tipo | {timestamp}\n")
        else:
            with open("resources/testLog.log", "w") as f:
                f.write(f"Error de tipo | {timestamp}\n")

simpCalc(7, 8, 6)
