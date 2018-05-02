function output_img = YIQ2RGB(input_img)

    %ATENCAO: Nao sabemos ao certo se essa funcao ta ok, muito
    %provaevelmente errada.

    % [rows, cols, channels] = size(input_img);
    
    output_img = uint8(zeros(size(input_img)));
    
    for r = 1: size(input_img, 1)
        for c = 1: size(input_img, 2)
            R = input_img(r, c, 1) + 0.9563*input_img(r, c, 2) + 0.621*input_img(r, c, 3);
            G = input_img(r, c, 1) - 0.2721*input_img(r, c, 2) - 0.6474*input_img(r, c, 3);
            B = input_img(r, c, 1) - 1.107*input_img(r, c, 2) + 1.7046*input_img(r, c, 3);
            
            if R > 255
                output_img(r, c, 1) = 255;
            elseif R < 0
                output_img(r, c, 1) = 0;
            else
                output_img(r, c, 1) = R;
            end
            
            if G > 255
                output_img(r, c, 2) = 255;
            elseif R < 0
                output_img(r, c, 2) = 0;
            else
                output_img(r, c, 2) = G;
            end
            
            if B > 255
                output_img(r, c, 3) = 255;
            elseif R < 0
                output_img(r, c, 3) = 0;
            else
                output_img(r, c, 3) = B;
            end
        end
    end

end