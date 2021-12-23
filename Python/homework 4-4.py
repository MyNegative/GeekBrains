old = [2, 2, 2, 7, 23, 1, 44, 44, 3, 2, 10, 7, 4, 11]
new = [i for i in old if old.count(i) == 1]
print(new)