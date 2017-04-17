function meanV = movingEMean(V, window)
  simpleAvg = mean(V(1:window));
  alpha = 1/window;
  X = V(window:end);
  X(1) = simpleAvg;
  meanV = filter(alpha, [1 alpha-1], X, simpleAvg*(1-alpha));
end