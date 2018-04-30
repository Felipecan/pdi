function out_img = convolution(in_img, mat)
    
    %out_img = in_img;%zeros(size(in_img));   
    in_img_bordes0 = zeros( size(in_img,1)+(floor(size(mat,1)/2))*2, size(in_img,2)+(floor(size(mat,2)/2))*2, size(in_img,3) );    
    in_img_bordes0(ceil(size(mat,1)/2):(size(in_img_bordes0,1)-floor(size(mat,1)/2)), ceil(size(mat,2)/2):(size(in_img_bordes0,2)-floor(size(mat,2)/2)), 1:size(in_img,3)) = in_img;   
    %in_img_bordes0 = uint8(in_img_bordes0);
    out_img = in_img_bordes0;
    
    %rebatimento
%     temp = mat(:, 3);
%     mat(:, 3) = mat(:, 1);
%     mat(:, 1) = temp;
%     
%     temp = mat(3, :);
%     mat(3, :) = mat(1, :);
%     mat(1, :) = temp;

    m_kernel = mat(:)/(size(mat,1)*size(mat,2));

    for r = ceil( size(mat, 1)/2 ): size(in_img_bordes0, 1)-floor( size(mat, 1)/2 )       
        for c = ceil( size(mat, 2)/2 ): size(in_img_bordes0, 2)-floor( size(mat, 2)/2 )
%             disp("pegando matriz de: ")
%             disp(r - floor( size(mat, 1)/2 ))
%             disp("ate")
%             disp((r - floor( size(mat, 1)/2 ))+(size(mat, 1)-1))
%             disp("E: ")
%             disp(c - floor( size(mat, 2)/2 ))
%             disp((c - floor( size(mat, 2)/2 ))+(size(mat, 2)-1))
            sub_matrix = in_img_bordes0(r - floor( size(mat, 1)/2 ): (r - floor( size(mat, 1)/2 ))+(size(mat, 1)-1) , c - floor( size(mat, 2)/2 ): (c - floor( size(mat, 2)/2 ))+(size(mat, 2)-1), 1:size(in_img,3));
            
            temp_mat = zeros(size(sub_matrix));
            for i = 1: size(mat, 1)
                for j = 1: size(mat, 2)
                    for k = 1: size(in_img, 3)
                        temp_mat(i, j, k) = sub_matrix(i, j, k) * mat(i, j);
                    end
                end
            end
          
            for i = 1:size(in_img, 3)
                temp = temp_mat(:,:,i);
                temp = sum(temp(:));
%                 if temp < 0
%                     out_img(r, c, i) = 0;
%                 elseif temp > 255
%                     out_img(r, c, i) = 255;
%                 else
%                     out_img(r, c, i) = temp;
%                 end
               
                  out_img(r, c, i) = temp;
               
            end         
          
        end
    end
    
end