from sys import argv

script_name, name, hours, work, money = argv

print('Имя сотрудника: ', name)
print('Выработка в часах: ', int(hours))
print('Cтавка в час: ', int(work))
print('Премия: ', int(money))
print('Зарплата сотрудника: ', (int(hours) * int(work) + int(money)))
