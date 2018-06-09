cases={'D15c5A.csv','D15c5B.csv','D15c5C.csv'}
num_cases = max(size(cases));

% Primero llamamos a la función para cada caso, y en el mismo for vemos cuántos elementos tiene el vector que nos devuelve

for n=1:(num_cases);
  wave{n}=P_13f(cases{n});
  wave_len(n) = max(size(wave{n})); 

  % Calculamos el máximo en cada columna
  p_max(n) = max(max(wave{n}));

  % Mostramos el número de elementos de cada ola y el valor máximo correspondiente
  disp(sprintf('NumElem: %d | P_max: %f\r', wave_len(n), p_max(n)))
end

% Como vemos que los vectores son de diferentes longitudes (4058, 4052 y 4043), nos quedamos con el mínimo.
% Esto quiere decir que en la primera vamos a dejar los últimos 15 datos sin dibujar, en la segunda 9, y en la tercera los dibujamos todos.

minlen = min(wave_len);

% Ahora que sabemos cuál es la longitud para que no haya problemas, extraemos los primeros 4043 elementos de cada vector y los guardamos en una matriz de tres columnas.
for n=1:(num_cases);
  wave_mat(:,n) = wave{n}(1:minlen);

  % Aprovechamos el mismo loop para preparar la leyenda (así funcionará independientemente del número de olas/ficheros que pongamos en cases
  leg{n} = sprintf('Pmax=%f', p_max(n));
  %También se podría escribir como ['Pmax=', num2str(p_max(1))], son formas equivalentes en este caso
end

% Finalmente, dibujamos y dejamos que octave decida que color dar a cada línea
plot(wave_mat)
title('D13')
ylabel ("Pm [Pa]")
legend(leg)

% No tenemos información sobre el tiempo, porque la función P_13f sólo devuelve un vector (correspondiente al eje Y)
%xlabel ("Tiempo [ms]")



