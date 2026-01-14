import os

file_exists = os.path.exists("resources/delete_test.txt")
if file_exists:
    print("Borrando archivo")
    os.remove("resources/delete_test.txt")
else:
    print("Nada que borrar")