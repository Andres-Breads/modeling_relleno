import random
from datetime import datetime as dt

def generate_dzn_file():
    try:
        now = dt.now()
        now = now.strftime("%Y_%m_%d_%H_%M_%S")
        filename = "dat_" + now
        max_region = 100
        region = random.randint(1, max_region)
        max_num_cities = pow(region+1, 2) - 1
        cities = random.randint(1, max_num_cities)
        with open("./Datos/" + filename + ".dzn", "w") as dzn_file:
            # In case the tuple of coords is repeated, we discard it with the set
            set_of_cities = set()
            for i in range(cities):
                x_coord = random.randint(0, region)
                y_coord = random.randint(0, region)
                set_of_cities.add((str(x_coord), str(y_coord)))

            cities = len(set_of_cities)
            dzn_file.write("n=" + str(region) + ";" + "\n")
            dzn_file.write("m=" + str(cities) + ";" + "\n")
            content = "ciudades=["

            for i, city in enumerate(set_of_cities):
                content += "|" + ", ".join(city)
                if cities > 1 and i < cities-1:
                    content += "\n"

            content += "|];"
            dzn_file.write(content)

        print("File generated succesfully")
    except Exception as error:
        print(error)

if __name__ == '__main__':
    generate_dzn_file()