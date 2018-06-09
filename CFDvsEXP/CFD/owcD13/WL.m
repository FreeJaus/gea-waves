M = csvread('waterlevel.csv');
x=M(2:end,1);
y=M(2:end,2);

Data=[x,y];
for k = 2:size(Data,2)
    [maxd,idx] = max(Data(:,k));
    MaxCol(k,:) = [x(idx) maxd];
end
MaxCol = MaxCol(2:end,:)

plot(x,y)%,'-+'
grid on;
title("water level")
xlabel time[s];
ylabel("H[m]")
