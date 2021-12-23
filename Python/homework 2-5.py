my_list = [7, 5, 2, 2, 1]
num = int(input('Введите цифру от 0 до 9: '))
i = 0

for n in my_list:
    if num <= n:
        i += 1
    else:
        break
my_list.insert(i, num)
print(my_list)