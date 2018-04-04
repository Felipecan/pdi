function output_img = median_filter(input_img, size_kernel)
    
    output_img = input_img;%uint8(zeros(size(input_img)));
    %sub_matrix = uint8(zeros(size_kernel, size_kernel, 3));
    %disp(size(sub_matrix))
    
    %ceil(size_kernel/2) retorna o primeiro inteiro. No caso do kernel ser
    %3x3, esse valor vai ser 2, de onde realmetne deveria começar o loop.
    %No caso do 5, por exemplo, o valor é 3 e assim vai...
    %Já o floor(size_kernel/2) vai retornar o menor inteiro. Ele vai dizer
    %onde parar, caso seja 3x3, então ele vai deixar de linha a última
    %linha e coluna, mas se for 7x7 deixará duas
    for r = ceil(size_kernel/2): size(input_img, 1)-floor(size_kernel/2)       
        for c = ceil(size_kernel/2): size(input_img, 2)-floor(size_kernel/2)
          
            %Extrai uma parte da matriz, conforme o tamanho do kernel
            %X - floor(size_kernel/2) diz que devo voltar certa quantidade
            %de "casas", por exemplo, em 3x3 deverá voltar 1, então 2 - 3/2
            %= 1. Se for 7 é duas e por aí vai...
            %(x - floor(size_kernel/2))+(size_kernel-1) vai dizer até onde
            %deve cortar. Se for 3x3: 2 - 3/2 + (3-1) = 3.
            %Assim dependendo do kernel, a matriz deverá ser cortada
            %corretametne para calcular a média
            sub_matrix = input_img(r - floor(size_kernel/2): (r - floor(size_kernel/2))+(size_kernel-1) , c-floor(size_kernel/2): (c - floor(size_kernel/2))+(size_kernel-1), 1:3);
            
            red = sub_matrix(:,:,1);
            red = sort(red(:));
            
            gre = sub_matrix(:,:,2);
            gre = sort(gre(:));
            
            blu = sub_matrix(:,:,3);
            blu = sort(blu(:));
            
            if mod((size_kernel*size_kernel),2) == 1
                output_img(r, c, 1) = red(ceil((size_kernel*size_kernel)/2));
                output_img(r, c, 2) = gre(ceil((size_kernel*size_kernel)/2));
                output_img(r, c, 3) = blu(ceil((size_kernel*size_kernel)/2));
            else
                ind = (size_kernel*size_kernel)/2;
                
                value = red(ind);
                value = value + red(ind+1);
                output_img(r, c, 1) = ceil(value/2);
                
                value = gre(ind);
                value = value + gre(ind+1);
                output_img(r, c, 2) = ceil(value/2);
                
                value = blu(ind);
                value = value + blu(ind+1);
                output_img(r, c, 3) = ceil(value/2);
            end
        end
    end
    
end