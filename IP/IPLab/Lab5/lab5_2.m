img= imread('images/my_img_resize.jpg');
subplot(1,2,1);
s1=standard_box(img,7,7);
imshow(s1);
title("Blur Image with border");
subplot(1,2,2);
s2 = border_solved(img,7,7);
imshow(s2);
title("Blur Image with no border");