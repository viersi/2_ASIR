with open("resources/saludo.txt", "r") as f_original:
    texto = f_original.read()
with open("resources/saludo_mayus.txt", "w") as f_upper:
    f_upper.write(texto.upper())

with open("resources/saludo_mayus.txt", "r") as f:
    print(f.read())