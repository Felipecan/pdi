function out = equalizacao(entrada)
    
    img = imread(entrada);
    imgGray = rgbtogray(img);
    [row, col] = size(imgGray);
    nPixels = row*col;
    imwrite(imgGray, 'imgGray_eq.jpg');
    imgEq = uint8(zeros(row,col));

    somatorio = zeros(256,1);
    
    eqVal = zeros(256,1);

    soma = 0;
    
    [~,~,L,mfreq] = histograma('imgGray_eq.jpg');
    myFreq = mfreq';
    
    for i = 1:size(myFreq)
        soma = soma + myFreq(i);
        somatorio(i) = soma;
        eqVal(i) = round((somatorio(i)/nPixels)*(L-1));
    end
    
  for i=1:row
        for j=1:col
                imgEq(i,j) = eqVal(imgGray(i,j) + 1); % +1 pois terao valores iguais a 0
        end
  end

    %salvando imagens para plotar histograma
    imwrite(imgEq, 'imgEq.jpg');
    %plotar img cinza e equalizada
    subplot(2,2,1);
    imshow(imgGray);
    title('imgGray');
    subplot(2,2,2);
    imshow(imgEq);
    title('imgEq');
    %plotar histogramas cinza e expandido
    subplot(2,2,3);
    histograma('imgGray_eq.jpg');
    title('Hist. imgGray');
    subplot(2,2,4);
    histograma('imgEq.jpg');
    title('Hist. imgEq');
end