Q = dlmread('surfaceRegion.dat');
xq=Q(5:end,1);
yq=Q(5:end,2);
yqm=yq./1.21;

P = csvread('rghPressure.csv');
x=P(2:end,1);
y=P(2:end,2);

for i=2:size(x,1); 
  flow(i)=yqm(xq==x(i)); 
end

plot(flow,y)
grid on;
title("Pressure-FlowRate")
xlabel Q[m³/s];
ylabel ("P[Pa]")
