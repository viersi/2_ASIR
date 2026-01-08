with open("resources/numeros.txt", "x") as f:
    for i in range(1, 11):
        f.write(str(i) + "\n")