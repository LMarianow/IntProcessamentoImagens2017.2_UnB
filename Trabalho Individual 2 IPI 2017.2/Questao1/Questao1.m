%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade de Brasilia                         %
% Departamento de Ciencia da Computacao            %
% Introducao ao Processamento de Imagens - Turma A %
% Professor Bruno Luiggi Macchiavello Espinoza     %
% Trabalho Individual 2 - Questao 1                %
% Lucas Mariano Carvalho - 16/0133661              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;

% Faz a leitura da imagem de entrada.
Img = imread('cookies.tif');
figure(), imshow(Img), title('Imagem Original');

% Imagem binarizada utilizando im2bw() e graythresh().
ImgBin = im2bw(Img,graythresh(Img)); 
figure(), imshow(ImgBin), title('Imagem Binarizada');

% Definindo elemento estruturante para operacoes morfologicas.
ImgElemEst = ImgBin(1:155,1:155); 
figure(), imshow(ImgElemEst), title('Imagem Elemento Estruturante');

% Erosao da imagem Binarizada utilizando imerode()
ImgBinErodida = imerode(ImgBin, ImgElemEst); 
figure(), imshow(ImgBinErodida), title('Imagem Erodida');

% Dilatacao da imagem Erodida utilizando imdilate()
ImgBinDilatada = imdilate(ImgBinErodida, ImgElemEst); 
figure(), imshow(ImgBinDilatada), title('Imagem Dilatada');

% Remover cookie mordido da imagem de entrada em niveis de cinza pegando a imagem entrada
% e fazendo a multiplicacao pixel a pixel com a imagem binarizada dilatada.
ImgSemCookie = Img .* ImgBinDilatada;
figure(), imshow(ImgSemCookie), title('Imagem Sem Cookie Mordido');
