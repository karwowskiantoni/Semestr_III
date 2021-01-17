import numpy as np
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
        return np.reshape(self.pochodna_funkcji_aktywacji(self.wyjscie), (len(self.wyjscie), 1)) * self.wejscie
        # return self.wejscie

    def zmiana_gradientu(self, wspolczynnik_uczenia, blad_warstwy):
        self.wagi = self.wagi - wspolczynnik_uczenia * self._gradient(blad_warstwy)

    def _gradient(self, blad_warstwy):
        return np.reshape(blad_warstwy, (len(self.wyjscie), 1)) * self.pochodna_funkcji_wyjscia_po_wagach()
        # return np.matmul(np.transpose(self.pochodna_funkcji_wyjscia_po_wagach()), blad_warstwy)   # gradient


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
        for epoki in range(5000):
            indexes = [0, 1, 2, 3]
            np.random.shuffle(indexes)
            for i in indexes:
                blad_warstwy_koncowej = self.propagacja_w_przod(wejscia[i]) - wyjscia[i]
                blad_warstwy_ukrytej = self.warstwa_koncowa.oblicz_blad_warstwy_poprzedniej(blad_warstwy_koncowej)
                self.warstwa_koncowa.zmiana_gradientu(0.1, blad_warstwy_koncowej)
                self.warstwa_ukryta.zmiana_gradientu(0.1, blad_warstwy_ukrytej)
                print(blad_warstwy_koncowej)


if __name__ == '__main__':
    X_zad1 = np.array([[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]])
    Y_zad1 = np.array([[1, 1, 0, 1], [1, 1, 1, 0], [0, 1, 1, 1], [1, 0, 1, 1]])
    X_zad2 = np.array([[0, 0], [1, 0], [0, 1], [1, 1]])
    Y_zad2 = np.array([[0], [1], [1], [0]])
    neronek = SiecNeuronowa(4, 4, 3)
    neronek.propagacja_wstecz(X_zad1, Y_zad1)
    print("neronek stwierdzil ze wynik pownien wygladac tak:")
    print(neronek.werdykt(X_zad1[0]))
    print(neronek.werdykt(X_zad1[1]))
    print(neronek.werdykt(X_zad1[2]))
    print(neronek.werdykt(X_zad1[3]))

