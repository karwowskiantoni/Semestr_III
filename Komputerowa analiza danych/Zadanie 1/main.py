import pandas as pd
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
        columnwidth=[80, 80],
        header=dict(
            values=[['<b>Gatunek</b>'],
                    ['<b>Liczebność (%)</b>']],
            line_color='darkslategray',
            fill_color='royalblue',
            align=['left', 'center'],
            font=dict(color='white', size=25),
            height=40
        ),
        cells=dict(
            values=valuesFirstTable,
            line_color='darkslategray',
            fill=dict(color=['paleturquoise', 'white']),
            align=['left', 'center'],
            font_size=28,
            height=50)
    )
    ])
    figOne.show()

    sepalLengthList = dataFrame["Długość działki kielicha"].values.tolist()
    sepalWidthList = dataFrame["Szerokość działki kielicha"].values.tolist()
    petalLengthList = dataFrame["Długość płatka"].values.tolist()
    petalWidthList = dataFrame["Szerokość płatka"].values.tolist()

    allMinimums = findingMinimum(sepalLengthList), findingMinimum(sepalWidthList), findingMinimum(petalLengthList), \
                  findingMinimum(petalWidthList)

    allAverages = str(arithmeticAverage(sepalLengthList)) + " (± " + str(standardDevation(sepalLengthList)) + ")", \
                  str(arithmeticAverage(sepalWidthList)) + " (± " + str(standardDevation(sepalWidthList)) + ")", \
                  str(arithmeticAverage(petalLengthList)) + " (± " + str(standardDevation(petalLengthList)) + ")", \
                  str(arithmeticAverage(petalWidthList)) + " (± " + str(standardDevation(petalWidthList)) + ")"

    allMedians = str(median(sorted(sepalLengthList))) + " (" + str(median(sorted(sepalLengthList)[:len(sepalLengthList) // 2]))\
                 + " - " + str(median(sorted(sepalLengthList)[(len(sepalLengthList) // 2):])) + ")", str(median(sorted(sepalWidthList))) + \
                 " (" + str(median(sorted(sepalWidthList)[:len(sepalWidthList) // 2]))\
                 + " - " + str(median(sorted(sepalWidthList)[(len(sepalWidthList) // 2):])) + ")", \
                 str(median(sorted(petalLengthList))) + " (" + str(median(sorted(petalLengthList)[:len(petalLengthList) // 2]))\
                 + " - " + str(median(sorted(petalLengthList)[(len(petalLengthList) // 2):])) + ")", \
                 str(median(sorted(petalWidthList))) + " (" + str(median(sorted(petalWidthList)[:len(petalWidthList) // 2]))\
                 + " - " + str(median(sorted(petalWidthList)[(len(petalWidthList) // 2):])) + ")"

    allMaxiumums = findingMaximum(sepalLengthList), findingMaximum(sepalWidthList), findingMaximum(petalLengthList), \
                   findingMaximum(petalWidthList)

    #Table no.2
    figTwo = go.Figure(data=[go.Table(
        columnorder=[1, 2],
        columnwidth=[150, 200],
        header=dict(
            values=[['<b>Cecha</b>'],
                    ['<b>Minimum</b>'], ['<b>Śr.arytm.(± odch. stand.)</b>'],
                    ['<b>Mediana (Q1 - Q3)</b>'], ['Maksimum']],
            line_color='darkslategray',
            fill_color='royalblue',
            align=['left', 'center'],
            font=dict(color='white', size=23),
            height=40
        ),
        cells=dict(
            values=[["Długość działki kielicha (cm)", "Szerokość działki kielicha (cm)", "Długość płatka (cm)",
                        "Szerokość płatka (cm)"], allMinimums, allAverages, allMedians, allMaxiumums],
            line_color='darkslategray',
            fill=dict(color=['paleturquoise', 'white']),
            align=['left', 'center'],
            font_size=40,
            height=20)
    )
    ])
    #figTwo.show();
