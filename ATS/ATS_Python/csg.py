import scipy
import numpy
import os
import io
import math


def csg(StartConstant, TotalLength, VariationParameter):
	NumDerivatives = abs(20*VariationParameter);
	Duration  = numpy.zeros(NumDerivatives);
	FinalValue = numpy.full(TotalLength, StartConstant);
	Difference = 0;
	ControlParameter = StartConstant;
	ControlDifference = 0;
	ControlDuration = 0;

	for j in range(1, TotalLength):
		if j == 1: 
			FinalValue[j] = StartConstant;
		elif j!= 1:
			FinalValue[j] = FinalValue[j-1]+ ControlDifference;
		if ControlDuration == 0:
			ControlDuration = math.ceil(abs(scipy.random.normal(0.1*TotalLength,0.02*TotalLength,1)))
			ControlDifference = scipy.random.normal((StartConstant - FinalValue[j])*0.5,StartConstant*VariationParameter*0.0001,1)/ControlDuration;
		elif ControlDuration !=0:
			ControlDuration = ControlDuration - 1;
		for i in range(1, NumDerivatives):
			if Duration[i] > 0:
				Duration[i] = Duration[i] - 1;
			elif Duration[i] == 0:
				Duration[i] = math.ceil(abs(scipy.random.normal(i, NumDerivatives - i, 1)))
				FinalValue[j] = FinalValue[j] + scipy.random.normal((ControlParameter-FinalValue[j])*0.00007*VariationParameter, StartConstant*0.0001*VariationParameter, 1);
	return FinalValue
