currency = csg(1.35, 5000, 1);
filternum = 3;
filterorder =30;
iterator = 1;
posder = 1;
negder = 0;





for i = 1:length(currency);
cur(i) = currency(i);
#if i > 100
#cutoff = dcbandwidth(cur, 0.2, 1);
#else 
cutoff = 1/(30);
#endif
filter = createfilter(filterorder, cutoff);
filter = filterdcnorm(filter);



#sig = filterapplication(cur, filter);

WindowLength = length(filter);

#currencysignal = csg(StartConstant, SampleN, VariationConstant);
#window(1:WindowLength) = 1/WindowLength;

#function start
sig(i) = 0;
j=1;

  for j = 1:WindowLength
   # if (i-j) < 1
  #    Final(i) = Final(i) + window(j)*currencysignal(abs(i-j)+1);
 #   else
      sig(i) = sig(i) + filter(j)*cur(rem(abs(i-j),i)+1);
#    endif
  endfor






sigder = derivesignal(sig, 1);


  if posder == 1
    if sigder(i) < 0
      localX(iterator) = i;
      localY(iterator) = sig(1, i);
      localtype(iterator) = 20;
      iterator = iterator +1;
      posder = 0;
      negder = 1;
    endif
  endif
  
  if negder == 1
    if sigder(i) >= 0
      localX(iterator) = i;
      localY(iterator) = sig(i);
      localtype(iterator) = 60;
      iterator = iterator + 1;
      posder = 1;
      negder = 0;
    endif
  endif
  
      
endfor 
clf
hold on
plot(cur, 'color', 'black')
plot(sig, 'color', 'red')
scatter(localX, localY, 15, localtype, 'filled')