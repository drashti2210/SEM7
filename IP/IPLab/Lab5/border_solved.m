function s = border_solved(r,m,n)
  [M,N] = size(r);
  x = (m-1)/2;
  y = (n-1)/2;
  new_imsize = zeros(M + 2*x,N + 2*y);
  new_imsize(1+x:M+x,1+y:N+y) = r;
  
  left_part = r(:,1:y);
  right_part = r(:,N-y:N);
  upper_part = r(1:x,:);
  down_part = r(M-x:M,:);
 
  [M1,N1] = size(new_imsize);
  new_imsize(1+x:M1-x,1:y) = left_part;
  new_imsize(1+x:M1-x,N1-y:N1) = right_part;
  new_imsize(1:x,1+y:N1-y) = upper_part;
  new_imsize(M1-x:M1,1+y:N1-y) = down_part;
  
  new_imsize(1:x,1:y) = sum(sum(r(1:x,1:y)))/(x*y);
  new_imsize(M1-x+1:M1,1:y) = sum(sum(r(M-x+1:M,1:y)))/(x*y);
  new_imsize(1:x,N1-y+1:N1) = sum(sum(r(1:x,N-y+1:N)))/(x*y);
  new_imsize(M1-x+1:M1,N1-y+1:N1) = sum(sum(r(M-x+1:M,N-y+1:N)))/(x*y);
  
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