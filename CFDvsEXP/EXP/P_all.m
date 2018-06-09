allcases={...
  {'D13A.csv','D13B.csv','D13C.csv'},...
  {'D14A.csv','D14B.csv','D14C.csv'},...
  {'D15c5A.csv','D15c5B.csv','D15c5C.csv'},...
  {'D16A.csv','D16B.csv','D16C.csv'}...
};

for k=1:max(size(allcases));
  
  cases = allcases{k};
  num_cases = max(size(cases));

  clear wave p_max wave_mat leg

  for n=1:(num_cases);
    wave{n}=P_func(cases{n});
    wave_len(n) = max(size(wave{n}));
    p_max(n) = max(max(wave{n}));
    disp(sprintf('%s | NumElem: %d | P_max: %f\r', cases{n}, wave_len(n), p_max(n)))
  end

  minlen = min(wave_len);

  for n=1:(num_cases);
    wave_mat(:,n) = wave{n}(1:minlen);
    leg{n} = sprintf('Pmax=%f', p_max(n));
  end

  subplot(2,2,k)
  plot(wave_mat)
  title('D13')
  ylabel ("Pm [Pa]")
  legend(leg)

  xlabel ("Tiempo [muestras]")

end


