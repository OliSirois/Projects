clear

StartConstant = 1.35;
TotalLength = 500;
VariationParameter = 1;
NumDerivatives = 20*VariationParameter;

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
    FinalValue(j) = FinalValue(j-1) + TargetStep(j-StartIndex);
  endif
  
  if ControlDuration == 0
    ControlOrder = ceil([0,abs(normrnd(0,10))])(2);
    ControlDuration = ceil([0,abs(normrnd(0.1*TotalLength,0.02*TotalLength))])(2);
    ControlTarget = normrnd((ControlParameter - FinalValue(j))*0.5,VariationParameter*0.0005)/ControlDuration;
    TargetStep(1:(ControlDuration+1)) = ones;
    StartIndex = j;
    TargetStep = integrate(TargetStep, 0, ControlOrder);
    TargetStep = TargetStep/TargetStep(length(TargetStep))*ControlTarget;
    
    
  elseif ControlDuration != 0
    ControlDuration = ControlDuration - 1;
  endif
  
 

endfor

plot(1:length(FinalValue), FinalValue)