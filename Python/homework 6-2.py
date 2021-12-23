class Road:

    def __init__(self, lenght, width):
        self._lenght = lenght
        self._width = width

    def formula(self):
        print(f'Потребуется {round(self._lenght * self._width * 25 * 5 / 1000)} тонн асфальта')


a = Road(10, 5000)
a.formula()