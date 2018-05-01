clc
clear

prompt = 'Enter image path: ';
img_path = input(prompt, 's');

prompt = 'Enter the file with matrix (columns separated by spaces and lines by slash n): ';
file_path = input(prompt, 's');

prompt = 'Enter the value of the X coordinate from where the mask will begin to be applied: ';
x_b = input(prompt);

prompt = 'Enter the value of the Y coordinate from where the mask will begin to be applied: ';
y_b = input(prompt);

prompt = 'Enter the value of the X coordinate to where the mask should be applied: ';
x_e = input(prompt);

prompt = 'Enter the value of the Y coordinate to where the mask should be applied: ';
y_e = input(prompt);

if ~isempty(img_path) || ~isempty(img_file)
    img = imread(img_path);
    mat = dlmread(file_path);
    
    img_gray = RGB2YIQ(img);
    img_gray = img_gray(:, :, 1);
    %out_img = convolution(img_gray, mat, 128, 128, 384, 384, 'q1');
    out_img = convolution(img_gray, mat, x_b, y_b, x_e, y_b, 'q1');
    out = uint8(conv2(img_gray, mat));
    
    subplot(1, 3, 1), imshow(img)
    subplot(1, 3, 2), imshow(out_img)
    subplot(1, 3, 3), imshow(out)
else
    disp("Enter a path for the image and/or the matrix file.")
end
