function [Lmin, Lmax, L, freq] = histograma(entrada)
    img = imread(entrada);
    imgGray = rgbtogray(img);
    h = imgGray;
    [row,col] = size(h);

    freq = zeros(1,256); %array que contera a frequencia de ocorrencia de cada valor de pixel
    n = 0:255; %possiveis valores para os pixels
    cont = 0; %contador para armazenar a frequencia de ocorrencia dos pixels
    Lmax = max(h(:)); %maior valor de pixel
    Lmin = min(h(:)); %menor valor de pixel
    L = 256; %numero total de possiveis valores

    for z = 1:256
        for i = 1:row
            for j = 1:col
                if h(i,j) == z - 1
                    cont = cont + 1;
                end
            end
        end
                freq(z) = cont;
                cont=0;
    end
    disp(freq') %imprime no terminal os valores de t, em forma de linhas

    stem(n,freq); 
    grid on;
    ylabel('num de ocorrencia dos pixels---->');
    xlabel('instensidade do pixel---->');
    title(strcat('HISTOGRAMA DA IMAGEM: ',entrada));
end