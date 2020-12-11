# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
import random

if __name__ == '__main__':

    miesnie = ["Przedni akton mięśni naramiennych",
               "Mięsień trójgłowego ramienia",
               "Mięsień piersiowy większy i mniejszy",
               "Mięsień podobojczykowy",
               "Mięsień zębaty przedni",
               "Mięsień najszerszy grzbietu",
               "Mięsień czworoboczny", "Mięsień obły większy", "Mięśnie zginacze nadgarstka"]

    bledy = ["Brak rozgrzewki", "Zbyt duża odległość między poręczami",
             "Pochylanie tułowia", "Rozsuwanie łokci na boki",
             "Niepełny wyprost rąk", "Zwiększanie na siłę ruchu opuszczania tułowia",
             "Niepełny ruch opuszczania tułowia"]

    random.shuffle(miesnie)
    random.shuffle(bledy)

    for x in miesnie:
        print(x)

    print()

    for x in bledy:
        print(x)

    print()

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
