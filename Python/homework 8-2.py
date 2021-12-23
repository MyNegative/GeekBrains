class Error(Exception):
    def __init__(self, result):
        self.result = result


a = input('Введите первое число: ')
b = input('Введите второе число: ')

try:
    a = int(a)
    b = int(b)
    if b == 0:
        raise Error('На ноль делить нельзя!')
except ValueError:
    print('Вы ввели не числа')
except Error as wtf:
    print(wtf)
else:
    print(a / b)