import HelloPython
import unittest
import unittest.mock as mock


class Test_HelloPython(unittest.TestCase):
    def setUp(self) -> None:
        patcher: mock.patch = mock.patch('builtins.print')
        self.mock_print: mock.MagicMock = patcher.start()
        self.addCleanup(patcher.stop)
        self.hp: HelloPython.ExampleClass = HelloPython.ExampleClass()

    def test_Print(self) -> None:
        self.hp.print('Hello, Test')
        self.mock_print.assert_called_once_with('Hello, Test')


if __name__ == '__main__':
    unittest.main()
