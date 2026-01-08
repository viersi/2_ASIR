import shutil

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


#10. Contar caracteres


#11. Comprobar si existe


#12. Usar writelines


#13. Guardar líneas en lista


#14. Borrar archivo si existe


#15. Sobrescribir archivo


#16. Filtrar palabra


#17. Mayúsculas a otro archivo


#18. try-except


#19. Guardar fecha


#20. Crear log.txt

