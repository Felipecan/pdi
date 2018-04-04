function output_img = add_brightness_y(input_img, value)
       
    [rows, cols, channels] = size(input_img);
    
    output_img = uint8(zeros(size(input_img)));    
    
    for r = 1: rows
        for c = 1: cols

            R = input_img(r, c, 1) + value;
            
            output_img(r, c, 2) = input_img(r, c, 2);
            output_img(r, c, 3) = input_img(r, c, 3);

            if R > 255
                output_img(r, c, 1) = 255;
            elseif R < 0
                output_img(r, c, 1) = 0;
            else
                output_img(r, c, 1) = R;
            end           

        end
    end
    

end