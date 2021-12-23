import json

data = {}
average_profit = {}
companies = []
count = 0

with open('text_7.txt', 'r', encoding='UTF-8') as chart:
    for line in chart:
        line = line.split(' ')
        profit = int(line[2]) - int(line[3])
        data[line[0]] = profit
        if profit > 0:
            companies.append(profit)
            count += 1
    average = round(int(sum(companies)) / count)
    average_profit['Средняя прибыль'] = average
    everything = [data, average_profit]
with open('entities.json', 'w', encoding='UTF-8') as entities:
    json.dump(everything, entities, ensure_ascii=False)
