#Script for generating Random Currency Signal from LEngth, initial value and variation parameter
#Created by: (Olivier Sirois)

clear

StartConstant = 1.35;
TotalLength = 500;
VariationParameter = 0.005;
NumDerivatives = 40;

#FinalValue(1:TotalLength) = StartConstant;

Duration(1:NumDerivatives) = 0;

for i = 1:NumDerivatives
  tempnoise = normrnd(0,VariationParameter/(5*i));
  for j = 1:TotalLength
    if Duration(i) > 0
      Duration(i) = Duration(i) - 1;
      noise(i, j) = tempnoise;
      endif
      
    if Duration(i) == 0
      Duration(i) = ceil([0,abs(normrnd(30,30))])(2);
      tempnoise = normrnd(0,VariationParameter/(0.5*i));
      noise(i,j) = tempnoise;
      endif
    endfor
  endfor  
  
Position(1:TotalLength) = (1:TotalLength);

for x = 1:TotalLength 
  #noise(x) = normrnd(0, VariationParameter);
endfor

for i = 1:TotalLength
  FinalNoise(i) = 0;
  for j = 1:NumDerivatives
    FinalNoise(i) = FinalNoise(i) + noise(j, i);
    endfor
  endfor 

FinalValue(1:TotalLength) = FinalNoise + StartConstant;
plot(Position, FinalValue)

clear