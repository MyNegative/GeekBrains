text = open('text_2.txt', 'r')
count = 0

for line in text:
    line = line.split(' ')
    count += 1
    print('Количество слов в строке: ', len(line))

print('Количество строк: ', count)

text.close()
print('Конец работы с файлом')