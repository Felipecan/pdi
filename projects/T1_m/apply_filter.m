function output_img = apply_filter(input_img, option)

    %ATENCAO: possivel mudanca, essa funcao pode ta errada.
    
    output_img = input_img;%uint8(zeros(size(input_img)));
              
    option_1 = [0 -1 0; -1 5 -1; 0 -1 0];
    option_2 = [0 0 0; 0 1 0; 0 0 -1];
    
    if option == 1
    
        for r = 2: size(input_img, 1)-1     
            for c = 2: size(input_img, 2)-1

                sub_matrix = input_img(r-1: (r-1)+2 , c-1: (c-1)+2, 1:3);

                sum_r = cast(sub_matrix(:,:,1), 'double')*option_1;
                sum_g = cast(sub_matrix(:,:,2), 'double')*option_1;
                sum_b = cast(sub_matrix(:,:,3), 'double')*option_1;

                sum_r = sum(sum_r(:));
                sum_g = sum(sum_g(:));
                sum_b = sum(sum_b(:));
                
                if sum_r > 255
                    output_img(r, c, 1) = 255;
                elseif sum_r < 0
                    output_img(r, c, 1) = 0;
                else
                    output_img(r, c, 1) = sum_r;
                end

                if sum_g > 255
                    output_img(r, c, 2) = 255;
                elseif sum_g < 0
                    output_img(r, c, 2) = 0;
                else
                    output_img(r, c, 2) = sum_g;
                end

                if sum_b > 255
                    output_img(r, c, 3) = 255;
                elseif sum_b < 0
                    output_img(r, c, 3) = 0;
                else
                    output_img(r, c, 3) = sum_b;
                end

            end
        end
        
    elseif option == 2
        
        for r = 2: size(input_img, 1)-1     
            for c = 2: size(input_img, 2)-1           
                
                sub_matrix = input_img(r-1: (r-1)+2 , c-1: (c-1)+2, 1:3);

                sum_r = cast(sub_matrix(:,:,1), 'double')*option_2;
                sum_g = cast(sub_matrix(:,:,2), 'double')*option_2;
                sum_b = cast(sub_matrix(:,:,3), 'double')*option_2;

                sum_r = sum(sum_r(:));
                sum_g = sum(sum_g(:));
                sum_b = sum(sum_b(:));
                
                if sum_r > 255
                    output_img(r, c, 1) = 255;
                elseif sum_r < 0
                    output_img(r, c, 1) = 0;
                else
                    output_img(r, c, 1) = sum_r;
                end

                if sum_g > 255
                    output_img(r, c, 2) = 255;
                elseif sum_g < 0
                    output_img(r, c, 2) = 0;
                else
                    output_img(r, c, 2) = sum_g;
                end

                if sum_b > 255
                    output_img(r, c, 3) = 255;
                elseif sum_b < 0
                    output_img(r, c, 3) = 0;
                else
                    output_img(r, c, 3) = sum_b;
                end
                
            end
        end
    else
        disp("Opcao invalida, so existe a opcao 1 e 2")
    end

end