frase = input("Escribe algo que guardar: ")
with open("resources/user.txt", "w") as f:
    f.write(frase)