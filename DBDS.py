import pandas as pd
import numpy as np
import math
import scipy as sc

# this function calculates the required interest rate for doubling any amount in any
# given period
## n is the given time in month and c is the compounding frequency in a year
def doublebenefit(duration, compounding_freq, initial_deposit):
    duration = duration / 12
    interest_per_payment = compounding_freq * (
        math.exp(math.log(2) / (duration * compounding_freq)) - 1
    )
    interest_rate = compounding_freq * (
        math.exp(math.log(2) / (duration * compounding_freq)) - 1
    )
    future_value = np.fv(
        rate=interest_per_payment, pmt=0, nper=duration, pv=-initial_deposit, when=1
    )
    print("Required Interest Rate is {:.2f}".format(interest_rate * 100) + "%")
    print("The Future Value will be {:.2f}".format(future_value))
    
doublebenefit(120, 1, 100000)
