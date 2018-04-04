raw = imread('imgs/lena.png');
%disp(size(raw))

%yiq = RGB2YIQ(raw);
%rgb = YIQ2RGB(yiq);
%r = negative(raw);
mean_filter = apply_filter(raw, 3);

%v = 100
%size_kernel = 5;
%raw = brightness(raw, bright);
% sub_matx = uint8(zeros(500, 500, 3));
%sub_matx = raw(1: 500 , 1: 500, 1:3);
%sub_matrix = input_img(r - floor(size_kernel/2): (r - floor(size_kernel/2))+(size_kernel-1) , c-floor(size_kernel/2): (c - floor(size_kernel/2))+(size_kernel-1), 1:3);
%image(yiq)
subplot(1, 2, 1), imshow(raw)
subplot(1, 2, 2), imshow(mean_filter)
%imshow(raw, 'raw')
%imshow(mean_filter, 'mean')




%disp(yiq(1,1,:))