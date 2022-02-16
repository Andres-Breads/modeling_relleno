from tkinter import *
import minizinc_app

def main():
    main_window = Tk()
    main_window.title('Relleno Sanitario')
    main_window.configure(bg='#00F5F5')
    minizinc_app.App(main_window)
    main_window.mainloop()

if __name__=="__main__":
    main()