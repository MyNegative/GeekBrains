text = list(input('Введите что-нибудь: '))
print(text)
text[:-1:2], text[1::2] = text[1::2], text[:-1:2]
print (text)