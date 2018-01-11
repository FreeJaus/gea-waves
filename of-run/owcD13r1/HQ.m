Q = dlmread('surfaceRegion.dat');
xq=Q(5:end,1);
yq=Q(5:end,2);

P = csvread('waterlevel.csv');
x=P(2:end,1);
y=P(2:end,2);

for i=2:size(x,1); 
  flow(i)=yq(xq==x(i)); 
end

plot(flow,y)
grid on;
title("Waterlevel-FlowRate")
xlabel Q[Kg/s];
ylabel ("H[m]")
