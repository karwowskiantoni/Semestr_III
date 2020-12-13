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


def f(X, thetas):
    return np.matmul(X, thetas)


def loss(y_calc, y_pred):
    return np.sum((y_calc - y_pred) ** 2) / (len(y_pred) * 2)


# suma   (  (f(x) - y)**2  )    /2N
# suma    (( f(x) - y) * - x[iterator])     /N
def gradient(X, y_calc, y_pred):
    return np.matmul(np.transpose(X), y_calc - y_pred)/len(y_pred)


def gradientDescent(X, y_pred, thetas, alpha):
    lossvalue=1
    while lossvalue > 0.01:
        y_calc = f(X, thetas)
        lossvalue = loss(y_calc, y_pred)
        gradientvalue = gradient(X, y_calc, y_pred)
        thetas = thetas - 0.005*gradientvalue
        print(lossvalue)
        if np.average(np.abs(gradientvalue)) < 0.0001:
            break
    return thetas




if __name__ == '__main__':
    mpl.use("TkAgg")

    #                                           Dane 4
    docArguments1Four = np.array(dataFrameFour["x1"].tolist())
    docArguments2Four = np.array(dataFrameFour["x2"].tolist())
    valuesFour = np.array(dataFrameFour["y"].tolist())

    argumentsTwo = np.array(list(map(lambda x1, x2: [pow(x1, 2), x1 * x2, pow(x2, 2), x1, x2, 1]
                                     , docArguments1Four, docArguments2Four)))
    modelTwoThetas = np.random.rand(6)


    alpha = 0.01


    modelTwoThetas = gradientDescent(argumentsTwo, valuesFour, modelTwoThetas, alpha)
    readyThetasTwo = f(argumentsTwo, modelTwoThetas)




    fig = plt.figure()
    ax=plt.axes(projection="3d")
    ax.plot(docArguments1Four, docArguments2Four, valuesFour, "go", markersize=3)
    ax.plot_trisurf(docArguments1Four, docArguments2Four, readyThetasTwo, alpha=0.4, edgecolor='none',color='r')
    plt.show()
