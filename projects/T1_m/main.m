raw = imread('img_tests/coin.png');
disp(size(raw))

%yiq = RGB2YIQ(raw);
%rgb = YIQ2RGB(yiq);
%r = negative(raw);
mean_filter = avarage_filter(raw, 3);

%v = 100
%bright = 5
%raw = brightness(raw, bright);
% sub_matx = uint8(zeros(500, 500, 3));
% sub_matx = raw(1: 500 , 1: 500, 1:3);
% imshow(sub_matx)
%image(yiq)
imshow(mean_filter)



%disp(yiq(1,1,:))