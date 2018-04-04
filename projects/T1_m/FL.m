%Filtro Laplaciano
function out = FL(entrada) 
%mascara laplaciana
ml = [-1,-1,-1;-1,8,-1;-1,-1,-1];%remove bordas exteriores, conta com diagonal
img = imread(entrada);
img = rgb2gray(img);

con = conv2(single(img),single(ml));%convoluçao

out = uint8(con);


imshow(out);
imwrite(out, 'laplace.jpg');

end