class Rectangulo:
    def __init__(self, base, altura):
        self.base = base
        self.altura = altura
    def area(self):
        return self.base * self.altura
    def perimetro(self):
        return 2*self.base + 2*self.altura

uno = Rectangulo(7, 15)
print(f"Area: {uno.area()}, Perimetro: {uno.perimetro()}")