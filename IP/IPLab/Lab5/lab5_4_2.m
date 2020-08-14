img = imread('images/facemark.jpg');
subplot(1,2,1);
imshow(img);
title("Original Image");

nose = img(97:240,530:640,:);
for i=1:5
  nose(:,:,1) = border_solved(nose(:,:,1),7,7);  
  nose(:,:,2) = border_solved(nose(:,:,2),7,7);
  nose(:,:,3) = border_solved(nose(:,:,3),7,7);
endfor
img(97:240,530:640,:) = nose;

l_cheek = img(180:370,270:440,:);
for i=1:5
  l_cheek(:,:,1) = border_solved(l_cheek(:,:,1),7,7);  
  l_cheek(:,:,2) = border_solved(l_cheek(:,:,2),7,7);
  l_cheek(:,:,3) = border_solved(l_cheek(:,:,3),7,7);
endfor
img(180:370,270:440,:) = l_cheek;

r_cheek = img(171:370,680:840,:);
for i=1:5
  r_cheek(:,:,1) = border_solved(r_cheek(:,:,1),7,7);  
  r_cheek(:,:,2) = border_solved(r_cheek(:,:,2),7,7);
  r_cheek(:,:,3) = border_solved(r_cheek(:,:,3),7,7);
endfor
img(171:370,680:840,:) = r_cheek;
subplot(1,2,2); 
imshow(img);
title("Beautified Image");