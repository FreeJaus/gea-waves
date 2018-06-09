cases={'owcD13','owcD14','owcD15c5','owcD16'}
plotColor = 'brgk';

for k=1:(max(size(cases)));
  Q = dlmread(sprintf('./%s/surfaceRegion.dat',cases{k}))(:,1:2);
  P = csvread(sprintf('./%s/waterlevel.csv',cases{k}));
  P(find(P(:,1)==0),:)=[];
  T = P(:,1);
  P(:,1) = [];
  Q = Q( lookup(Q(:,1), T) , 2);
  FP = find(Q>=0);

  plot(P(FP), Q(FP),sprintf('%s',plotColor(k)));  hold on;
end

title("Altura-caudal")
xlabel ("H[m]")
ylabel ("Q[m³/s]")
legend ('d13','d14','d15.5','d16')
hold off;
