function output_img = green(input_img)
    
    output_img = uint8(zeros(size(input_img)));

    output_img(:,:,2) = input_img(:,:,2);

end