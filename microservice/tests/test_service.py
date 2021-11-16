import unittest
from microservice.service import ServiceClass


class TestServiceClass(unittest.TestCase):
    def test_one_or_zero(self):
        sc = ServiceClass(2)
        result = sc.one_or_zero()
        self.assertEqual(0, result)
