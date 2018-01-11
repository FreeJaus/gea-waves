Q = dlmread('surfaceRegion.dat');
xq=Q(5:end,1);
yq=Q(5:end,2);

P = csvread('rghPressure.csv');
x=P(2:end,1);
y=P(2:end,2);

for i=2:size(x,1); 
  flow(i)=yq(xq==x(i)); 
end

plot(flow,y)
grid on;
title("Pressure-FlowRate")
xlabel Q[Kg/s];
ylabel ("P[Pa]")