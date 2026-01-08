with open("resources/numeros.txt", "r") as f:
    c = 0
    for i in f:
        c += 1
    print(str(c))