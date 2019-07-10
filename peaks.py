#!/usr/bin/env python
from scipy import signal
import numpy as np
import sys
data = np.loadtxt(sys.stdin, dtype=np.float)
peaks = signal.find_peaks_cwt(data, [5,5,5,10,10,10,20])
#peaks, properties = signal.find_peaks(data)
print( ", ".join([ str(x +1) for x in peaks]))
