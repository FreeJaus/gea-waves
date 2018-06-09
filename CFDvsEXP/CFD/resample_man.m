cases = {...
  'D13','D14','D15c5','D16'...
}

for c=1:max(size(cases));
  clear X factor i p Y j

  X = csvread(sprintf('owc%s/rghPressure.csv', cases{c}));
  X = X(3:end,:);
  factor = ( X(2,1)-X(1,1) ) / 0.00025;
  i = 1;
  for k=1:max(size(X));
    p = X(k,1);
    Y(i) = p;
    i = i+1;
    for j=1:(factor-1);
      Y(i,1) = p+0.00025*j;
      i = i+1;
    end
  end

  Y(:,2) = interp1 (X(:,1), X(:,2), Y(:,1));

  %subplot(1,2,1); plot(X(:,1), X(:,2))
  %subplot(1,2,2); plot(Y(:,1), Y(:,2))

  csvwrite(sprintf('%sD.csv', cases{c}), Y(:,2));

end