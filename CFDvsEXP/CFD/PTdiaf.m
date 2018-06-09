cases={'owcD13','owcD14','owcD15c5','owcD16'}
plotColor = 'brgk';

for k=1:(max(size(cases)));
  M = csvread(sprintf('./%s/rghPressure.csv',cases{k}));
  X(:,k)=M(2:end,1);
  Y(:,k)=M(2:end,2);
  leg{k} = sprintf('Pmax=%f', max(Y(:,k)));
end

plot(X,Y)

grid minor;
title("Static Pressure")
xlabel time[s];
ylabel p[Pa];
legend(leg)
