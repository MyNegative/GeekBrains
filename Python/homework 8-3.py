class NotStr(Exception):
    def __init__(self, result):
        self.result = result


user = input('Введите число или введите "stop" для выхода: ')
numbers = []

while user != 'stop':
    try:
        if user.isdigit() == False:
            raise NotStr('Вы ввели не число!')
    except NotStr as err:
        print(err)
        user = input('Введите число или введите "stop" для выхода: ')
    else:
        numbers.append(int(user))
        user = input('Введите число или введите "stop" для выхода: ')

print(numbers)