from time import sleep


class TrafficLight:
    __color = 0

    def running(self):
        while TrafficLight.__color != 10:
            print('Красный')
            sleep(7)
            print('Желтый')
            sleep(2)
            print('Зеленый')
            sleep(10)
            print('Желтый')
            sleep(2)
            TrafficLight.__color += 1


light = TrafficLight()
light.running()