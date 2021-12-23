#Решение подсмотрел в интернете, разобрал все по косточкам и понял, как оно работает

number = int(input('Введите число: '))
max = number % 10
number = number // 10

while number > 0:
    if number % 10 > max:
        max = number % 10
    number = number // 10

print(f'Самая большая цифра - {max}')
