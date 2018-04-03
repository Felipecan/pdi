function output_img = negative(input_img)
    
    [rows, cols, channels] = size(input_img);
    
    output_img = uint8(zeros(size(input_img)));
    
    for r = 1: rows
        for c = 1: cols
            output_img(r, c, 1) = 255 - input_img(r, c, 1);
            output_img(r, c, 2) = 255 - input_img(r, c, 2);
            output_img(r, c, 3) = 255 - input_img(r, c, 3);
        end
    end
    

end