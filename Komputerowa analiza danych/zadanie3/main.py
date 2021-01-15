import numpy as np
from numpy.random.mtrand import random

# zakładamy że każda sieć ma tylko jedną warstwę
# wejscie - tablica numpy postaci X[x1, x2, ... , xn]
# wyjscie - tablica numpy postaci Y[y1, y2, ... , yn]
# przewidywane wyjscie - tablica numpy postaci Z[z1, z2, ... , zn]

# XOR INPUT=2 OUTPUT=1

#       1        2       3
#       x1 ->    o ->    y     (y1 - z1)^2 = blad sredniokwadratowy       |bląd|    (błąd)^2
#       x2 ->    o ->
#                o ->
# x0=1
# X1=2
# X2=3
#
#multiple layer perceptron

        #  1
        #  1

        #   0,43  0,92
        #   0,12  0,15
        #   0,92  0,34

        #  0,75  0,64  0,23

# funkcja_aktywacji(funkcja_kosztu)
# waga = waga-pochodna funkcji kosztu * współczynnik uczenia



#
#
# def pochodna_funkcji_aktywacji(x):
#     return x*(1-x)
#
#
#


# def propagacja_wsteczna():
#     waga = 2*(BLAD)*pochodna_funkcji_aktywacji(x)


class Warstwa:
    # liczba neuronow: hah, no liczba neuronow
    # wejscie: x tablica jednowymiarowa zawierająca wyjscie poprzedniej warstwy [wartosci_wejsciowe]
    # wagi: W tablica dwuwymiarowa zawierajaca w kazdym wierszu wszystkie wagi neuronow [neurony, wagi_neuronow]
    wejscie = 0
    wagi = 0

    def __init__(self, liczba_wejsc, liczba_neuronow):
        self.wagi = np.array([np.random.rand(liczba_wejsc) for _ in range(liczba_neuronow)])
        print(self.wagi)

    def suma_wazona(self):
        return np.matmul(self.wagi, self.wejscie)

    #
    # [1    [[w11, w12, w13, w14]         [suma W1*wejscie             w11*1 + w12*2 + w13*3 + w14*4
    #  2     [w21, w22, w23, w24]          suma W2*wejscie
    #  3     [w31, w32, w33, w34]          suma W3*wejscie
    #  4]    [w41, w42, w43, w44]]         suma W4*wejscie]


    def funkcja_aktywacji(self, wejscie):
        self.wejscie = wejscie
        return 1/(1 + np.exp(-self.suma_wazona()))

    def pochodna_funkcji_aktywacji(self, wejscie):
        return np.multiply(wejscie, 1-wejscie)


class Siec_neuronowa:
    warstwa_ukryta = 0
    warstwa_koncowa = 0
    wejscia = 0
    wyjscia = 0
    # wejscia : X tablica dwuwymiarowa zawierajaca w kazdym wierszu wszystkie wejscia jednego przypadku uczacego
    # wyjscia : Y tablica dwuwymiarowa zawierajaca w kazdym wierszu wszystkie wyjscia jednego przypadku uczacego

    def __init__(self, wejscia, wyjscia, liczba_neuronow_w_warstwie_ukrytej):
        self.warstwa_ukryta = Warstwa(len(wejscia[0]), liczba_neuronow_w_warstwie_ukrytej)
        self.warstwa_koncowa = Warstwa(liczba_neuronow_w_warstwie_ukrytej, len(wyjscia[0]))
        self.wejscia = wejscia
        self.wyjscia = wyjscia

    def propagacja_w_przod(self, numer_wejscia):
        return self.warstwa_koncowa.funkcja_aktywacji(self.warstwa_ukryta.funkcja_aktywacji(self.wejscia[numer_wejscia]))

    def propagacja_w_tyl(self):
        return 0

    # def funkcja_kosztu(self, Y, Z):
    #     return np.sum((Y - Z) ** 2) / (len(Z) * 2)

    def pochodna_funkcji_kosztu(self, X, Y, Z)):
        return np.matmul(np.transpose(X), Y - Z) / len(Y)
        2 * (BLAD) * pochodna_funkcji_aktywacji(x)

    # def uczenie(self):


if __name__ == '__main__':
    X_zad1 = [[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]]
    Y_zad1 = [[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]]
    X_zad2 = [[0, 0], [1, 0], [0, 1], [1, 1]]
    Y_zad2 = [[0], [1], [1], [0]]
    neronek = Siec_neuronowa(X_zad2, Y_zad2, 3)
    print(neronek.propagacja_w_przod(1))