from datetime import datetime

fecha = datetime.now()

with open("resources/dateFile.txt", "w") as f:
    f.write(str(fecha))
with open("resources/dateFile.txt", "r") as fr:
    print(fr.read())