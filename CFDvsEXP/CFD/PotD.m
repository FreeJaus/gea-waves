models={'owcD13','owcD14','owcD15c5','owcD16'}

for k=1:(max(size(models)));
  Q = dlmread(sprintf('./%s/surfaceRegion.dat',models{k}));
  xq=Q(5:end,1);
  yq=Q(5:end,2);
  yqm=yq./1.21;
  P = csvread(sprintf('./%s/rghPressure.csv',models{k}));
  x=P(2:end,1);
  y{k}=P(2:end,2);
  for i=2:size(x,1);
    flow(i)=yqm(xq==x(i));
  end
  PotMax{k}=max(max( y{k}.*flow(:) )); %flow(:) is a column vector
end

D=[13 14 15.5 16];

plot(D,[PotMax{1},PotMax{2},PotMax{3},PotMax{4}],'x-o')
%hold on
grid on;
title("Potencia-Diafragma")
xlabel D[mm];
ylabel ("Pot[Watt]")
%leg = legend({'D13','D14','D15.5','D16'});
%legend (leg,text);
legend ('Potencia máxima')

%hold off
