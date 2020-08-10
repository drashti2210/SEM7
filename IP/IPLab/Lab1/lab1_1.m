clear
clc
close all
image2=imread('D:/IPLab/p1.jpg');
image2_90degree=uint8(zeros(1391,1800,3));
for i=1:1391
 for j=1:1800
 image2_90degree(i,j,:)=image2(1801-j,i,:);
 endfor
endfor
imwrite(image2_90degree,'image2_90degree.jpg');