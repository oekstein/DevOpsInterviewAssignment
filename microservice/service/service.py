from numpy.random import Generator, PCG64



class ServiceClass(object):
    def __init__(self, number):
        self.number = number
        self.rng = Generator(PCG64(1234))

    def one_or_zero(self) -> int:
        return self.number * int(self.rng.standard_normal()) % 2
