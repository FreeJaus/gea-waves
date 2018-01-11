M = csvread('rghPressure.csv');
x=M(2:end,1);
y=M(2:end,2);

%Subir la gráfica a 0, sumando el primer valor negativo a todos los resultados
%y=y-y(1);

%Obtener número de muestras
knum = max(size(x));
%Obtener rango abscisa
krange = x(knum)-x(1);
%Número de puntos para dibujar las funciones continuas (estimadas)
kpoints = 500;

% Obtener todos los puntos de referencia mediante interpolación lineal (resultado trapezoidal)
for h=1:kpoints;
  xx(h) = (krange)*h/kpoints+x(1); %Cada uno de los valores de abscisa para los que interpolar
  t(h) = interp1(x,y,xx(h),"spline");
end

%  tt = interp1(xx,t',xx,"pchip");


plot(xx,t)%,'-+'
grid minor;
title("Static Pressure")
xlabel time[s];
ylabel p[Pa];
