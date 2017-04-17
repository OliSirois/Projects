import scipy.signal as sig
import numpy as np
import math

class filter:

	def __init__(self,filterorder = 10, cutoff = 0.5):
		self.filter = sig.firwin(filterorder, cutoff);

	def createfilter(self,filterorder, cutoff):
		self.filter = sig.firwin(filterorder, cutoff);

	def filterdcnorm(self):
		filterfft = np.fft.fft(self.filter);
		offsetreq = 1/abs(filterfft[0]);
		self.filter = offsetreq * self.filter;


	def filterapplication(self, signal):
		final = np.convolve(signal, self.filter)
		for i in range(0, len(self.filter)-1):
			temp = 0
			for j in range(0, len(self.filter)-1):
				temp = temp + self.filter[j]*signal[abs(i-j)%(i+1)] ## PROBLEM HERE FIX 
			final[i] = temp
		final = np.delete(final, range(len(signal), len(final)));
		return final


