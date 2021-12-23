with open('numbers.txt', 'w+') as text:
    text.write(input('Введите числа через пробел: '))
    text.seek(0)
    text = text.read()
    text = text.split(' ')
    numbers = [int(i) for i in text]
    print(sum(numbers))
