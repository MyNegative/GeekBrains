class Storage:
    printers = []
    scanners = []
    photocopiers = []
    goods = {}

    def give_to_it(self):
        self.number = int(input(
            'Для передачи IT-отделу оборудования введите:\n1 - для принтеров\n2 - для сканеров\n3 - для ксероксов\n'))
        while True:
            if self.number == 1:
                print(f'IT-департаменту переданы следующие принтеры: {Storage.goods["Printer"]}')
                break
            elif self.number == 2:
                print(f'IT-департаменту переданы следующие сканеры: {Storage.goods["Scanner"]}')
                break
            elif self.number == 3:
                print(f'IT-департаменту переданы следующие ксероксы: {Storage.goods["Photocopier"]}')
                break
            else:
                print('Неверная цифра, введите снова: ')
                self.number = int(input('Для передачи IT-отделу оборудования введите:\n1 - для принтеров\n2 - для '
                                        'сканеров\n3 - для ксероксов\n'))


class Device:
    def __init__(self, developer, model):
        self.developer = developer
        self.model = model


class Printer(Device):
    def __init__(self, *args):
        self.developer = input('Введите название производителя: ')
        self.model = input('Введите модель принтера: ')
        self.printing = input('Введите режим печати (цветной или ч/б): ').upper()
        while True:
            if self.printing != 'ЦВЕТНОЙ' and self.printing != 'Ч/Б':
                print('Неправильный режим печати!')
                self.printing = input('Введите режим печати (цветной или ч/б): ').upper()
            else:
                break

    def __str__(self):
        return f'Принтер марки {self.developer}, модель: {self.model}'

    def put(self):
        Storage.printers.append((self.developer, self.model, self.printing))
        Storage.goods['Printer'] = Storage.printers


class Scanner(Device):
    def __init__(self, developer, model, resolution):
        self.developer = developer
        self.model = model
        self.resolution = resolution

    def __str__(self):
        return f'Сканер марки {self.developer}, модель: {self.model}'

    def put(self):
        Storage.scanners.append((self.developer, self.model, self.resolution))
        Storage.goods['Scanner'] = Storage.scanners


class Photocopier(Device):
    def __init__(self, developer, model, copies_per_minute):
        self.developer = developer
        self.model = model
        self.copies_per_minute = copies_per_minute

    def __str__(self):
        return f'Ксерокс марки {self.developer}, модель: {self.model}'

    def put(self):
        Storage.photocopiers.append((self.developer, self.model, self.copies_per_minute))
        Storage.goods['Photocopier'] = Storage.photocopiers


a = Printer()
a.put()
b = Scanner('HP', 'RWX', '1024x768')
b.put()
c = Photocopier('Lenovo', 'T-X-1000', 50)
c.put()
print(Storage.goods)
warehouse = Storage()
warehouse.give_to_it()
