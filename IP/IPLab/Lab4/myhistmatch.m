 
function final = myhistmatch(r,spec)
  [m,n]=size(r);
   [s1,final1]=imequalizehist(r);
[G,final2]=imequalizehist(spec);
L=256;
for i=0:(L-1)
  [val,ind(i+1)]=min(abs(G-s1(i+1)));
endfor
ind=ind-1;
final=zeros(m,n);
for i=1:(L-1)
  final=final+(r==i)*ind(i+1);
endfor
final=uint8(final);

endfunction
