class Stationery:
    title = 'Рисовалка'

    def draw(self):
        print('Запуск отрисовки', end='\n\n')


class Pen(Stationery):
    def draw(self):
        print('Тонкие синие линии появляются на бумаге...', end='\n\n')


class Pencil(Stationery):
    def draw(self):
        print('"Шух-шух, шух-шух", - шуршит карандаш по бумаге', end='\n\n')


class Handle(Stationery):
    def draw(self):
        print('Толстые цветные пятна покрывают поляну белоснежного листа...', end='\n\n')


drawing = Stationery()
print(drawing.title, end='\n\n')
drawing.draw()
pen = Pen()
pen.draw()
pencil = Pencil()
pencil.draw()
handle = Handle()
handle.draw()