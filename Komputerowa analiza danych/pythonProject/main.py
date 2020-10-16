import pandas as pd
import numpy as np
import math
import plotly.graph_objects as go

#Names for columns and reading csv
columnsList = ["Długość działki kielicha", "Szerokość działki kielicha", "Długość płatka", "Szerokość płatka",
                "Gatunek"]
dataFrame = pd.read_csv("data.csv", header=None, names=columnsList)

#Functions
def findingMinimum(operator):
    currentMinimum = operator[0]
    for i in operator:
        if i < currentMinimum:
            currentMinimum = i
    return currentMinimum


def findingMaximum(operator):
    currentMaximum = operator[0]
    for i in operator:
        if i > currentMaximum:
            currentMaximum = i
    return currentMaximum


def arithmeticAverage(operator):
    divider = len(operator)
    sum = 0
    for i in operator:
        sum += i
    average = sum / divider
    return round(average, 2)


def standardDevation(operator):
    averageValue = arithmeticAverage(operator)
    divider = len(operator)
    sum = 0
    for i in operator:
        sum += math.pow((i - averageValue), 2)
    return round(math.sqrt(sum / divider), 2)


def median(operator):
    if len(operator) % 2 == 1:
        return operator[len(operator) // 2]
    else:
        midValue = operator[len(operator) // 2 - 1]
        nextToMidValue = operator[(len(operator) // 2)]
        return ((midValue + nextToMidValue) / 2)


def charValues(operator):
    charValuesList = [findingMinimum(operator), arithmeticAverage(operator),
                      standardDevation(operator),
                      median(np.sort(operator)), median(np.sort(operator)[:len(operator) // 2]),
                      median(np.sort(operator)[(len(operator) // 2):]), findingMaximum(operator)]
    print(charValuesList)
    return charValuesList

if __name__ == '__main__':

    #Values for table no.1
    speciesList = dataFrame["Gatunek"].values.tolist()
    setosaNumbers = speciesList.count(0)
    versicolorNumbers = speciesList.count(1)
    virginicaNumbers = speciesList.count(2)
    allFlowersNumbers = len(speciesList)
    setosaPercentage = round((setosaNumbers / 150) * 100, 1)
    versicolorPercentage = round((versicolorNumbers / 150) * 100, 1)
    virginicaPercentage = round((virginicaNumbers / 150) * 100, 1)
    setosaFirstTableValues = (str(setosaNumbers) + " (" + str(setosaPercentage)) + "%)"
    veriscolorFirstTableValues = (str(versicolorNumbers) + " (" + str(versicolorPercentage)) + "%)"
    virginicaFirstTableValues = (str(virginicaNumbers) + " (" + str(virginicaPercentage)) + "%)"
    allFlowersFirstTableValues = (str(allFlowersNumbers)) + " (100%)"
    valuesFirstTable = [["setosa", "versicolor", "virginica", "<b>Razem</b>"],
                        [setosaFirstTableValues, veriscolorFirstTableValues, virginicaFirstTableValues,
                         allFlowersFirstTableValues]]
    #Table no.1
    figOne = go.Figure(data=[go.Table(
        columnorder=[1, 2],
        columnwidth=[80, 400],
        header=dict(
            values=[['<b>Gatunek</b>'],
                    ['<b>Liczebność (%)</b>']],
            line_color='darkslategray',
            fill_color='royalblue',
            align=['left', 'center'],
            font=dict(color='white', size=12),
            height=40
        ),
        cells=dict(
            values=valuesFirstTable,
            line_color='darkslategray',
            fill=dict(color=['paleturquoise', 'white']),
            align=['left', 'center'],
            font_size=12,
            height=30)
    )
    ])
    #figOne.show()

    sepalLengthList = dataFrame["Długość działki kielicha"].values.tolist()
    sepalWidthList = dataFrame["Szerokość działki kielicha"].values.tolist()
    petalLengthList = dataFrame["Długość płatka"].values.tolist()
    petalWidthList = dataFrame["Szerokość płatka"].values.tolist()

    charValues(sepalLengthList)
    charValues(sepalWidthList)
    charValues(petalLengthList)
    charValues(petalWidthList)


