


clear
filterorderminone = 10;
normfreq = 0.11;

for i=1:filterorderminone
if (i-(filterorderminone+1)/2) == 0
  value(i) = normfreq/pi;
else
  value(i) = sin((i-(filterorderminone+1)/2)*normfreq)/(pi*(i-(filterorderminone+1)/2));
endif
  
  endfor

plot(value)