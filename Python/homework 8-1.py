class Date:

    def __init__(self, date):
        self.date = date

    @classmethod
    def integer(cls, date):
        date = date.split('-')
        for i in date:
            i = int(i)
        print(f'Сегодня {date[0]} число {date[1]} месяца {date[2]} года')

    @staticmethod
    def validation(date):
        date = date.split('-')
        if 1 <= int(date[0]) <= 31 and 1 <= int(date[1]) <= 12 and 1900 < int(date[2]) < 2050:
            print(' '.join(date))
        else:
            print('Неверный формат!')


Date.integer('12-07-2012')
Date.validation('12-03-2012')
Date.validation('14-15-2096')