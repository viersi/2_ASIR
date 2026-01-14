try:
    with open("resources/newFile.txt", "r") as f:
        print(f.read())
except FileNotFoundError:
    print("Ese archivo no existe")

