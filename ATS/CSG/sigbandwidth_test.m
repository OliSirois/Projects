clear

fsample = 1;
sig = csg(1.35, 5000, 1);
bandpower = 0.72



freqs = 0:fsample/length(sig):0.5*fsample;
psd = sig(1:length(sig)/2).^2;
powersum = sum(psd);
thresh = bandpower*powersum;

value = 0;
for i= 1:length(psd)
  value = value+psd(i);
  if value > thresh
    freq = freqs(i);
    break
  endif  

endfor

freq