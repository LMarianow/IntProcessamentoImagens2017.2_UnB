%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade de Brasilia                         %
% Departamento de Ciencia da Computacao            %
% Introducao ao Processamento de Imagens - Turma A %
% Professor Bruno Luiggi Macchiavello Espinoza     %
% Trabalho Individual 1 - Questao 2                %
% Lucas Mariano Carvalho - 16/0133661              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;

% Faz a leitura da imagem de entrada.
Img=imread('Image1.pgm');
figure, imshow(Img), title('Imagem original');

% Matriz filtro laplaciano de centro 8.
Laplace=[-1 -1 -1; -1 8 -1; -1 -1 -1];

% Aplicando o Filtro laplaciano de centro 8.
ImgFiltrada=imfilter(Img,Laplace); 

% Resultado do filtro com imagem original.
Resultado=Img+ImgFiltrada;
figure, imshow(Resultado), title('Imagem com filtro 2.1');

%-------------------------------------------------------------------------------------------------------------------------------------%

% Criando filtro gaussiano de tamanho = [3 3] e sigma = 0.5 .
FiltroGaussiano = fspecial('gaussian',[3 3],0.5);

% Aplicando o filtro gaussiano na imagem original.
ImgGauss = imfilter(Img,FiltroGaussiano,'same');

% Matriz filtro laplaciano de centro 4.
Laplace2=[0 -1 0; -1 4 -1; 0 -1 0]; 

% Aplicando o Filtro laplaciano de centro 4 na imagem que foi aplicada o filtro gaussiano.
ImgFiltrada2=imfilter(ImgGauss,Laplace2); 

% Resultado do filtro com imagem de filtro gaussiano de tamanho = [3 3] e sigma = 0.5 .
Resultado2=ImgGauss+ImgFiltrada2;
figure, imshow(Resultado2), title('Imagem com filtro 2.2'); 

%-------------------------------------------------------------------------------------------------------------------------------------%

% Criando filtro gaussiano de tamanho = [3 3] e sigma = 1.
FiltroGaussiano2 = fspecial('gaussian',[3 3],1);

% Aplicando o filtro gaussiano na imagem original.
ImgGauss2 = imfilter(Img,FiltroGaussiano2,'same');

% Matriz filtro laplaciano de centro -8.
Laplace3=[1 1 1; 1 -8 1; 1 1 1]; 

% Aplicando o Filtro laplaciano de centro 8 na imagem que foi aplicada o filtro gaussiano.
ImgFiltrada3=imfilter(ImgGauss2,Laplace3);

% Resultado do filtro com imagem de filtro gaussiano de tamanho = [3 3] e sigma = 1.0.
Resultado3=ImgGauss2-ImgFiltrada3;
figure, imshow(Resultado3), title('Imagem com filtro 2.3');

%-------------------------------------------------------------------------------------------------------------------------------------%