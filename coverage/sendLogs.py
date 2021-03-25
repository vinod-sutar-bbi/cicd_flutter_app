import os
import json
from datetime import date
from typing import final

APP_NAME = "Flutter App"
APP_VERSION = "1.2.0"
tempStruct = {
    "testInfo": {
        "information": {}
    },
    "projInfo": {
        "date": date.today().strftime("%d/%m/%Y"),
        "ModuleName": APP_NAME,
        "version": APP_VERSION,
    },
    "codeInfo": {
        "code_reports": {
            "code_coverage": 14.757912108387233,
            "staticCodeAnalysisIssues": "-",
            "code_complexity": "NA",
        }
    },
}


class attrdict(dict):
    def __init__(self, *args, **kwargs):
        dict.__init__(self, *args, **kwargs)
        self.__dict__ = self


# var fs = require('fs'),
#     path = require('path');

# /* istanbul ignore next */
# var exists = fs.exists || path.exists;


def emptyItem():
    return attrdict({
        "title":
        "unknown",
        "file":
        "unkown",
        "lines":
        attrdict({
            "found": 0,
            "hit": 0,
            "details": [],
        }),
        "functions":
        attrdict({
            "hit": 0,
            "found": 0,
            "details": [],
        }),
        "branches":
        attrdict({
            "hit": 0,
            "found": 0,
            "details": [],
        }),
    })


def walkFile(lcov):
    data = []
    item = emptyItem()

    for line in lcov.split("\n"):
        line = line.strip()

        allparts = line.split(":")
        parts = [allparts[:1][0], ":".join(allparts[1:])]
        check = parts[0].upper()

        if check == "TN":
            item.title = parts[1].strip()

        if check == "SF":
            item.file = ":".join(parts[1:]).strip()

        if check == "FNF":
            item.functions.found = float(parts[1].strip())

        if check == "FNH":
            item.functions.hit = float(parts[1].strip())

        if check == "LF":
            item.lines.found = float(parts[1].strip())

        if check == "LH":
            item.lines.hit = float(parts[1].strip())

        if check == "DA":
            lines = parts[1].split(",")
            item.lines.details.append({
                "line": float(lines[0]),
                "hit": float(lines[1]),
            })

        if check == "FN":
            fn = parts[1].split(",")
            item.functions.details.append({
                "name": fn[1],
                "line": float(fn[0]),
                "hit": 0,
            })

        if check == "FNDA":
            fn = parts[1].split(",")
            i = -1
            for x in item.functions.details:
                i = i + 1
                if x["name"] == fn[1] and x["hit"] == 0:
                    break

            if i < len(item.functions.details):
                item.functions.details[i]["hit"] = float(fn[0])

        if check == "BRDA":
            fn = parts[1].split(",")
            if fn[3] == "-":
                taken = 0
            else:
                taken = float(fn[3])

            item.branches.details.append({
                "line": float(fn[0]),
                "block": float(fn[1]),
                "branch": float(fn[2]),
                "taken": taken,
            })

        if check == "BRF":
            item.branches.found = float(parts[1])

        if check == "BRH":
            item.branches.hit = float(parts[1])

        if "end_of_record" in line:
            data.append(item)
            item = emptyItem()
    return data


def fileReader(name):
    with open(name) as f:
        content = f.read()
    return content


def getCoveragePercent(data):
    lines, hit = 0, 0
    functions, fhits = 0, 0
    for i in data:
        functions += i["lines"]["found"]
        fhits += i["lines"]["hit"]
        for j in i["lines"]["details"]:
            lines += j["line"]
            hit += j["hit"]
    return hit / lines, fhits / functions


def getTestInformation(data):
    finalContent = []
    with open(data, encoding="utf-16le") as f:
        content = f.readlines()
    # for i in content:
    #     finalContent.append(getCorrectSting(i))
    finalResult = content[-1]
    if "All tests passed" in finalResult:
        return finalResult.split("+")[1].split(":")[0]
    return "0"


def getCorrectSting(string, count=0):
    try:
        newString = string.encode("latin-1",
                                  "ignore").decode("utf-8", "ignore")
    except:
        if count != 0:
            pass
        return string
    return newString


def sendLogsToServer(value):
    pass


if __name__ == "__main__":
    data = walkFile(fileReader("lcov.info"))
    linesPer, fPer = getCoveragePercent(data)
    testsResult = getTestInformation("../artifacts/testReport.txt")
    testData = {}
    for i in range(int(testsResult)):
        testData[f"{i}"] = {
            "passedValue": 1,
            "failed": 0,
            "Module name": "-",
            "Test name": "-",
            "TestId": "-#-#-#1.1.0",
            "Passed": True,
            "total": 1,
        }
    tempStruct["codeInfo"]["code_reports"]["code_coverage"] = fPer * 100
    tempStruct["testInfo"]["information"] = testData
    sendLogsToServer(json.dumps(tempStruct))
    print(tempStruct)
