class Cell:
    def __init__(self, amount):
        self.amount = amount

    def __add__(self, other):
        return Cell(self.amount + other.amount)

    def __str__(self):
        return f'Ячеек стало: {self.amount}'

    def __sub__(self, other):
        if self.amount - other.amount > 0:
            return Cell(self.amount - other.amount)
        else:
            return 'Нельзя вычесть!'

    def __mul__(self, other):
        return Cell(self.amount * other.amount)

    def __truediv__(self, other):
        return Cell(self.amount / other.amount)

    def make_order(self, number):
        self.number = number
        row = '*' * self.amount
        print((row[:self.number] + '\n') * (self.amount // self.number) + '*' * (self.amount % self.number))


a = Cell(15)
b = Cell(10)
print(a + b)
print(a - b)
print(a * b)
print(a / b)
a.make_order(5)
b.make_order(3)