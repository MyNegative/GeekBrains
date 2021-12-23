def my_func(x, y):
    if y < 0:
        return x ** y
    elif y == 0:
        return 'Один!'
    else:
        y = -y
        return x ** y


x = int(input('Введите число: '))
y = int(input('Введите число: '))

print(my_func(x, y))

"""Тут начинается вторая часть задания"""

def my_func(x, y):
    n = 0
    result = 1 / x
    if x <= 0 or y <= 0:
        return 'Сложно!'
    while n < y - 1 and y > 0 and x > 0:
        n += 1
        result *= 1 / x
    return result


print(my_func(x, y))
