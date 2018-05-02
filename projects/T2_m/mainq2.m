clc
clear


prompt = 'Enter the letter to be executed (a, b, or c): ';
letter = input(prompt, 's');

if strcmp(letter, 'a') == 1
    prompt = 'Enter the number corresponding to the matrix below:\n1:\n 0  -c   0\n-c 4c+d -c\n 0  -c   0\n\n2:\n-c -c -c\n-c 8c+d -c\n-c -c -c\n\n';
    op_m = uint8(input(prompt));
    
    prompt = 'Enter a value for c: ';
    c = int64(input(prompt));
    
    prompt = 'Enter a value for d: ';
    d = int64(input(prompt));
        
    if op_m == 1                
        mat = [0 -c 0; -c 4*c+d -c; 0 -c 0];                       
    elseif op_m == 2
        mat = [-c -c -c; -c 8*c+d -c; -c -c -c];
    else
        disp('Enter one of the values (1 or 2') 
        return
    end
    
    prompt = 'Enter image path: ';
    img_path = input(prompt, 's');

    img = imread(img_path);        

    img_gray = RGB2YIQ(img);
    img_gray = img_gray(:, :, 1);
    out_img_g = convolution(img_gray, mat, 0, 0, 0, 0, 'q2');
    out_img_rgb = convolution(img, mat, 0, 0, 0, 0, 'q2');
    out = uint8(conv2(img_gray, mat));

    subplot(2, 4, 1), imshow(img), title('Original')
    subplot(2, 4, 2), imshow(out_img_rgb), title('conv RGB')
    subplot(2, 4, 3), imshow(out_img_g), title('conv gray')
    subplot(2, 4, 4), imshow(out), title('conv matlab')
    band = zeros(size(out_img_rgb));
    band(:,:,1) = out_img_rgb(:,:,1);
    subplot(2, 4, 5), imshow(band), title('band R')
    band = zeros(size(out_img_rgb));
    band(:,:,2) = out_img_rgb(:,:,2);
    subplot(2, 4, 6), imshow(band), title('band G')
    band = zeros(size(out_img_rgb));
    band(:,:,3) = out_img_rgb(:,:,3);
    subplot(2, 4, 7), imshow(band), title('band B')
    
elseif strcmp(letter, 'b') == 1
    prompt = 'Enter the number corresponding to the matrix below: \n1:\n-1/8 -1/8 -1/8\n-1/8   1  -1/8\n-1/8 -1/8 -1/8\n\n2:\n-1 0 1\n-1 0 1\n-1 0 1\n\n3:\n-1 -1 -1\n 0  0  0\n 1  1  1\n\n4:\n-1 -1 0\n-1  0 1\n 0  1 1\n\n';   
    op_m = uint8(input(prompt));
    
    if op_m == 1                
        mat = [-1/8 -1/8 -1/8; -1/8 1 -1/8; -1/8 -1/8 -1/8];                       
    elseif op_m == 2
        mat = [-1 0 1; -1 0 1; -1 0 1];
    elseif op_m == 3
        mat = [-1 -1 -1; 0 0 0; 1 1 1];
    elseif op_m == 4
        mat = [-1 -1 0; -1 0 1; 0 1 1];
    else
        disp('Enter one of the values (1, 2, 3 or 4') 
        return
    end

    prompt = 'Enter image path: ';
    img_path = input(prompt, 's');

    img = imread(img_path);        

    img_gray = RGB2YIQ(img);
    img_gray = img_gray(:, :, 1);
    out_img_g = convolution(img_gray, mat, 0, 0, 0, 0, 'q2');
    out_img_rgb = convolution(img, mat, 0, 0, 0, 0, 'q2');
    out = uint8(conv2(img_gray, mat));
    
    subplot(2, 4, 1), imshow(img), title('Original')
    subplot(2, 4, 2), imshow(out_img_rgb), title('conv RGB')
    subplot(2, 4, 3), imshow(out_img_g), title('conv gray')
    subplot(2, 4, 4), imshow(out), title('conv matlab')
    band = zeros(size(out_img_rgb));
    band(:,:,1) = out_img_rgb(:,:,1);
    subplot(2, 4, 5), imshow(band), title('band R')
    band = zeros(size(out_img_rgb));
    band(:,:,2) = out_img_rgb(:,:,2);
    subplot(2, 4, 6), imshow(band), title('band G')
    band = zeros(size(out_img_rgb));
    band(:,:,3) = out_img_rgb(:,:,3);
    subplot(2, 4, 7), imshow(band), title('band B')
    
elseif strcmp(letter, 'c') == 1
    prompt = 'Enter the number corresponding to the matrix below: \n1:\n0 0  0\n0 1  0\n0 0 -1\n\n2:\n0 0 -1\n0 1  0\n0 0  0\n\n3:\n 0 0 2\n0 -1 0\n-1 0 0\n\n';   
    op_m = uint8(input(prompt)); 
    
    if op_m == 1                
        mat = [0 0 0; 0 1 0; 0 0 -1];                       
    elseif op_m == 2
        mat = [0 0 -1; 0 1 0; 0 0 0];
    elseif op_m == 3
        mat = [0 0 2; 0 -1 0; -1 0 0];
    else
        disp('Enter one of the values (1, 2 or 3') 
        return
    end
    
    prompt = 'Enter image path: ';
    img_path = input(prompt, 's');
    
    prompt = 'Enter the value of the X coordinate from where the mask will begin to be applied: ';
    x_b = uint64(input(prompt));

    prompt = 'Enter the value of the Y coordinate from where the mask will begin to be applied: ';
    y_b = uint64(input(prompt));

    prompt = 'Enter the value of the X coordinate to where the mask should be applied: ';
    x_e = uint64(input(prompt));

    prompt = 'Enter the value of the Y coordinate to where the mask should be applied: ';
    y_e = uint64(input(prompt));
    
    img = imread(img_path);        

    img_gray = RGB2YIQ(img);
    img_gray = img_gray(:, :, 1);
    out_img_g = convolution(img_gray, mat, x_b, y_b, x_e, y_e, 'q2');
    out_img_rgb = convolution(img, mat, x_b, y_b, x_e, y_e, 'q1');
    out = uint8(conv2(img_gray, mat));
    
    subplot(2, 4, 1), imshow(img), title('Original')
    subplot(2, 4, 2), imshow(out_img_rgb), title('conv RGB')
    subplot(2, 4, 3), imshow(out_img_g), title('conv gray')
    subplot(2, 4, 4), imshow(out), title('conv matlab')
    band = zeros(size(out_img_rgb));
    band(:,:,1) = out_img_rgb(:,:,1);
    subplot(2, 4, 5), imshow(band), title('band R')
    band = zeros(size(out_img_rgb));
    band(:,:,2) = out_img_rgb(:,:,2);
    subplot(2, 4, 6), imshow(band), title('band G')
    band = zeros(size(out_img_rgb));
    band(:,:,3) = out_img_rgb(:,:,3);
    subplot(2, 4, 7), imshow(band), title('band B')
    
else
    disp('Please, enter the correct letter')
end

