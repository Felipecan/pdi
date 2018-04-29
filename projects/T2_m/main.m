clc
clear

prompt = 'Enter image path: ';
img_path = input(prompt, 's');

prompt = 'Enter the file with matrix (columns separated by spaces and lines by slash n): ';
file_path = input(prompt, 's');

if ~isempty(img_path) || ~isempty(img_file)
    img = imread(img_path);
    mat = [-1 -1 -1; -1 8 -1; -1 -1 -1];%dlmread(file_path);
    out_img = conv2(single(img), single(mat));%convolution(img, mat);
    imshow(out_img)
    %subplot(1, 2, 1), imshow(img)
    %subplot(1, 2, 2), imshow(out_img)
else
    disp("Enter a path for the image and/or the matrix file.")
end