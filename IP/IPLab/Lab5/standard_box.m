function s = standard_box(r,m,n)
  [M,N] = size(r);
  x = (m-1)/2;
  y = (n-1)/2;
  new_imsize = zeros(M + 2*x,N + 2*y);
  new_imsize(1+x:M+x,1+y:N+y) = r;
  sub_image = ((1/(m*n)).*ones(m,n));
  s = zeros(size(r));
  for i = 1+x:M+x,
    for j = 1+y:N+y,
      k = new_imsize(i-x:i+x,j-y:j+y);
      s(i-x,j-y) = sum(sum(k.*sub_image));
    endfor
  endfor
  s = uint8(s);  
endfunction