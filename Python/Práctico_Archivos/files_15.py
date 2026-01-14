with open("resources/overwrite_test.txt", "w") as f:
    f.write("SOBREESCRITO.")

with open("resources/overwrite_test.txt", "r") as f:
    print(f.read())