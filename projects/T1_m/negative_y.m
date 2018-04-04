function output_img = negative_y(input_img)

    output_img = uint8(zeros(size(input_img))); 
    
    for r = 1: size(input_img, 1)
        for c = 1: size(input_img, 2)
            output_img(r, c, 1) = 255 - input_img(r, c, 1);
            output_img(r, c, 2) = input_img(r, c, 2);
            output_img(r, c, 3) = input_img(r, c, 3);
        end
    end

end