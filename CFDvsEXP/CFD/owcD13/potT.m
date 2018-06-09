Q = dlmread('./surfaceRegion.dat');
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

Data=[x,pot];
for k = 2:size(Data,2)
    [maxd,idx] = max(Data(:,k));
    MaxCol(k,:) = [x(idx) maxd];
end
MaxCol = MaxCol(2:end,:)

plot(x,pot)
grid on;
title("Potencia-tiempo")
xlabel t[s];
ylabel ("Pot[watt]")
