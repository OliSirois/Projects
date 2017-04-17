#filter application prototype
#created by Olivier Sirois
function [RetVal] = filterapplication(currencysignal, windowapplied)


WindowLength = length(windowapplied);

#currencysignal = csg(StartConstant, SampleN, VariationConstant);
#window(1:WindowLength) = 1/WindowLength;

#function start
Final(1:length(currencysignal)) = 0;
i=1;
j=1;

for i = 1:length(currencysignal)
  for j = 1:WindowLength
   # if (i-j) < 1
  #    Final(i) = Final(i) + window(j)*currencysignal(abs(i-j)+1);
 #   else
      Final(i) = Final(i) + windowapplied(j)*currencysignal(rem(abs(i-j),i)+1);
#    endif
  endfor
endfor
#clf

#hold on
#plot(currencysignal, 'color','red')
#plot(Final, 'color', 'cyan')
#hold off

RetVal = Final;
endfunction
      