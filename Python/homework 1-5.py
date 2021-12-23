revenue = int(input('Выручка: '))
expenses = int(input('Издержки: '))

if revenue - expenses == 0:
    print('Ваша фирма вышла в ноль')

elif revenue - expenses < 0:
    losses = revenue - expenses
    print(f'Убыток: {losses}')

else:
    net_income = revenue - expenses
    print(f'Ваша прибыль: {net_income}')
    rate = net_income / revenue
    print(f'Рентабельность: {rate:.3f}')
    staff = int(input('Сколько сотрудников в вашей компании?: '))
    print('Прибыль на одного сотрудника: ' + f'{net_income // staff:.2f}')