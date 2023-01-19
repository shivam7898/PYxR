import sys
if (False or 'pandas' not in sys.modules):
    #CAUTION: Avoid implicit import i.e. 'from x import y'
    import os, multiprocessing
    q_EXE_PATH = os.path.join(sys.exec_prefix, 'pythonw.exe')
    sys.executable = q_EXE_PATH
    sys._base_executable = q_EXE_PATH
    multiprocessing.set_executable(q_EXE_PATH) 
    import pip, copy, types, math, time
    import pandas as pd, numpy as np
    import statsmodels.api as sm
    import seaborn as sns
    import sklearn
    import sklearn.datasets
    import matplotlib as mpl
    import matplotlib.pyplot as plt
    import imblearn
    #CAUTION: Due to R "arrow" & Python "pyarrow" conflict do not load it in R
    import pyarrow
    import pyarrow.feather
    import joblib
    #No Scientific Notation in NumPy
    np.set_printoptions(formatter={'float_kind':'{:f}'.format})
else:
    print("Python Modules not loaded again.")

#
