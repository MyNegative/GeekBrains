goods = []
product = {'Название': ' ', 'Цена': ' ', 'Количество': ' ', 'Единицы': ' '}

while len(goods) < 3:
    name = input('Введите название товара: ')
    price = int(input('Введите цену: '))
    amount = int(input('Введите количество: '))
    count = input('Единицы измерения: ')
    product = {'Название': name, 'Цена': price, 'Количество': amount, 'Единицы': count}
    everything = (len(goods) + 1, product)
    goods.append(everything)

print(goods)

ask = input('Что вы хотите узнать? Напишите: "Название", "Цена", "Количество" или "Единицы": ')
if ask == 'Название' or ask == 'название':
    for i in goods:
        print(i[1]['Название'])
elif ask == 'Цена' or ask == 'цена':
    for i in goods:
        print(i[1]['Цена'])
elif ask == 'Количество' or ask == 'количество':
    for i in goods:
        print(i[1]['Количество'])
elif ask == 'Единицы' or ask == 'единицы':
    for i in goods:
        print(i[1]['Единицы'])
else:
    print('Нет такого!')
