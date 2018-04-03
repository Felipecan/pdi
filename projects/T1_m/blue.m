function output_img = blue(input_img)
    
    output_img = uint8(zeros(size(input_img)));

    output_img(:,:,3) = input_img(:,:,3);

end