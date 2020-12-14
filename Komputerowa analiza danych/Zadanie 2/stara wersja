import math
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl


columnsOne = ["x", "y"]
dataFrameOne = pd.read_csv("data1.csv", names=columnsOne)
dataFrameTwo = pd.read_csv("data2.csv", names=columnsOne)
columnsTwo = ["x1", "x2", 'y']
dataFrameThree = pd.read_csv("data3.csv", names=columnsTwo)
dataFrameFour = pd.read_csv("data4.csv", names=columnsTwo)


def srednia(tablica):
    suma = 0
    for x in tablica:
        suma += x
    return suma / len(tablica)


def roznica(tablica1, tablica2):
    tablica3 = np.array(tablica1)
    for x in range(len(tablica1)):
        tablica3[x] = tablica2[x] - tablica1[x]
    return tablica3


def wariancja(x):
    result = 0
    for i in range(len(x)):
        result += pow(x[i] - np.mean(x), 2)
    return result/len(x)


def srednibladkwadratowy(thetas, values):
    return srednia(pow(roznica(thetas, values), 2)) / 2


def maksimum(tablica):
    najwieksza = 0
    for x in tablica:
        if math.fabs(x) > najwieksza:
            najwieksza = math.fabs(x)
    return najwieksza


def rkwadrat(thetas, values):
    return 1 - wariancja(roznica(thetas, values)) / wariancja(values)


def plotLine(y, x, colour):
    plt.plot(x, y, colour)


def fX(x, theta):
    return np.sum(x * theta)


def objectiveFunction(x, y, thetas):
    N = len(x)
    value = 0.0
    for i in range(N):
        value += pow(fX(x[i], thetas) - y[i], 2)
    return value * (1 / 2 * N)


def derivativeValue(x, y, thetas, iterator):
    N = len(x)
    value = 0.0
    for i in range(len(x)):
        value += (fX(x[i], thetas) - y[i]) * x[i][iterator]
    return value / N


def gradientDescent(x, y, thetas, alpha):
    derVal = np.array(thetas)
    while objectiveFunction(x, y, thetas) > 0.00001:
        for i in range(len(thetas)):
            thetas[i] = thetas[i] - alpha * derivativeValue(x, y, thetas, i)
            derVal[i] = abs(derivativeValue(x, y, thetas, i))
        if (np.sum(derVal)) < 0.001:
            break
    return thetas


