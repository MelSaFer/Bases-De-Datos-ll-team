import unittest

from app import * 

class test_mariadb(unittest.TestCase):

    def test_createCountry(self):   
        result = readCountries()
        self.assertNotEqual(result, "Conexion fallida")

if __name__=="__main__":
    unittest.main()
