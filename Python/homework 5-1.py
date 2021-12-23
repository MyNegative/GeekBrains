text = open('blanc.txt', 'a')
user = input('Введите текст или введите Q для выхода: ')
while user != 'Q':
    text.write(user + '\n')
    user = input('Введите текст или введите Q для выхода: ')

text.close()
print('Конец работы с файлом')