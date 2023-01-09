class ExampleClass(object):
    def __init__(self) -> None:
        pass

    def print(self, msg: str) -> None:
        print(msg)


if __name__ == '__main__':
    message: str = 'Hello, Python!'
    printer: ExampleClass = ExampleClass()
    printer.print(message)
