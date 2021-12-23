# nice авп ъghj jапро hjjпаро вапрghgh cool

def capital():
    text = input('Введите текст: ').split(' ')
    for i in text:
        count = 0
        for k in i:
            if 97 <= ord(k) <= 122:
                count += 1
                if count == len(i):
                    a = i.capitalize()
                    text.insert(text.index(i), a)
                    text.remove(i)
    print(' '.join(text))


capital()
