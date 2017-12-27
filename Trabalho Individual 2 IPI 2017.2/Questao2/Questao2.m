%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade de Brasilia                         %
% Departamento de Ciencia da Computacao            %
% Introducao ao Processamento de Imagens - Turma A %
% Professor Bruno Luiggi Macchiavello Espinoza     %
% Trabalho Individual 2 - Questao 2                %
% Lucas Mariano Carvalho - 16/0133661              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;

% Lendo o video a partir da funcao yuvRead.
[y,u,v] = yuvRead('foreman.yuv',352,288,2);

% Recuperando os 2 primeiros frames de brilho da imagem.
Frame0 = imread('foreman0_seg.png');
Frame1 = imread('foreman1_seg.png');
figure(), imshow(Frame0), title('Frame 0');
figure(), imshow(Frame1), title('Frame 1');

% Adicionando o padding.
padding0 = padarray(Frame0,[50 50],0,'both');
figure(), imshow(padding0), title('Padding 0');
padding1 = padarray(Frame1,[50 50],0,'both');
figure(), imshow(padding1), title('Padding 1');

% Matriz que irá conter o SAD mínimo (indicando o fluxo óptico do pixel)
% para cada pixel.
vet = zeros(288,352,2);

% Para todos os pixels do frame 0 (inicio depois do padding).
for i=51:338
    for j=51:402
        linha_init_n = i-10; linha_fin_n = i+10;
        coluna_init_n = j-10; coluna_fin_n = j+10;

        % Recuperar uma matriz NxN onde o pixel em questão está no centro.
        N = padding0(linha_init_n:linha_fin_n,coluna_init_n:coluna_fin_n);
        linha_init_s = i-20; linha_fin_s = i+20;
        coluna_init_s = j-20; coluna_fin_s = j+20;

        % Recuperar uma matriz SxS onde o pixel está no centro.
        S = padding1(linha_init_s:linha_fin_s,coluna_init_s:coluna_fin_s);
        
        % Colocando a matriz NxN em todas as posíveis posições da matriz
        % SxS. Realizamos a Soma Absoluta das Diferenças e se a de uma
        % comparação de blocos em questão for menor do que o mínimo já
        % definido, redefinimos o vetor de movimentação do pixel como sendo
        % a diferença nos eixos x e y entre o pixel do frame 0 sendo
        % analisado e o pixel no frame 1 na qual o pixel está
        % momentâneamente alinhado.
        min = intmax;
        for k=11:31
            for l=11:31
                C = S(k-10:k+10, l-10:l+10);
                diferenca = C - N;
                absolute = abs(diferenca);
                soma = sum(absolute(:));
                if(abs(soma) < min)
                    min = soma;
                    
                    % Componente x do vetor ((linha_init_s+linha_pixel_match_s) - posicao original do pixel).
                    vet(i-50,j-50,1) = ((i-20)+k)-(i-50);

                    % Componente y do vetor ((coluna_init_s+coluna_pixel_match_s) - posicao original do pixel).
                    vet(i-50,j-50,2) = ((j-20)+l)-(j-50);
                end
            end
        end
        
    end
end

[X,Y] = meshgrid(1:352,1:288);
figure(), q = quiver(X,Y,vet(:,:,1),vet(:,:,2));
