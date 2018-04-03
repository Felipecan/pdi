function output_img = avarage_filter(input_img, size_kernel)
    
    output_img = input_img;%uint8(zeros(size(input_img)));
    %sub_matrix = uint8(zeros(size_kernel, size_kernel, 3));
    %disp(size(sub_matrix))
    
    for r = 2: size(input_img, 1)-1
        for c = 2: size(input_img, 2)-1
            sum_r = 0;
            sum_g = 0;
            sum_b = 0;
                
            sub_matrix = input_img(r-1: (r-1)+(size_kernel-1) , c-1: (c-1)+(size_kernel-1), 1:3);
            for i = 1: size(sub_matrix, 1)
                for j = 1: size(sub_matrix, 2)
                    sum_r = sum_r + sub_matrix(i, j, 1);
                    sum_g = sum_g + sub_matrix(i, j, 2);
                    sum_b = sum_b + sub_matrix(i, j, 3);
                end
            end
            
            %sum_r = input_img(r-1, c-1, 1) + input_img(r-1, c, 1) + input_img(r-1, c+1, 1) + input_img(r, c-1, 1) + input_img(r, c, 1) + input_img(r, c+1, 1) + input_img(r+1, c-1, 1) + input_img(r+1, c, 1) + input_img(r+1, c+1, 1);
            %sum_g = input_img(r-1, c-1, 2) + input_img(r-1, c, 2) + input_img(r-1, c+1, 2) + input_img(r, c-1, 2) + input_img(r, c, 2) + input_img(r, c+1, 2) + input_img(r+1, c-1, 2) + input_img(r+1, c, 2) + input_img(r+1, c+1, 2);
            %sum_b = input_img(r-1, c-1, 3) + input_img(r-1, c, 3) + input_img(r-1, c+1, 3) + input_img(r, c-1, 3) + input_img(r, c, 3) + input_img(r, c+1, 3) + input_img(r+1, c-1, 3) + input_img(r+1, c, 3) + input_img(r+1, c+1, 3);
            
            output_img(r, c, 1) = sum_r/(size_kernel*size_kernel);
            output_img(r, c, 2) = sum_g/(size_kernel*size_kernel);
            output_img(r, c, 3) = sum_b/(size_kernel*size_kernel);
        end
    end

end
