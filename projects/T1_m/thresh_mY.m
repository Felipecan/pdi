function output_img = thresh_mY(input_img)
    
    %YIQ = RGB2YIQ(input_img);
    output_img = RGB2YIQ(input_img);
    
    threshold = output_img(:,:,1); 
    threshold = sum(threshold(:));
    threshold = threshold/(size(input_img, 1)*size(input_img, 2));
    
    for r = 1: size(input_img, 1)
        for c = 1: size(input_img, 2)
            if output_img(r, c, 1) < threshold
                output_img(r, c, 1) = 0;
            else
                output_img(r, c, 1) = 255;
            end
        end
    end
    
    %output_img = YIQ2RGB(output_img);

end