if __name__ == '__main__':
    mpl.use("TkAgg")
                                               # DANE 1
    # docArgumentsOne = np.array(dataFrameOne["x"].tolist())
    # valuesOne = np.array(dataFrameOne["y"].tolist())
    # argumentsOne = np.array(list(map(lambda x: [x], docArgumentsOne)))
    # modelOneTheta = np.random.rand(1)
    #
    # argumentsTwo = np.array(list(map(lambda x: [x, 1], docArgumentsOne)))
    # modelTwoThetas = np.random.rand(2)
    #
    # argumentsThree = np.array(list(map(lambda x: [pow(x, 2), math.sin(x), 1], docArgumentsOne)))
    # modelThreeThetas = np.random.rand(3)
    #
    # alpha = 0.01




    # modelOneTheta = gradientDescent(argumentsOne, valuesOne, modelOneTheta, alpha)
    # readyThetasOne = []
    # for x in argumentsOne:
    #     readyThetasOne.append(fX(x, modelOneTheta))

    # modelTwoThetas = gradientDescent(argumentsTwo, valuesOne, modelTwoThetas, alpha)
    # readyThetasTwo = []
    # for x in argumentsTwo:
    #     readyThetasTwo.append(fX(x, modelTwoThetas))
    #
    # modelThreeThetas = gradientDescent(argumentsThree, valuesOne, modelThreeThetas, alpha)
    # readyThetasThree = []
    # for x in argumentsThree:
    #     readyThetasThree.append(fX(x, modelThreeThetas))
    #




    # print("wartości parametrów p:")
    # for p in modelThreeThetas:
    #     print(p)
    #
    # print("sredni blad kwadratowy:")
    # print(srednibladkwadratowy(readyThetasThree, valuesOne))
    #
    # print("największa wartość odchylenia:")
    # print(maksimum(roznica(readyThetasThree, valuesOne)))
    #
    # print("RKwadrat:")
    # print(rkwadrat(valuesOne, readyThetasThree))
    #
    # plt.hist(roznica(readyThetasThree, valuesOne))
    # plt.show()





    # plt.plot(docArgumentsOne, valuesOne, 'go')
    # plotLine(readyThetasOne, docArgumentsOne, "r")
    # plotLine(readyThetasTwo, docArgumentsOne, "b")
    # plotLine(readyThetasThree, docArgumentsOne, "k")
    # plt.show()



                                                 # DANE 2
    print("cojest")
    docArgumentsTwo = np.array(dataFrameTwo["x"].tolist())
    valuesTwo = np.array(dataFrameTwo["y"].tolist())

    argumentsOne = np.array(list(map(lambda x: [x], docArgumentsTwo)))
    modelOneTheta = np.random.rand(1)

    argumentsTwo = np.array(list(map(lambda x: [x, 1], docArgumentsTwo)))
    modelTwoThetas = np.random.rand(2)

    argumentsThree = np.array(list(map(lambda x: [pow(x, 2), math.sin(x), 1], docArgumentsTwo)))
    modelThreeThetas = np.random.rand(3)

    alpha = 0.001






    # modelOneTheta = gradientDescent(argumentsOne, valuesTwo, modelOneTheta, alpha)
    # readyThetasOne = []
    # for x in argumentsOne:
    #     readyThetasOne.append(fX(x, modelOneTheta))

    modelTwoThetas = gradientDescent(argumentsTwo, valuesTwo, modelTwoThetas, alpha)
    readyThetasTwo = []
    for x in argumentsTwo:
        readyThetasTwo.append(fX(x, modelTwoThetas))
    #
    # modelThreeThetas = gradientDescent(argumentsThree, valuesTwo, modelThreeThetas, alpha)
    # readyThetasThree = []
    # for x in argumentsThree:
    #     readyThetasThree.append(fX(x, modelThreeThetas))
    #






    print("wartości parametrów p:")
    for p in modelTwoThetas:
        print(p)

    print("sredni blad kwadratowy:")
    print(srednibladkwadratowy(readyThetasTwo, valuesTwo))

    print("największa wartość odchylenia:")
    print(maksimum(roznica(readyThetasTwo, valuesTwo)))

    print("RKwadrat:")
    print(rkwadrat(valuesTwo, readyThetasTwo))

    plt.hist(roznica(readyThetasTwo, valuesTwo))
    plt.show()





    # plt.plot(docArgumentsTwo, valuesTwo, 'go')
    # plotLine(readyThetasOne, docArgumentsTwo, "r")
    # plotLine(readyThetasTwo, docArgumentsTwo, "b")
    # plotLine(readyThetasThree, docArgumentsTwo, "k")
    # plt.show()



    #                                           Dane 3
    # docArguments1Three = np.array(dataFrameThree["x1"].tolist())
    # docArguments2Three = np.array(dataFrameThree["x2"].tolist())
    # valuesThree = np.array(dataFrameThree["y"].tolist())
    #
    # argumentsOne = np.array(list(map(lambda x1, x2: [x1, x2, 1], docArguments1Three, docArguments2Three)))
    # modelOneThetas = np.random.rand(3)
    #
    # argumentsTwo = np.array(list(map(lambda x1, x2: [pow(x1, 2), x1 * x2, pow(x2, 2), x1, x2, 1]
    #                                  , docArguments1Three, docArguments2Three)))
    # modelTwoThetas = np.random.rand(6)
    #
    # alpha = 0.01



    # modelOneThetas = gradientDescent(argumentsOne, valuesThree, modelOneThetas, alpha)
    # modelOneThetas = [1.95479841,-0.47228692, 0.04291976]
    # readyThetasOne = []
    # for x in argumentsOne:
    #     readyThetasOne.append(fX(x, modelOneThetas))

    # # modelTwoThetas = gradientDescent(argumentsTwo, valuesThree, modelTwoThetas, alpha)
    # modelTwoThetas = [ 0.0174358, 0.07067134, 0.00321918, 1.62682375, -0.68373276, 0.80599261]
    # readyThetasTwo = []
    # for x in argumentsTwo:
    #     readyThetasTwo.append(fX(x, modelTwoThetas))





    # print("wartości parametrów p:")
    # for p in modelTwoThetas:
    #     print(p)
    #
    # print("sredni blad kwadratowy:")
    # print(srednibladkwadratowy(readyThetasTwo, valuesThree))
    #
    # print("największa wartość odchylenia:")
    # print(maksimum(roznica(readyThetasTwo, valuesThree)))
    #
    # print("RKwadrat:")
    # print(rkwadrat(valuesThree, readyThetasTwo))
    #
    # plt.hist(roznica(readyThetasTwo, valuesThree))
    # plt.show()



    # fig = plt.figure()
    # ax=plt.axes(projection="3d")
    # ax.plot(docArguments1Three, docArguments2Three, valuesThree, "go", markersize=3)
    # ax.plot_trisurf(docArguments1Three, docArguments2Three, readyThetasOne, alpha=0.4, edgecolor='none',color='b')
    # ax.plot_trisurf(docArguments1Three, docArguments2Three, readyThetasTwo, alpha=0.4, edgecolor='none',color='r')
    # plt.show()

    #                                           Dane 4
    # docArguments1Four = np.array(dataFrameFour["x1"].tolist())
    # docArguments2Four = np.array(dataFrameFour["x2"].tolist())
    # valuesFour = np.array(dataFrameFour["y"].tolist())
    # argumentsOne = np.array(list(map(lambda x1, x2: [x1, x2, 1], docArguments1Four, docArguments2Four)))
    # modelOneTheta = np.random.rand(3)
    #
    # argumentsTwo = np.array(list(map(lambda x1, x2: [pow(x1, 2), x1 * x2, pow(x2, 2), x1, x2, 1]
    #                                  , docArguments1Four, docArguments2Four)))
    # modelTwoThetas = np.random.rand(6)
    #
    # alpha = 0.01




    # modelOneThetas = gradientDescent(argumentsOne, valuesFour, modelOneThetas, alpha)
    # modelOneThetas = [0.55902405, -2.79491736, 10.4437188]
    # readyThetasOne = []
    # for x in argumentsOne:
    #     readyThetasOne.append(fX(x, modelOneThetas))

    # modelTwoThetas = gradientDescent(argumentsTwo, valuesFour, modelTwoThetas, alpha)
    # modelTwoThetas = [0.9971784, -0.99941064, -0.51674964, -1.97888668, 3.09494912, 4.8587025]
    # readyThetasTwo = []
    # for x in argumentsTwo:
    #     readyThetasTwo.append(fX(x, modelTwoThetas))
    #




    # print("wartości parametrów p:")
    # for p in modelTwoThetas:
    #     print(p)
    #
    # print("sredni blad kwadratowy:")
    # print(srednibladkwadratowy(readyThetasTwo, valuesFour))
    #
    # print("największa wartość odchylenia:")
    # print(maksimum(roznica(readyThetasTwo, valuesFour)))
    #
    # print("RKwadrat:")
    # print(rkwadrat(valuesFour, readyThetasTwo))
    #
    # plt.hist(roznica(readyThetasOne, valuesFour))
    # plt.show()
    #
    #



    # fig = plt.figure()
    # ax=plt.axes(projection="3d")
    # ax.plot(docArguments1Four, docArguments2Four, valuesFour, "go", markersize=3)
    # ax.plot_trisurf(docArguments1Four, docArguments2Four, readyThetasOne, alpha=0.4, edgecolor='none',color='b')
    # ax.plot_trisurf(docArguments1Four, docArguments2Four, readyThetasTwo, alpha=0.4, edgecolor='none',color='r')
    # plt.show()
