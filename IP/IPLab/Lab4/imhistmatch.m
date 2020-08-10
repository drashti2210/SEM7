function [s,final] = imhistmatch(r,ref)
  L=256;
  [m,n] = size(r);
  [s ,final1] = imequalizehist(r);
  [G, final2] = imequalizehist(ref);
  for i=0:(L-1),
    [val ind(i+1)] = min(abs(G-s(i+1)));
  endfor
  ind = ind-1;
  s=ind;
  final  = zeros(m,n);
  for i=0:(L-1),
    final = final + (r==i)*ind(i+1);
  endfor
  final = uint8(final);
endfunction
