# Вопросы:
# 1. Можно ли принудительно завершить выполнение программы после первых двух if с переменной age,
# и продолжить после тех, которые подходят? Неужели нужно после каждого подходящего условия прописывать
# всю дальнейшую программу, бесконечно копируя? Отсюда следующий вопрос:
# 2. Можно ли объединять условия? Задать им переменные и создавать новое условие? Но тогда как вывести нужную
# переменную, при выполнении логической операции or? exm: if a or b or c: как вывести результат для конкретной
# переменной?

print('Привет!')
question = input('Хочешь поболтать? Y/N ')

if question == 'Y' or question == 'y':
    print('Хорошо, давай поговорим')
    name = input('Как тебя зовут? ')
    print(f'Приятно познакомиться, {name}, я Тимофей')
    age = int(input('А сколько тебе лет? '))
    if age == 0:
        print('Так не бывает, не обманывай меня! Младенцы не умеют печатать! Не хочу с тобой больше разговаривать!')
    if age >= 100:
        print('Ого, ничего себе, ты долгожитель! Боюсь, я утомлю тебя своими беседами, поэтому прощай, тебе нужен '
              'покой и отдых!')
    if 28 < age < 100:
        print('Ты старше меня, здорово, мне 28')
        print(f'Понимаешь, {name}, я всего лишь маленькая программа, написанная начинающим разработчиком. И он уже '
              f'очень устал меня сочинять, да и вся эта беседа не входила в задание. Может быть, мы увидимся снова, '
              f'и тогда я вспомню, как тебя зовут, и что на момент нашего знакомства тебе было {age}. До встречи!')
    if 28 > age > 0:
        print('Ты младше меня, здорово, мне 28')
        print(f'Понимаешь, {name}, я всего лишь маленькая программа, написанная начинающим разработчиком. И он уже '
              f'очень устал меня сочинять, да и вся эта беседа не входила в задание. Может быть, мы увидимся снова, '
              f'и тогда я вспомню, как тебя зовут, и что на момент нашего знакомства тебе было {age}. До встречи!')
    if age == 28:
        print('Прикольно, мы с тобой ровесники!')
        print(f'Понимаешь, {name}, я всего лишь маленькая программа, написанная начинающим разработчиком. И он уже '
              f'очень устал меня сочинять, да и вся эта беседа не входила в задание. Может быть, мы увидимся снова, '
              f'и тогда я вспомню, как тебя зовут, и что на момент нашего знакомства тебе было {age}. До встречи!')

elif question == 'N' or question == 'n':
    print('Нет, так нет. Пока!')
else:
    print('Написано же: Y/N. Не хочу разговаривать с теми, кто не умеет читать')
