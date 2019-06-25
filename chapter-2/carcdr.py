cons = lambda x, y: (lambda m: m(x, y))
car = lambda z: z(lambda x, y: x)

print(car(cons(1, 2)))
