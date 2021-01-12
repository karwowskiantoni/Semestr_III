# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
import random

if __name__ == '__main__':

    miesnie = ["Mięsień naramienny przedni", "Mięsień piersiowy większy", "Mięsień podgrzebieniowy"]

    bledy = ["Prowadzenie łokci na boki - błąd ten może skutkować kontuzją barku",
             "Opuszczanie tułowia niewystarczająco nisko, co zmniejsza efekty pompek",
             "Brak całkowitego wyprostu łokci przy podnoszeniu się",
             "Głowa ustawiona zbyt nisko - szyja ma być przedłużeniem kręgosłupa",
             "Trzymanie bioder za nisko lub za wysoko - sylwetka powinna tworzyć jedną linię",
             "Zaokrąglone plecy - łopatki powinny być ściągnięte "]


    random.shuffle(bledy)


    for x in bledy:
        print(x)

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
