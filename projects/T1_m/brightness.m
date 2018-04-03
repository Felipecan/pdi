function output_img = brightness(input_img, value)

    [rows, cols, channels] = size(input_img);
    
    output_img = uint8(zeros(size(input_img)));

    if isa(value, 'integer')
        disp("i")
        for r = 1: rows
            for c = 1: cols
                output_img(r, c, 1) = input_img(r, c, 1) + value;
                output_img(r, c, 2) = input_img(r, c, 2) + value;
                output_img(r, c, 3) = input_img(r, c, 3) + value;
            end
        end
    elseif isa(value, 'float') && value > 0
        disp("d")
        for r = 1: rows
            for c = 1: cols
                output_img(r, c, 1) = input_img(r, c, 1) * value;
                output_img(r, c, 2) = input_img(r, c, 2) * value;
                output_img(r, c, 3) = input_img(r, c, 3) * value;
            end
        end
    else
        disp("Tipo incorreto ou valor negativo para o tipo double, essas condicoes nao sao aceitas")
    end

end