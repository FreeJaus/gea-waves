Q = dlmread('./postProcessing/outletFlux/0/surfaceRegion.dat');
xq=Q(5:end,1);
yq=Q(5:end,2);
yqm=yq./1.21;

P = csvread('rghPressure.csv');
x=P(2:end,1);
y=P(2:end,2);

for i=2:size(x,1); 
  flow(i)=yqm(xq==x(i)); 
  
end

flowR=flow(:); %result is a column vector
pot=y.*flowR;

plot(flow,pot)
grid on;
title("Power-FlowRate")
xlabel Q[m³/s];
ylabel ("Pot[watt]")