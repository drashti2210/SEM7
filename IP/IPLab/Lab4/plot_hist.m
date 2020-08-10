function void = plot_hist(r)
  red_channel = r(:,:,1);
  green_channel = r(:,:,2);
  blue_channel = r(:,:,3);

  [yRed, x] = imhist(red_channel);
  [yGreen, x] = imhist(green_channel);
  [yBlue, x] = imhist(blue_channel);

  plot(x, yRed, x, yGreen, x, yBlue);
  legend("Red","Green","Blue");
endfunction