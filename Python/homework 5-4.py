dict = {'One': 'Один', 'Two': 'Два', 'Three': 'Три', 'Four': 'Четыре'}

with open('text_4.txt', 'r', encoding='UTF-8') as text:
    for line in text:
        line = line.split(' ')
        numbers = [dict.get(line[0]), line[1], line[2]]
        numbers = ' '.join(numbers)
        print(numbers, end='')
        with open('translation.txt', 'a', encoding='UTF-8') as translation:
            translation.write(numbers)
