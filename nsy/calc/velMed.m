z=[6.928 6.764 6.57 6.39 6.096 5.74];
y=((1:6)-1)*0.0103+0.0515;

%Obtener número de muestras
knum = max(size(y));
%Obtener rango abscisa
krange = y(knum)-y(1);
%Número de puntos para dibujar las funciones continuas (estimadas)
kpoints = 500;

%https://en.wikipedia.org/wiki/Coefficient_of_determination
sstot = sum((z-mean(z)).^2);

% Obtener todos los puntos de referencia mediante interpolación lineal (resultado trapezoidal)
for h=1:kpoints;
  yy(h) = (krange)*h/kpoints+y(1); %Cada uno de los valores de abscisa para los que interpolar
  t(h) = interp1(y,z,yy(h));
end

% Grados de la estimación polinómica
for k=2:5;
  % Ajuste polinómico de grado k, p contiene el polinomio, s los resultados
  [p{k},s{k}] = polyfit(y,z,k);
  % s{k}.yk contiene los valores de ordenada para los valores de abscisa contenidos en y
  zz = s{k}.yf;
  % Cálculo de la R, ver enlace wikipedia arriba
  r(k) = 1 - (sum((zz-z).^2)/sstot);
  
  % Integración numérica del polinomio
  integral = polyint(zz);
  % Cálculo del área en el rango indicado
  a(k) = polyval(integral,y(knum))-polyval (integral, y(1));
  
  % Obtención de los valores en la ordenada para cada uno de los puntos a dibujar
  for h=1:kpoints;
    s{k}.zf(h) = polyval(p{k},yy(h));
  end;
  
  % Integración trapezoidal de los puntos aproximados por el polinomio ajustado
  %at(k) = trapz(y,zz);
  at(k) = trapz(yy,s{k}.zf);
end;

% Obtención de las medias de la integración numérica de los polinomios
a = a./(y(knum)-y(1));
% Obtención de las medias de la integración trapezoidal de los polinomios
apt = at./(y(knum)-y(1));
% Obtención de la media de la integración trapezoidal de los puntos de origen
at = trapz(y,z)/(y(knum)-y(1));

subplot(2,1,1)
hold on
plot( yy(ones(4,1),:)', [s{2}.zf', s{3}.zf', s{4}.zf', s{5}.zf'] )
plot(y,z,'-+')
legend('z2','z3','z4','z5','z')
hold off

subplot(2,1,2)
hold on
for k=2:5;
  plot(s{k}.zf-t)
end;
plot(t-t)
legend('z2','z3','z4','z5')
hold off