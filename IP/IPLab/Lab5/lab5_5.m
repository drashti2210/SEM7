img = imread('images/my_img_resize.jpg');
imshow(img);
title("Original Image");
figure;
s = standard_box(img,4,4);
subplot(4,4,1);
imshow(s);
title("1");
for i=2:16
  s = standard_box(s,4,4);
  subplot(4,4,i);
  imshow(s);
  title(i);
endfor
