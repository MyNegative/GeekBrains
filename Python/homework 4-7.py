from math import factorial

n = int(input('Введите число: '))


def fact(n):
    for n in range(1, n + 1):
        yield factorial(n)


for el in fact(n):
    print(el)