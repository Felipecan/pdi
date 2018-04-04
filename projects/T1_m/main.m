%raw = imread('imgs/lena.png');


%subplot(1, 2, 1), imshow(raw)
%subplot(1, 2, 2), imshow(mean_filter)

prompt = 'Informe o caminho para carregar a imegam: ';
str = input(prompt, 's');

if ~isempty(str)
    raw = imread(str);
    
    prompt = 'Informe a questao que quer executar: ';
    op = input(prompt);
    
    if ~isempty(op)
        switch op
            case 1
                copy_img = raw;                     %faz uma copia por seguranca
                yiq = RGB2YIQ(copy_img);            %transforma de rgb para yiq
                rgb_b = YIQ2RGB(yiq);               %volta para o rgb (yiq para rgb)
                %mostra as imagens combinadas
                subplot(1, 3, 1), imshow(raw)
                subplot(1, 3, 2), imshow(yiq)
                subplot(1, 3, 3), imshow(rgb_b)
            case 2
                copy_img = raw;                     %faz uma copia por seguranca
                red_img = red(copy_img);            %separa a banda vermelha
                green_img = green(copy_img);        %separa a banda verde
                blue_img = blue(copy_img);          %separa a banda blue
                %mostra as imagens combinadas
                subplot(1, 4, 1), imshow(raw)
                subplot(1, 4, 2), imshow(red_img)
                subplot(1, 4, 3), imshow(green_img)
                subplot(1, 4, 4), imshow(blue_img)
            case 3
                copy_img = raw;                     %faz uma copia por seguranca
                neg_rgb = negative(copy_img);       %tranforma a imagem em negativo
                %mostra as imagens combinadas
                subplot(1, 2, 1), imshow(raw)
                subplot(1, 2, 2), imshow(neg_rgb)                
            case 4
                prompt = 'Informe o valor para dar o brilho, real(multiplicativo) ou inteiro(aditivo): ';
                value = input(prompt);
                copy_img = raw;                     %faz uma copia por seguranca
                bright_img = brightness(copy_img, value);
                %mostra as imagens combinadas
                subplot(1, 2, 1), imshow(raw)
                subplot(1, 2, 2), imshow(bright_img)  
            case 5
                %multiplicativo
            case 6
                %limiarizacao
            case 7
                prompt = 'Informe o tamanho do kernel: ';
                sz_k = input(prompt);
                copy_img = raw;                     %faz uma copia por seguranca
                av = avarage_filter(copy_img, sz_k);%aplica o filtro media
                med = median_filter(copy_img, sz_k);%aplica o filtro mediana
                %mostra as imagens combinadas
                subplot(1, 3, 1), imshow(raw)
                subplot(1, 3, 2), imshow(av) 
                subplot(1, 3, 3), imshow(med) 
            case 8
                %yuri
            case 9
                copy_img = raw;                     %faz uma copia por seguranca
                op1 = apply_filter(copy_img, 1);    %aplica o filtro para a matriz [0 -1 0; -1 5 -1; 0 -1 0]
                op2 = apply_filter(copy_img, 2);    %aplica o filtro para a matriz [0 0 0; 0 1 0; 0 0 -1]
                %mostra as imagens combinadas
                subplot(1, 3, 1), imshow(raw)
                subplot(1, 3, 2), imshow(op1) 
                subplot(1, 3, 3), imshow(op2) 
            otherwise
                 disp("Valor incorreto, pressione de 1 a 9")
        end
    else
        disp("Valor incorreto, pressione de 1 a 9")
    end
    
    
else
    disp("Informe um caminho valido ou o arquivo nao foi encontrado")
end