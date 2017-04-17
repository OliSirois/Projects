clear

numorders = 6;
orderstep = 18;
startorder = 5;
cutoff = 0.2;

sig = csg(1.35, 5000, 1);

for i = 1:numorders
  filter = createfilter(startorder+orderstep*(i-1), cutoff/(i*5));
  for j = 1:length(filter)
    allfilters(i, j) = filter(j);
    endfor
    
endfor


for i = 1:length(allfilters(:,1))
  filttonorm = allfilters(i,:);
  filttonorm = filterdcnorm(filttonorm);
  for j = 1:length(filttonorm)
    allfilters(i,j) = filttonorm(j);
  endfor
endfor

for i = 1:length(allfilters(:,1))
  sigfil(i, :) = filterapplication(sig, allfilters(i,:));
  endfor
  
clf
hold on

plot(sig, 'color', 'black')
plot(sigfil(1,:), 'color', 'red')
plot(sigfil(2,:), 'color', 'yellow')
plot(sigfil(3,:), 'color', 'green')
plot(sigfil(4,:), 'color', 'cyan')
plot(sigfil(5,:), 'color', 'blue')
plot(sigfil(6,:), 'color', 'magenta')