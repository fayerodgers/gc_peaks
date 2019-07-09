#!/usr/bin/env python
from scipy import signal
import numpy as np
import sys
data = np.loadtxt(sys.stdin, dtype=np.float)
peakind = signal.find_peaks_cwt(data, np.arange(1,100))
str=np.array2string(peakind, separator = ", ", prefix="", suffix="")
print str.replace("[", "").replace("]", "")
