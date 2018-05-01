function imgExp = expansao(entrada)
  
    img = imread(entrada);

    %converte imagem para cinza
    imgGray = rgbtogray(img);

    %pega os valores max e min dos pixels, e a qtd maxima possivel
    [Lmin, Lmax, L] = histograma(entrada); 
  
    %formula para a expansao
    imgExp = (imgGray - Lmin).*((L-1)/Lmax-Lmin);
    
    %salvando imagens para plotar histograma
    imwrite(imgExp, 'imgExp.jpg');
    imwrite(imgGray, 'imgGray_exp.jpg');
    %plotar img cinza e expandida
    subplot(2,2,1);
    imshow(imgGray);
    title('imgGray');
    subplot(2,2,2);
    imshow(imgExp);
    title('imgExp');
    %plotar histogramas cinza e expandido
    subplot(2,2,3);
    histograma('imgGray_exp.jpg');
    title('Hist. imgGray');
    subplot(2,2,4);
    histograma('imgExp.jpg');
    title('Hist. imgExp');
    
    warning('off', 'Images:initSize:adjustingMag');
  
end