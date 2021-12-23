class Car:
    def __init__(self, speed, color, name, is_police):
        self.speed = speed
        self.color = color
        self.name = name
        self.is_police = is_police

    def go(self):
        print(f'Автомобиль {self.name} начал движение!')

    def stop(self):
        print(f'Автомобиль {self.name} остановился!')

    def turn(self, direction):
        print(f'Автомобиль {self.name} повернул {direction}!')

    def show_speed(self):
        print(self.speed)


class TownCar(Car):
    def show_speed(self):
        if self.speed > 60:
            print(f'Городской автомобиль {self.name} едет с превышением скорости на {self.speed - 60} км/ч!')
        elif self.speed == 60:
            print(f'Городской автомобиль {self.name} движется с максимально допустимой скоростью!')
        else:
            print(f'Городской автомобиль {self.name} вальяжно катится в потоке со скоростью {self.speed} км/ч!')


class SportCar(Car):
    pass


class WorkCar(Car):
    def show_speed(self):
        if self.speed > 40:
            print(f'Спецтехника компании {self.name}, которая превышает скорость на {self.speed - 40} км/ч! Офигеть!')
        elif self.speed == 40:
            print(f'Этот драндулет производства {self.name} движется с максимально допустимой скоростью!')
        else:
            print(f'Спецтехника! Еле едет со своей скоростью {self.speed} км/ч и всех задерживает!')


class PoliceCar(Car):
    def go(self):
        print(f'Полицейский автомобиль {self.name} начал погоню!')

    def stop(self):
        print(f'Полицейский автомобиль {self.name} остановился!')

    def turn(self, direction):
        print(f'Полицейский автомобиль {self.name} повернул {direction}!')


town = TownCar(68, 'Белый', 'Chevrolet', False)
town.show_speed()

work = WorkCar(54, 'Красный', 'Cat', False)
work.show_speed()

police = PoliceCar(122, 'Желтый', 'Mercedes', True)
police.go()
police.turn('направо')
police.stop()
