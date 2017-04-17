#Performance test for duration/weight for multiple integrals on currency for random generation purposes
#Made by Olivier Sirois
clear 
minOrder = 0;
maxOrder = 20;
minWeightOrder = -10;
maxWeightOrder = -5;
minWeight = 1;
maxWeight = 9;
minDuration = 1;
maxDuration = 20;

PeakPercentageGain = 0.010;
maxScore = 2000;
lp = 1
PercentageGain = PeakPercentageGain/(maxOrder-minOrder+1); 

minWeightindex = 1;
maxWeightindex = (abs(minWeightOrder-maxWeightOrder)+1)*(abs(minWeight-maxWeight)+1);
k = minWeightindex;

axeX = 0;
axey = 0;
axez = 0;
couleur = 0;

for i = minOrder:maxOrder
    printf('-------------------------------------------------------------------------order');
    printf(num2str(i));
    printf('\n');
    fflush(stdout);
  for j = minDuration:maxDuration
    printf('Duration');
    printf(num2str(j));
    printf('\n');
    fflush(stdout);
    for b = minWeightOrder:maxWeightOrder
      
      for a = minWeight:maxWeight
        dataset(1:j) = a*10^(b); 
        finalvalue = integrate(dataset,1, i);
        percentage = (finalvalue(j)-1);
        if abs(percentage) >= PercentageGain
          score = 1/abs(percentage);
        elseif abs(percentage) < PercentageGain
          score = maxScore/PercentageGain*abs(percentage);
        endif
        #weight(k) = a*10^(b);
        #finaldata(i+1,j,k) = score;
        axe(3,lp) = i;
        axeZ(lp) = i;
        axe(1,lp) = a*10^(b);
        axeX(lp) = a*10^(b);
        axe(2,lp) = j;
        axeY(lp) = j;
        axe(4,lp) = score;
        couleur(lp) = score;
        
        
        #if k >= maxWeightindex
        #  k = minWeightindex-1;
        #endif
        #k = k+1;
        lp = lp+1;
        #disp(lp)      
        
      endfor
      
      
    endfor
    
    
  endfor
  
  
endfor

        