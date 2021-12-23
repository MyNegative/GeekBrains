nums = []
count = 0

text = open('text_3.txt', 'r', encoding='utf-8')
for line in text:
    line = line.split(' ')
    if float(line[1]) < 20000:
        print('Доход ниже 20000:', line[0])
        salary = line[1]
        nums.append(float(salary))
        count += 1

print('Средний доход сотрудников: ', round(sum(nums) / count, 2))

text.close()
print('Конец работы с файлом')