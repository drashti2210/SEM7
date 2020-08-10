function [s,final] = imequalizehist(r)
  L=256;
  [m,n] = size(r);
  hist = zeros(size(L-1));
  for i=0:(L-1),
    hist(i+1) = sum(sum(r==i));
  endfor
  pdf = hist/(m*n);
  total(1) = pdf(1);
  for i=1:(L-1),
    total(i+1) = total(i)+pdf(i+1);
  endfor
  s = (L-1)*total;
  s = round(s);
  final = zeros(m,n);
  for i=0:(L-1),
    final = final + (r==i)*s(i+1);
  endfor
  final = uint8(final);
endfunction