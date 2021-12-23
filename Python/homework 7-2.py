from abc import ABC, abstractmethod


class Clothes(ABC):
    @abstractmethod
    def __init__(self, v, h):
        self.v = v
        self.h = h

    @abstractmethod
    def coat(self):
        pass

    @abstractmethod
    def suit(self):
        pass


class Coat(Clothes):
    def __init__(self, v):
        self.v = v

    @property
    def coat(self):
        return self.v / 6.5 + 0.5

    def suit(self):
        pass


class Suit(Clothes):
    def __init__(self, h):
        self.h = h

    @property
    def suit(self):
        return self.h * 2 + 0.3

    def coat(self):
        pass


a = Coat(6.5)
print(a.coat)
b = Suit(3)
print(b.suit)
print(f'На все про все понадобится {a.coat + b.suit} метра ткани')