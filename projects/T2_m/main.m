clc
clear

prompt = 'Enter image path: ';
img_path = input(prompt, 's');

prompt = 'Enter the file with matrix (columns separated by spaces and lines by slash n): ';
file_path = input(prompt, 's');

if ~isempty(img_path) || ~isempty(img_file)
    img = imread(img_path);
    mat = dlmread(file_path);
    
    out_img = convolution(rgb2gray(img), mat);
    out = conv2(rgb2gray(img), mat);
    
    subplot(1, 3, 1), imshow(img)
    subplot(1, 3, 2), imshow(out_img)
    subplot(1, 3, 3), imshow(out)
else
    disp("Enter a path for the image and/or the matrix file.")
end