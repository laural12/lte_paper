import numpy as np
import scipy.io as sp
import sys, os

dataPath = os.path.join("MATLAB", "rx_data_test3")
# dataPath = "C:\Users\laura\Documents\BYU\Engineering\Research\AMT_SQUAD\itc_paper\matlab\\rx_data_1ch"

rx_data = np.fromfile(dataPath, dtype=np.complex64)

# print(myArray[:10])x

matPath = os.path.join("MATLAB", "rx_data_test3.mat")
sp.savemat(matPath, mdict={"rx_data": rx_data})
