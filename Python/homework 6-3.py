class Worker:
    name = input('Введите имя сотрудника: ')
    surname = input('Введите фамилию сотрудника: ')
    position = input('Введите должность сотрудника: ')
    _income = {'Wage': int(input('Оклад: ')), 'Bonus': int(input('Премия: '))}


class Position(Worker):
    def get_full_name(self):
        print(f'Имя сотрудника: {Worker.name} {Worker.surname}')

    def get_total_income(self):
        print('Зарплата сотрудника:', Worker._income['Wage'] + Worker._income['Bonus'])


a = Position()
a.get_full_name()
print('Должность:', a.position)
a.get_total_income()