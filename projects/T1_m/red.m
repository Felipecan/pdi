function output_img = red(input_img)
    
    output_img = uint8(zeros(size(input_img)));

    output_img(:,:,1) = input_img(:,:,1);

end