img = imread('D:\IPLab\p1.jpg');
[x, y, z] = size(img);
for plane = 1 : z
  len = x;
  for i = 1 : x
    for j = 1 : y
      if i < x/2
        temp = img(i, j, plane);
        img(i, j, plane) = img(len, j, plane);
        img(len, j, plane) = temp;
      end
    end
    len = len - 1;
  end
end
imwrite(img,'D:\IPLab\fliped.jpeg')
title('Flipped Vertically Image');