#Script for generating Random Currency Signal from LEngth, initial value and variation parameter
#Created by: (Olivier Sirois)

clear

StartConstant = 1.35;
TotalLength = 500;
VariationParameter = 0.005;
NumDerivatives = 15;

#FinalValue(1:TotalLength) = StartConstant;

Duration(1:NumDerivatives) = 0;
noise(1:NumDerivatives, 1:TotalLength) = 0;
FinalNoise(1:TotalLength) = 0;
FinalValue(1:TotalLength) = StartConstant;
Difference = 0;
ControlConstant = StartConstant

for j = 1:TotalLength
  #tempnoise = normrnd(0,VariationParameter/(2^i));
  
  for i = 1:NumDerivatives
  
      
      
    if Duration(i) > 0
      Duration(i) = Duration(i) - 1;
      noise(i, j) = tempnoise(i,Endstate(i)-Duration(i));
    elseif Duration(i) == 0
      Duration(i) = ceil([0,abs(normrnd(0,10))])(2);
    
      if j == 1
        CarryOver(i) = 0;
        tempnoise(i,1:Duration(i)) = normrnd(0,VariationParameter/(8^(i)));
      elseif j != 1
        CarryOver(i) = noise(i, j-1);
        
        tempnoise(i,1:Duration(i)) = normrnd(Difference,VariationParameter/(8^(i)));
      endif  
      
        
      tempnoise(i,:) = integrate(tempnoise(i,:), 0, i);
      Endstate(i) = Duration(i);
      noise(i,j) = tempnoise(i,Endstate(i)-Duration(i)+1);
      
      
      endif
      
    endfor
    #temp = sum(tempnoise, 1)
    
    #plot(1:length(temp), temp)
    #FinalNoise(j) = temp(j);
    #clear temp;
    #disp(noise(:,j))
    #disp('111111111111111')
    tempo = 0;
    for i = 1:NumDerivatives
      tempo = noise(i,j) + tempo;
    endfor
    
    FinalNoise(j) = tempo;
    FinalValue(j) = tempo+StartConstant;
    Difference = (ControlConstant-FinalValue(j))/(2.3^i);
    
    if j > 5    
      for o = 0:5       
        if abs(ControlConstant-FinalValue(j-o)) < 0.001
          ControlConstant = ControlConstant + normrnd(0,0.0001*o);
        endif
      endfor
    endif
    

    
    
  endfor  
  
#Position(1:TotalLength) = (1:TotalLength);

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
plot(1:TotalLength, FinalValue)
