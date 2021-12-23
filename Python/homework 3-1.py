def math():
    a = int(input('Введите первое число: '))
    b = int(input('Введите второе число: '))
    try:
        result = a / b
        b = 0
    except ZeroDivisionError:
        return ('На ноль делить нельзя!')
    else:
        return round(result, 2)


print(math())
