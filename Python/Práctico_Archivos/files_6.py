with open("resources/numeros.txt", "r") as f:
    for i in f:
        if int(i) % 2 == 0:
            print(str(i))