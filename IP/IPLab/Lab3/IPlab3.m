clear
clc
close all
pkg load image;
img1=imread('D:\SEM7\IP\IPLab\Lab3\images\image1.jpg');
subplot(1,3,1);
imshow(img1);
title('original');
[m,n]=size(img1);
n=n/3;
subplot(1,3,2);
imshow(img1);
title('required mask');
result=uint8(zeros(m,n));
for i=1:m
  for j=1:n
    if((img1(i,j,1)>200 && img1(i,j,2)<80 && img1(i,j,3)<100) ||
    (img1(i,j,1)<135 && img1(i,j,2)>200 && img1(i,j,3)<80)  )
      result(i,j,:)=1;
    endif
  endfor
endfor
subplot(1,3,3);
imshow(result.*img1);
title('red&green baloons');