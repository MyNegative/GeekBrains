from sys import argv

script_name = argv


def numbers():
    from itertools import count
    n = int(input('Введите число: '))
    for l in count(n):
        if l > n + 10:
            break
        else:
            print(l)


numbers()


def letters():
    from itertools import cycle
    text = input('Введите строку: ')
    c = 0
    for l in cycle(text):
        if c > 10:
            break
        print(l)
        c += 1


letters()
