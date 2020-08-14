img = imread('images/my_img.jpg');
imshow(img);
figure;
res = weighted_average(img,7,7);
imshow(res);
title("Image(weighted average filter 7 x 7)");