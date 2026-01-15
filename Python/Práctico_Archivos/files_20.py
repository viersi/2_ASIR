import os
from datetime import datetime
def simpCalc(a, o, b):
    res = 0
    timestamp = datetime.now().strftime("%d/%m/%Y %H:%M:%S")
    fileExists = os.path.exists("resources/testLog.log")
    try:
        if o == "+":
            try:
                res = a + b
                return res
            except ValueError:
                if fileExists:
                    with open("resources/testLog.log", "a") as f:
                        f.write(f"Error de valores | {timestamp}\n")
                else:
                    with open("resources/testLog.log", "w") as f:
                        f.write(f"Error de valores | {timestamp}\n")
            except TypeError:
                if fileExists:
                    with open("resources/testLog.log", "a") as f:
                        f.write(f"Error de tipo | {timestamp}\n")
                else:
                    with open("resources/testLog.log", "w") as f:
                        f.write(f"Error de tipo | {timestamp}\n")
        elif o == "-":
            try:
                res = a - b
                return res
            except ValueError:
                if fileExists:
                    with open("resources/testLog.log", "a") as f:
                        f.write(f"Error de valores | {timestamp}\n")
                else:
                    with open("resources/testLog.log", "w") as f:
                        f.write(f"Error de valores | {timestamp}\n")
            except TypeError:
                if fileExists:
                    with open("resources/testLog.log", "a") as f:
                        f.write(f"Error de tipo | {timestamp}\n")
                else:
                    with open("resources/testLog.log", "w") as f:
                        f.write(f"Error de tipo | {timestamp}\n")
        elif o == "*":
            try:
                res = a * b
                return res
            except ValueError:
                if fileExists:
                    with open("resources/testLog.log", "a") as f:
                        f.write(f"Error de valores | {timestamp}\n")
                else:
                    with open("resources/testLog.log", "w") as f:
                        f.write(f"Error de valores | {timestamp}\n")
        elif o == "/":
            try:
                res = a / b
                return res
            except ValueError:
                if fileExists:
                    with open("resources/testLog.log", "a") as f:
                        f.write(f"Error de valores | {timestamp}\n")
                else:
                    with open("resources/testLog.log", "w") as f:
                        f.write(f"Error de valores | {timestamp}\n")
            except TypeError:
                if fileExists:
                    with open("resources/testLog.log", "a") as f:
                        f.write(f"Error de tipo | {timestamp}\n")
                else:
                    with open("resources/testLog.log", "w") as f:
                        f.write(f"Error de tipo | {timestamp}\n")
            except ZeroDivisionError:
                if fileExists:
                    with open("resources/testLog.log", "a") as f:
                        f.write(f"Error de división | {timestamp}\n")
                else:
                    with open("resources/testLog.log", "w") as f:
                        f.write(f"Error de división | {timestamp}\n")
    except ValueError:
        if fileExists:
            with open("resources/testLog.log", "a") as f:
                f.write(f"Error de operando | {timestamp}\n")
        else:
            with open("resources/testLog.log", "w") as f:
                f.write(f"Error de operando | {timestamp}\n")
    except TypeError:
        if fileExists:
            with open("resources/testLog.log", "a") as f:
                f.write(f"Error de tipo | {timestamp}\n")
        else:
            with open("resources/testLog.log", "w") as f:
                f.write(f"Error de tipo | {timestamp}\n")

simpCalc(7, 6, 0)