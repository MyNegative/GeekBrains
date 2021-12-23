begin = int(input('Сколько километров вы пробежали в первый день?: '))
end = int(input('Какого результата вы хотите достичь?: '))
step = 0.1
day = 1

while begin <= end:
    begin += begin * step
    day += 1
print(day)