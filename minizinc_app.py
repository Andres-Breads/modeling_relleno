from tkinter import *
from minizinc import Instance, Model, Solver

relleno_sanitario = Model('./solver_relleno_sanitario.mzn')
gecode = Solver.lookup("gecode")
instance = Instance(gecode, relleno_sanitario)
instance.add_file('Datos/dat10_3.dzn')
result = instance.solve()
print(result)

class App():
    def __init__(self, master):
        canvas = Canvas(master, width=100, height=100, bg='white')
        canvas.pack(side="bottom", fill='x')
        canvas.create_line(10, 0, 10, 100)
        canvas.create_line(20, 0, 20, 100)