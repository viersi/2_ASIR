import shutil
import os
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
shutil.copy("resources/saludo.txt", "resources/copy_saludo.txt")

#9. Guardar frase del usuario
frase = input("Escribe algo que guardar: ")
with open("resources/user.txt", "w") as f:
    f.write(frase)

#10. Contar caracteres
#Manera con metodo .read(). Cuenta cada caracter.
with open("resources/user.txt", "r") as f:
    content = f.read()
    chars = len(content)
    print(chars)

#Manera con for anidado, el primer for lee lineas, el segundo caracteres de cada linea.
with open("resources/user.txt", "r") as f:
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
file_exists = os.path.exists("resources/user.txt")
if file_exists:
    print("El archivo existe")
else:
    print("El archivo no existe")

#12. Usar writelines
texto = ["Hola Mundo!\n", "El salto de linea viene incluido en el metodo."]

with open("resources/write_lines.txt", "w") as f:
    f.writelines(texto)

#13. Guardar líneas en lista
with open("resources/numeros.txt", "r") as f:
    lineas = f.readlines()

#14. Borrar archivo si existe
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

with open("resources/dateFile.txt", "w") as f:
    f.write(str(fecha))

#20. Crear log.txt

