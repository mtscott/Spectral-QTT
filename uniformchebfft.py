import numpy as np
import matplotlib.pyplot as plt
from chebfft import *

# Program 18
# p18.m - Chebyshev differentiation via FFT (compare p11.m)
xx = np.arange(-1.0,1.01,0.01)
ff = np.exp(xx) * np.sin(5 *xx)
for N in np.arange(10,21,10):
    x = np.linspace(1.0, -1.0, 10)
    f = np.exp(x) * np.sin(5*x)
    plt.subplot(2,2, int(2*N/10-1))
    #subplot('position',[.15 .66-.4*(N==20) .31 .28])
    plt.plot(x,f,'.')
    plt.plot(xx,ff)
    plt.title('f(x), N=' + str(N))
    error = chebfft(f) - np.exp(x)*(np.sin(5*x)+5*np.cos(5*x))
    plt.subplot(2,2, int(2*N/10))
    #subplot('position',[.55 .66-.4*(N==20) .31 .28])
    plt.plot(x,error,'.')
    plt.plot(x,error)
    plt.title('error in f''(x), N=' + str(N))