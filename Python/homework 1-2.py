#С днями просидел три часа и в итоге запутался в логических операциях

number = int(input('Уникальный конвертер секунд в формат "DD:HH:MM:SS", но только до 89999 секунд: '))
days = number // 86400
hours = number // 3600
minutes = number % 3600 // 60
seconds = number % 3600 % 60

if days < 1 and hours < 10:
    if minutes < 10:
        if seconds < 10:
            print(f'0{days}:0{hours}:0{minutes}:0{seconds}')
        else:
            print(f'0{days}:0{hours}:0{minutes}:{seconds}')
    elif minutes >= 10:
        if seconds < 10:
            print(f'0{days}:0{hours}:{minutes}:0{seconds}')
        else:
            print(f'0{days}:0{hours}:{minutes}:{seconds}')

elif days < 1 and 10 <= hours < 24:
    if minutes < 10:
        if seconds < 10:
            print(f'0{days}:{hours}:0{minutes}:0{seconds}')
        else:
            print(f'0{days}:{hours}:{minutes}:{seconds}')
    elif minutes >= 10:
        if seconds < 10:
            print(f'0{days}:{hours}:{minutes}:0{seconds}')
        else:
            print(f'0{days}:{hours}:{minutes}:{seconds}')

elif 1 <= days < 10:
    if hours // 24 == 1 and hours % 24 == 0:
        if minutes < 10:
            if seconds < 10:
                print(f'0{days}:00:0{minutes}:0{seconds}')
            else:
                print(f'0{days}:00:0{minutes}:{seconds}')
        else:
            if seconds < 10:
                print(f'0{days}:00:{minutes}:0{seconds}')
            else:
                print(f'0{days}:00:{minutes}:{seconds}')
#     elif hours % 24 != 0 and hours // 24 < 10:
#         if minutes < 10:
#             if seconds < 10:
#                 print(f'0{days}:0{hours}:0{minutes}:0{seconds}')
#             else:
#                 print(f'0{days}:0{hours}:0{minutes}:{seconds}')
#         else:
#             if seconds < 10:
#                 print(f'0{days}:0{hours}:{minutes}:0{seconds}')
#             else:
#                 print(f'0{days}:0{hours}:{minutes}:{seconds}')