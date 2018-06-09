P = csvread ("D16C.csv");
y = P(1:end,1); %todos los datos de la primera columna

k = 1;
z = y>k; %guardar valores mayores de 1
%contar posiciones crecientes y decrecientes de los valores de P
idxu = 1;
idxd = 1;
for i=1:max(size(y))-1;
  if (z(i)== 0) && (z(i+1) == 1);
    u(idxu++)=i;
  end
  if (z(i)== 1) && (z(i+1) == 0);
    d(idxd++)=i;
  end
end

wmax = 0;
wmaxid = 1;

for i=1:max(size(d));
  w{i} = y(u(i):d(i));
  m = max(w{i});
  if m > wmax;
    wmax=m;
    wmaxid=i;
  end
end
plot(w{wmaxid})
title('D15.5B')
xlabel ("Tiempo [ms]")
ylabel ("Pm [Pa]")
%maxVal=max(max(y))
legend (['Pmax=', num2str(wmax)], "location", "northeastoutside");
