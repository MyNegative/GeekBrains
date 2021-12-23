from functools import reduce


def big(a, b):
    return a * b


print(reduce(big, [i for i in range(100, 1001) if i % 2 == 0]))