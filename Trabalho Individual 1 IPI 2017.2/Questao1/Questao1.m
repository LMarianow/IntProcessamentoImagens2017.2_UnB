%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade de Brasilia                         %
% Departamento de Ciencia da Computacao            %
% Introducao ao Processamento de Imagens - Turma A %
% Professor Bruno Luiggi Macchiavello Espinoza     %
% Trabalho Individual 1 - Questao 1                %
% Lucas Mariano Carvalho - 16/0133661              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;

% Faz a leitura da imagem pedida.
Img = imread('im1.jpg'); 
figure, imshow(Img), title('Imagem Entrada');

% Pega o tamanho da imagem e armazena em uma matriz 3x3.
[lin col numerodacor] = size(Img); 


% Extraindo os canais RGB da imagem.
CanalVermelho = Img(:, :, 1);
CanalVerde = Img(:, :, 2);
CanalAzul = Img(:, :, 3);

% Construir a nova imagem com os canais de cores vermelho e azul trocados.
ImgTrocaComponentes = cat(3, CanalAzul, CanalVerde, CanalVermelho);
figure, imshow(ImgTrocaComponentes), title('Imagem Troca de Componentes');

% Entradas para funcao im_chscaledepth
Bits = input('Informe a quantidade de bits para niveis de brilho da imagem de saida (de 1 a 8):'); 
Escala = input('Informe a nova escala da imagem:');

% Chamada e passagem de parametros para a funcao
im_chscaledepth(Img, Bits, Escala);
