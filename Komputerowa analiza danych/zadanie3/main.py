import numpy as np
import random as sraka
from numpy.random.mtrand import random


def funkcja_sigmoidalna(x):
    return 1 / (1 + np.exp(-x))


def pochodna_funkcji_sigmoidalnej(wartosc_w_punkcie):
    return wartosc_w_punkcie * (1 - wartosc_w_punkcie)


class Warstwa:
    def __init__(self, liczba_wejsc, liczba_neuronow, funkcja_aktywacji, pochodna_funkcji_aktywacji):
        self.wagi = (np.array([np.random.rand(liczba_wejsc) for _ in range(liczba_neuronow)])-0.5)
        self.funkcja_aktywacji = funkcja_aktywacji
        self.pochodna_funkcji_aktywacji = pochodna_funkcji_aktywacji

    def funkcja_wyjscia(self, wejscie):
        self.wejscie = wejscie
        self.wyjscie_przed_aktywacja = np.matmul(self.wagi, self.wejscie)
        self.wyjscie = self.funkcja_aktywacji(self.wyjscie_przed_aktywacja)
        return self.wyjscie

    def pochodna_funkcji_wyjscia_po_wejsciach(self):
        return np.transpose(self.wagi) * self.pochodna_funkcji_aktywacji(self.wyjscie)

    def oblicz_blad_warstwy_poprzedniej(self, blad_warstwy):
        return np.matmul(self.pochodna_funkcji_wyjscia_po_wejsciach(), blad_warstwy)

    def pochodna_funkcji_wyjscia_po_wagach(self):

        # print("---------------------------------------------------------------------")
        # print("wejscie: ")
        # print(self.wejscie)
        # print("---------------------------------------------------------------------")
        # print("wyjscie obrocone: ")
        # print(np.reshape(self.wyjscie, (len(self.wyjscie), 1)))
        # print("---------------------------------------------------------------------")

        return self.wejscie * np.reshape(self.pochodna_funkcji_aktywacji(self.wyjscie), (len(self.wyjscie), 1))

    def zmiana_gradientu(self, wspolczynnik_uczenia, blad_warstwy):
        gradient_przed_zsumowaniem = np.array(self._gradient(blad_warstwy))

        # print("---------------------------------------------------------------------")
        # print("gradient: ")
        # print(gradient_przed_zsumowaniem.sum(axis=0))
        # print("---------------------------------------------------------------------")
        # print("wagi przed zmiana: ")
        # print(self.wagi)
        # print("---------------------------------------------------------------------")
        # print("wagi po odjeciu gradientu: ")
        # print(self.wagi - wspolczynnik_uczenia * gradient_przed_zsumowaniem.sum(axis=0))

        self.wagi = self.wagi - wspolczynnik_uczenia * gradient_przed_zsumowaniem #.sum(axis=0)

    def _gradient(self, blad_warstwy):

        # print("---------------------------------------------------------------------")
        # print("blad warstwy dla kazdego wyjscia: ")
        # print(blad_warstwy)
        # print("---------------------------------------------------------------------")
        # print("blad warstwy obrocony tak jak powinien byc: ")
        # print(np.reshape(blad_warstwy, (len(self.wyjscie), 1)))
        # print("---------------------------------------------------------------------")
        # print("pochodna funkcji wyjscia po wagach: ")
        # print(self.pochodna_funkcji_wyjscia_po_wagach())
        # print("---------------------------------------------------------------------")
        # print("gradient przed zsumowaniem: ")
        # print(self.pochodna_funkcji_wyjscia_po_wagach() * np.reshape(blad_warstwy, (len(self.wyjscie), 1)))

        return self.pochodna_funkcji_wyjscia_po_wagach() * np.reshape(blad_warstwy, (len(self.wyjscie), 1))

class SiecNeuronowa:
    def __init__(self, liczba_wejsc, liczba_wyjsc, liczba_neuronow_w_warstwie_ukrytej):
        self.warstwa_ukryta = Warstwa(liczba_wejsc, liczba_neuronow_w_warstwie_ukrytej,funkcja_sigmoidalna, pochodna_funkcji_sigmoidalnej)
        self.warstwa_koncowa = Warstwa(liczba_neuronow_w_warstwie_ukrytej, liczba_wyjsc, funkcja_sigmoidalna, pochodna_funkcji_sigmoidalnej)

    def werdykt(self, wejscie):
        obliczone = self.propagacja_w_przod(wejscie)
        wynik = obliczone
        for i in range(len(obliczone)):
            if obliczone[i] > 0.5:
                wynik[i] = 1
            else:
                wynik[i] = 0
        return wynik

    def propagacja_w_przod(self, wejscie):
        return self.warstwa_koncowa.funkcja_wyjscia(self.warstwa_ukryta.funkcja_wyjscia(wejscie))

    def propagacja_wstecz(self, wejscia, wyjscia):
        for epoki in range(1000):
            # indexes = [0]
            indexes = [0, 1, 2, 3]
            np.random.shuffle(indexes)
            for i in indexes:
                blad_warstwy_koncowej = self.propagacja_w_przod(wejscia[i]) - wyjscia[i]
                blad_warstwy_ukrytej = self.warstwa_koncowa.oblicz_blad_warstwy_poprzedniej(blad_warstwy_koncowej)

                # print("ZMIANA GRADIENTU WARSTWY KONCOWEJ")
                # print("---------------------------------------------------------------------")
                # print("wagi: ")
                # print(self.warstwa_koncowa.wagi)
                # print("---------------------------------------------------------------------")

                self.warstwa_koncowa.zmiana_gradientu(3, blad_warstwy_koncowej)

                # print("ZMIANA GRADIENTU WARSTWY UKRYTEJ")
                # print("---------------------------------------------------------------------")
                # print("wagi: ")
                # print(self.warstwa_ukryta.wagi)
                # print("---------------------------------------------------------------------")

                self.warstwa_ukryta.zmiana_gradientu(3, blad_warstwy_ukrytej)
                print(blad_warstwy_koncowej)


if __name__ == '__main__':

    # X_dodawanie = np.array([np.array([0,0]) for chuj in range(50)])
    # print(X_dodawanie.shape)
    # Y_dodawanie = np.array([0 for chuj in range(50)])
    # for i in range(50):
    #     X_dodawanie[i][0] = sraka.randrange(0, 10)
    #     X_dodawanie[i][1] = sraka.randrange(0, 10)
    #     Y_dodawanie[i] = X_dodawanie[i][0] + X_dodawanie[i][1]

    X_zad1 = np.array([[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]])
    Y_zad1 = np.array([[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]])
    X_zad2 = np.array([[0, 0], [1, 0], [0, 1], [1, 1]])
    Y_zad2 = np.array([[0], [1], [1], [0]])
    neronek = SiecNeuronowa(2, 1, 10)
    neronek.propagacja_wstecz(X_zad2, Y_zad2)
    print("neronek stwierdzil ze wynik pownien wygladac tak:")
    print(neronek.werdykt(X_zad2[0]))
    print(neronek.werdykt(X_zad2[1]))
    print(neronek.werdykt(X_zad2[2]))
    print(neronek.werdykt(X_zad2[3]))

