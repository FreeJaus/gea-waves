allcases={...
  {'D13A.csv','D13B.csv','D13C.csv','D13D.csv'},...
  {'D14A.csv','D14B.csv','D14C.csv','D14D.csv'},...
  {'D15c5A.csv','D15c5B.csv','D15c5C.csv','D15c5D.csv'},...
  {'D16A.csv','D16B.csv','D16C.csv','D16D.csv'}...
};

alltitles={'D13', 'D14', 'D15,5', 'D16'};

TsEXP=1/5000;
TsCFD=0.05;

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
  x=TsEXP*[1:max(size(wave_mat))]';
  %plot(x(:,ones(1,num_cases)), wave_mat);

  plot(x, wave_mat(:,1), 'b',...
       x, wave_mat(:,2), 'b',...
       x, wave_mat(:,3), 'b',...
       x, wave_mat(:,4), 'r-.'); %-. x-o 

  axis( [ 0, 0.8 ] )
  title(alltitles{k})
  ylabel ("Pm [Pa]")
  xlabel ("Tiempo [seg]")
  legend(leg, "location", "northeast");

end
