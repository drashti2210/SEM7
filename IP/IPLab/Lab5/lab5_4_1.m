img = imread("images/w_img.jpg");
subplot(1,2,1);
imshow(img);
title("Wrinkled face");

s = uint8(zeros(size(img)));
s(:,:,1) = antiaging(img(:,:,1));
s(:,:,2) = antiaging(img(:,:,2));
s(:,:,3) = antiaging(img(:,:,3));
subplot(1,2,2);
imshow(s);
title("wrinkleless face");