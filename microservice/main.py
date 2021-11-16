import os
from microservice.service import ServiceClass
import time


def main():
    if "BITDAM" not in os.environ:
        raise ValueError("service cannot be run without environment variable \"BITDAM\"")
    value_to_multiply = int(os.environ["BITDAM"])
    sc = ServiceClass(value_to_multiply)
    while True:
        print(sc.one_or_zero())
        time.sleep(0.1)



if __name__ == "__main__":
    main()
