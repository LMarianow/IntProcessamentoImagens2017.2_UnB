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

% Lendo o vídeo a partir da função yuvRead.
[y,u,v] = yuvRead('foreman.yuv',352,288,2);

% Recuperando os 2 primeiros frames de brilho da imagem.
Frame0 = y(:,:,1);
Frame1 = y(:,:,2);
figure(), imshow(Frame0), title('Frame 0');
figure(), imshow(Frame1), title('Frame 1');

% Criando o histograma dos dois frames.
[counts0,bin_locations0] = imhist(Frame0);
[counts1,bin_locations1] = imhist(Frame1);
figure(), h0 = stem(bin_locations0,counts0);
figure(), h1 = stem(bin_locations1,counts1);

% Segmentando a imagem em 5 partes com base no histograma avaliado.
Frame0(Frame0 < 101)= 0;
Frame0(Frame0 >= 101 & Frame0 < 179) = 51;
Frame0(Frame0 >= 179 & Frame0 < 213) = 102;
Frame0(Frame0 >= 213 & Frame0 < 227) = 153;
Frame0(Frame0 >= 227) = 255;
figure(), imshow(Frame0), title('Frame 0 Segmentado');

Frame1(Frame1 < 101)= 0;
Frame1(Frame1 >= 101 & Frame1 < 179) = 51;
Frame1(Frame1 >= 179 & Frame1 < 213) = 102;
Frame1(Frame1 >= 213 & Frame1 < 227) = 153;
Frame1(Frame1 >= 227) = 255;
figure(), imshow(Frame1), title('Frame 1 Segmentado');





