import numpy as np
import scipy.io as sp
import sys, os

dataPath = os.path.join("data", "rx_data")
# dataPath = "C:\Users\laura\Documents\BYU\Engineering\Research\AMT_SQUAD\itc_paper\matlab\\rx_data_1ch"

rx_data = np.fromfile(dataPath, dtype=np.complex64)

# print(myArray[:10])x

matPath = os.path.join("data", "rx_data_feb_1_far.mat")
sp.savemat(matPath, mdict={"rx_data": rx_data})
