old = [300, 2, 12, 44, 1, 1, 4, 10, 7, 1, 78, 123, 55]
new = [i for i in old if i > old[old.index(i) - 1] and old.index(i) != 0]
print(new)