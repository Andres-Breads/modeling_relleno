from tkinter import *
from minizinc import Instance, Model, Solver

relleno_sanitario = Model('./solver_relleno_sanitario.mzn')
gecode = Solver.lookup("gecode")
instance = Instance(gecode, relleno_sanitario)
instance.add_file('Datos/dat10_3.dzn')
result = instance.solve()
print(result)

class App():
    def __init__(self, window):
        pass