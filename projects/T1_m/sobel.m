function gxy = sobel(entrada)
  img = imread(entrada);
  img = rgb2gray(img);
  
  % criando as mascaras de convolução; serve para calcular aproximaçao da
  % derivada
  mx = [-1, 0, 1; -2, 0, 2; -1, 0, 1];%horizontal
  my = [1, 2, 1; 0, 0, 0; -1, -2, -1];%vertical
  
  % calculando o gradiente (em x e y)
  gx = conv2(single(img),single(mx));%gradiente horizontal
  gy = conv2(single(img),single(my));%gradiente vertical
   
  % magnitude do gradiente
  gxy = sqrt(gx.^2 + gy.^2);
  imshow(uint8(gxy));
  imwrite(uint8(gxy),'sobelOut.jpg');
  warning('off', 'Images:initSize:adjustingMag');
end