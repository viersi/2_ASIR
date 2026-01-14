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