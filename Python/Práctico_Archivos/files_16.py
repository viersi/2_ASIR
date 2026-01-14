with open("resources/user.txt", "r") as f:
    filtro = "mundo"
    for i in f:
        if filtro in i:
            print(filtro)