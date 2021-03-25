def fileReader(name):
    with open(name) as f:
        content = [line.rstrip() for line in f]
    return content


def sendLogsToServer():
    pass
