function out_img = convolution(in_img, mat)
    
    out_img = in_img;%zeros(size(in_img));

    %rebatimento
    temp = mat(:, 3);
    mat(:, 3) = mat(:, 1);
    mat(:, 1) = temp;
    
    temp = mat(3, :);
    mat(3, :) = mat(1, :);
    mat(1, :) = temp;
   
    for r = ceil( size(mat, 1)/2 ): size(in_img, 1)-floor( size(mat, 1)/2 )       
        for c = ceil( size(mat, 2)/2 ): size(in_img, 2)-floor( size(mat, 1)/2 )
           sub_matrix = in_img(r - floor( size(mat, 1)/2 ): (r - floor( size(mat, 1)/2 ))+(size(mat, 1)-1) , c - floor( size(mat, 2)/2 ): (c - floor( size(mat, 2)/2 ))+(size(mat, 2)-1), 1:3);
           
           temp_mat = zeros(size(sub_matrix));
           for i = 1: size(mat, 1)
               for j = 1: size(mat, 2)
                   temp_mat(i, j, 1) = temp_mat(i, j, 1) + (sub_matrix(i, j, 1) * mat(i, j));
                   temp_mat(i, j, 2) = temp_mat(i, j, 2) + (sub_matrix(i, j, 2) * mat(i, j));
                   temp_mat(i, j, 3) = temp_mat(i, j, 3) + (sub_matrix(i, j, 3) * mat(i, j));
               end
           end
          
          temp = temp_mat(:,:,1);
          out_img(r, c, 1) = sum(temp(:));
          temp = temp_mat(:,:,2);
          out_img(r, c, 2) = sum(temp(:));
          temp = temp_mat(:,:,3);
          out_img(r, c, 3) = sum(temp(:));
        end
    end
    
    %disp(out_img)
end