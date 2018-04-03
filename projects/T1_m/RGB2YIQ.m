function output_img = RGB2YIQ(input_img)

    %[rows, cols, channels] = size(input_img);
    
    output_img = uint8(zeros(size(input_img)));
    %output_img = zeros(size(input_img));
    
    %disp(size(output_img))
    %disp(rows)
    %disp(cols)
    
    for r = 1: size(input_img, 1)
        for c = 1: size(input_img, 2)
            output_img(r, c, 1) = 0.2989*input_img(r, c, 1) + 0.587*input_img(r, c, 2) + 0.114*input_img(r, c, 3);
            output_img(r, c, 2) = 0.596*input_img(r, c, 1) - 0.274*input_img(r, c, 2) - 0.322*input_img(r, c, 3);
            output_img(r, c, 3) = 0.211*input_img(r, c, 1) - 0.523*input_img(r, c, 2) + 0.312*input_img(r, c, 3);
        end
    end

end