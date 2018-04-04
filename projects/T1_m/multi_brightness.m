function output_img = multi_brightness(input_img, value)
    
    %ATENCAO: Tomar cuidado com o tipo de value, as vezes nao vem correto.
    
    [rows, cols, channels] = size(input_img);
    
    output_img = uint8(zeros(size(input_img))); 
    
    if value > 0
        for r = 1: rows
            for c = 1: cols

                R = input_img(r, c, 1) * value;
                G = input_img(r, c, 2) * value;
                B = input_img(r, c, 3) * value;

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
    else
        disp("Valor menor que zero, nao e possivel fazer operacao")
    end


end