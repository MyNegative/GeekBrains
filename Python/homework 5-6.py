study = {}

with open('text_6.txt', 'r', encoding='UTF-8') as chart:
    for line in chart:
        line = line.replace(':', '').replace('(л)', '').replace('(пр)', '').replace('(лаб)', '')\
            .replace('-', '0')
        line = line.split(' ')
        hours = [int(i) for i in line[1:]]
        study[line[0]] = sum(hours)
    print(study)
