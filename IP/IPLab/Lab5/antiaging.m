function s = antiaging(r)
  [m,n] = size(r);
  x=1;
  y=1;
  new_imsize = zeros(m + 2*x,n + 2*y);
  new_imsize(1+x:m+x,1+y:n+y) = r;
  filter = zeros(3,3);
  filter_box(1,1) = 5;
  filter_box(1,2) = 7;
  filter_box(1,3) = 5;
  filter_box(2,1) = 7;
  filter_box(2,2) = 9;
  filter_box(2,3) = 7;
  filter_box(3,1) = 5;
  filter_box(3,2) = 7;
  filter_box(3,3) = 5;
  filter_box = filter_box/sum(sum(filter_box));
  s = zeros(size(r));
  for i = 1+x:m+x,
    for j = 1+y:n+y,
      k = new_imsize(i-x:i+x,j-y:j+y);
      s(i-x,j-y) = sum(sum(k.*filter_box));
    endfor
  endfor
  s = uint8(s);
endfunction