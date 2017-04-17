#Script for generating Random Currency Signal from LEngth, initial value and variation parameter
#Created by: (Olivier Sirois)

clear

StartConstant = 1.35;
TotalLength = 500;
VariationParameter = 1;
NumDerivatives = abs(20*VariationParameter);

#FinalValue(1:TotalLength) = StartConstant;

Duration(1:NumDerivatives) = 0;
FinalValue(1:TotalLength) = StartConstant;
Difference = 0;
ControlParameter = StartConstant;
ControlDifference = 0;
ControlDuration = 0;



for j = 1:TotalLength
  
  if j == 1
    FinalValue(j) = StartConstant;
  elseif j != 1
    FinalValue(j) = FinalValue(j-1) + ControlDifference;
  endif
  
  if ControlDuration == 0
    ControlDuration = ceil([0,abs(normrnd(0.1*TotalLength,0.02*TotalLength))])(2);
    ControlDifference = normrnd((ControlParameter - FinalValue(j))*0.5,StartConstant*VariationParameter*0.0005)/ControlDuration;
  elseif ControlDuration != 0
    ControlDuration = ControlDuration - 1;
  endif
  
  for i = 1:NumDerivatives
  
    if Duration(i) > 0
      Duration(i) = Duration(i) - 1;   
      
    elseif Duration(i) == 0
      Duration(i) = ceil([0,abs(normrnd((i)*VariationParameter,(NumDerivatives-i)))])(2);
      FinalValue(j) = FinalValue(j) + normrnd((ControlParameter-FinalValue(j))*0.0001*VariationParameter, StartConstant*0.0001*VariationParameter);
      
      
      endif  
         
    endfor

  endfor  

plot(1:TotalLength, FinalValue)
