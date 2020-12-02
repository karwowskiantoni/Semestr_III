import math
import pandas as pd
import numpy as np
from matplotlib import pyplot as plt

columnsOne = ["x", "y"]
dataFrameOne = pd.read_csv("data1.csv", names=columnsOne)
dataFrameTwo = pd.read_csv("data2.csv", names=columnsOne)
columnsTwo = ["x1", "x2", 'y']
dataFrameThree = pd.read_csv("data3.csv", names=columnsTwo)
dataFrameFour = pd.read_csv("data4.csv", names=columnsTwo)





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
    #
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
    # plt.plot(docArgumentsOne, valuesOne, 'go')
    # plotLine(readyThetasOne, docArgumentsOne, "r")
    # plotLine(readyThetasTwo, docArgumentsOne, "b")
    # plotLine(readyThetasThree, docArgumentsOne, "k")
    # plt.show()
                                              # DANE 2
    docArgumentsTwo = np.array(dataFrameTwo["x"].tolist())
    valuesTwo = np.array(dataFrameTwo["y"].tolist())

    argumentsOne = np.array(list(map(lambda x: [x], docArgumentsTwo)))
    modelOneTheta = np.random.rand(1)

    argumentsTwo = np.array(list(map(lambda x: [x, 1], docArgumentsTwo)))
    modelTwoThetas = np.random.rand(2)

    argumentsThree = np.array(list(map(lambda x: [pow(x, 2), math.sin(x), 1], docArgumentsTwo)))
    modelThreeThetas = np.random.rand(3)

    alpha = 0.001

    modelOneTheta = gradientDescent(argumentsOne, valuesTwo, modelOneTheta, alpha)
    readyThetasOne = []
    for x in argumentsOne:
        readyThetasOne.append(fX(x, modelOneTheta))

    modelTwoThetas = gradientDescent(argumentsTwo, valuesTwo, modelTwoThetas, alpha)
    readyThetasTwo = []
    for x in argumentsTwo:
        readyThetasTwo.append(fX(x, modelTwoThetas))

    modelThreeThetas = gradientDescent(argumentsThree, valuesTwo, modelThreeThetas, alpha)
    readyThetasThree = []
    for x in argumentsThree:
        readyThetasThree.append(fX(x, modelThreeThetas))

    plt.plot(docArgumentsTwo, valuesTwo, 'go')
    plotLine(readyThetasOne, docArgumentsTwo, "r")
    plotLine(readyThetasTwo, docArgumentsTwo, "b")
    plotLine(readyThetasThree, docArgumentsTwo, "k")
    plt.show()
    #                                           Dane 3
    # docArguments1Three = np.array(dataFrameThree["x1"].tolist())
    # docArguments2Three = np.array(dataFrameThree["x2"].tolist())
    # valuesThree = np.array(dataFrameThree["y"].tolist())
    # argumentsOne = np.array(list(map(lambda x1, x2: [x1, x2, 1], docArguments1Three, docArguments2Three)))
    # modelOneTheta = np.random.rand(3)
    # #print(argumentsOne)
    # argumentsTwo = np.array(list(map(lambda x1, x2: [pow(x1, 2), x1 * x2, pow(x2, 2), x1, x2, 1]
    #                                  , docArguments1Three, docArguments2Three)))
    # modelTwoThetas = np.random.rand(6)

    #                                           Dane 4
    # docArguments1Four = np.array(dataFrameFour["x1"].tolist())
    # docArguments2Four = np.array(dataFrameFour["x2"].tolist())
    # valuesThree = np.array(dataFrameFour["y"].tolist())
    # argumentsOne = np.array(list(map(lambda x1, x2: [x1, x2, 1], docArguments1Four, docArguments2Four)))
    # modelOneTheta = np.random.rand(3)
    #
    # argumentsTwo = np.array(list(map(lambda x1, x2: [pow(x1, 2), x1 * x2, pow(x2, 2), x1, x2, 1]
    #                                  , docArguments1Four, docArguments2Four)))
    # modelTwoThetas = np.random.rand(6)
