function out = rgbtogray(data)
        
    [row col ch] = size(data);
    
    if ch == 1
        out  = data;
    elseif ch == 3
        out = data(:,:,3);
    end
    imwrite(out, 'imgGray.jpg');
end