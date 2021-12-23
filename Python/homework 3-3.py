def my_func(a, b, c):
    nums = [a, b, c]
    nums.remove(min(nums))
    nums = sum(nums)
    print(nums)


"""Возвращает сумму двух самых больших чисел из введенных"""

my_func(6, 4, 11)
