function [s, final] = imequalizecolorhist(r)
  [m,n,d] = size(r);
  L=256;
  
  red_channel = r(:,:,1);
  green_channel = r(:,:,2); 
  blue_channel = r(:,:,3);
 
  [sr, finalr] = imequalizehist(red_channel);
  [sg, finalg] = imequalizehist(green_channel);
  [sb, finalb] = imequalizehist(blue_channel);
  
  s=zeros(d,L);
  s(1,:)=sr;
  s(2,:)=sg;
  s(3,:)=sb;
  s = uint8(s);

  final = zeros(size(r));
  final(:,:,1) = finalr;
  final(:,:,2) = finalg;
  final(:,:,3) = finalb;
  final = uint8(final);
endfunction