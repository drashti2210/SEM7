clc
clear
close all

r=imread('images/img_dark.jpeg');
[m,n]=size(r);
spec=imread('images/test4.jpg');
final(:,:,1)=myhistmatch(r(:,:,1),spec(:,:,1));
final(:,:,2)=myhistmatch(r(:,:,2),spec(:,:,2));
final(:,:,3)=myhistmatch(r(:,:,3),spec(:,:,3));
final = uint8(final);
subplot(1,2,1);
imshow(uint8(final));
subplot(1,2,2);
plot_hist(final);