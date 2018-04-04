function output_img = thresh(input_img, threshold)
    
    %YIQ = RGB2YIQ(input_img);
    output_img = RGB2YIQ(input_img);
    
    for r = 1: size(input_img, 1)
        for c = 1: size(input_img, 2)
            if output_img(r, c, 1) < threshold
                output_img(r, c, 1) = 0;
            else
                output_img(r, c, 1) = 255;
            end
        end
    end
    
    output_img = output_img(:,:,1);
    
end