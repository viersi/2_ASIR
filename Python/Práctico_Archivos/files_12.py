texto = ["Hola Mundo!\n", "El salto de linea viene incluido en el metodo."]

with open("resources/wrote_lines.txt", "w") as f:
    f.writelines(texto)

with open("resources/wrote_lines.txt", "r") as f:
    leer = f.read()
    print(leer)