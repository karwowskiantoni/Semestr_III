# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
import random

if __name__ == '__main__':

    miesnie = ["mięśnie prostowniki grzbietu",
               "mięśnie czworogłowe ud",
               "mięśnie dwugłowe ud",
               "mięsnie pośladkowe",
               "mięśnie najszersze grzbietu"]

    bledy = ["koci grzbiet", "podnoszenie barków", "przegięcie w tył", "podnoszenie głowy do góry",
             "za szeroki rozstaw dłoni", "pozycja bioder jak przy przysiadzie"]

    ciagi = ["martwy ciąg rumuński",
             "martwy ciąg na prostych nogach",
             "martwy ciąg z bloków",
             "martwy ciąg chwytem rwaniowym",
             "martwy ciąg z łańcuchami",
             "martwy ciąg z deficytu",
             "martwy ciąg z podstawek",
             "martwy ciąg na jednej nodze"]

    random.shuffle(miesnie)
    random.shuffle(bledy)
    random.shuffle(ciagi)

    for x in miesnie:
        print(x)

    print()

    for x in bledy:
        print(x)

    print()

    for x in ciagi:
        print(x)

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
