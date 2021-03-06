function out_img = convolution(in_img, mat, x_beg, y_beg, x_end, y_end, offset, q)

    if x_beg < 0 || y_beg < 0 || x_beg > size(in_img,1) || y_beg > size(in_img,2) || x_end < 0 || y_end < 0 || x_end > size(in_img,1) || y_end > size(in_img,2)
        return
    end
           
    in_img_bordes0 = zeros( size(in_img,1)+(floor(size(mat,1)/2))*2, size(in_img,2)+(floor(size(mat,2)/2))*2, size(in_img,3) );    
    in_img_bordes0(ceil(size(mat,1)/2):(size(in_img_bordes0,1)-floor(size(mat,1)/2)), ceil(size(mat,2)/2):(size(in_img_bordes0,2)-floor(size(mat,2)/2)), 1:size(in_img,3)) = in_img;   
    %out_img = zeros(size(in_img_bordes0), 'uint8');
    out_img = uint8(in_img_bordes0);    
    
    %rebatimento
    if strcmp(q, 'r') == 1
        temp = mat(:, 3);
        mat(:, 3) = mat(:, 1);
        mat(:, 1) = temp;

        temp = mat(3, :);
        mat(3, :) = mat(1, :);
        mat(1, :) = temp;
    end
    
    persistent r_end_loop;
    persistent c_end_loop;
    
    if y_end == 0
        r_end_loop = size(in_img_bordes0, 1)-floor( size(mat, 1)/2 );
    else
        r_end_loop = y_end;
    end
    if x_end == 0
        c_end_loop = size(in_img_bordes0, 2)-floor( size(mat, 2)/2 );
    else
        c_end_loop = x_end;
    end       
    
    for r = ceil( size(mat, 1)/2 ) + y_beg: r_end_loop
        for c = ceil( size(mat, 2)/2 ) + x_beg: c_end_loop

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
                temp = sum(temp(:)) + offset;
                if temp < 0
                    out_img(r, c, i) = 0;
                elseif temp > 255
                    out_img(r, c, i) = 255;
                else
                    out_img(r, c, i) = temp;
                end           
            end         
          
        end
    end

end