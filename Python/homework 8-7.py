class Complex:
    def __init__(self, num):
        self.num = num

    def __mul__(self, other):
        return self.num * other.num

    def __add__(self, other):
        return self.num + other.num


a = Complex(1 + 5j)
b = Complex(1 + 3j)
print(a * b)
print(a + b)