%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade de Brasilia                         %
% Departamento de Ciencia da Computacao            %
% Introducao ao Processamento de Imagens - Turma A %
% Professor Bruno Luiggi Macchiavello Espinoza     %
% Trabalho Individual 1 - Questao 3                %
% Lucas Mariano Carvalho - 16/0133661              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;

% Faz a leitura da imagem de entrada.
Img = imread('moire.bmp'); 
figure, imshow(Img), title('Imagem original');

% Faz a transformada de fourier na imagem.
ImgFourier = fftshift(fft2(double(Img))); 

% Pega as dimencoes da imagem.
[lin, col,cor] = size(Img);

% n=4 para o filtro passa-altas Butterwoth.
n = 4; 

% Pares de Notch.
D_0 = [10 10 5 5];
U_k = [39 -39 78 -78];
V_k = [30 30 30 30];

% Faz o percorrimento linha coluna na matriz da imagem.
for alt=1:lin
  for larg=1:col
    for k=1:4
      % Fazendo parametros do filtro passa-altas Butterwoth.
      Dk = sqrt((alt-lin/2-U_k(k))^2+(larg-col/2-V_k(k))^2); 
      D_k = sqrt((alt-lin/2+U_k(k))^2+(larg-col/2+V_k(k))^2);
      if(Dk != 0 && D_k != 0)
        % Faz a filtragem com a multiplicao pixel a pixel da imagem.
        ImgFourier(alt,larg) *= 1/(1+(D_0(k)/Dk)^(2*n))*1/(1+(D_0(k)/D_k)^(2*n));
      endif
   endfor
  endfor
endfor

% Mostra a imagem no dominio da frequencia, a imagem foi multiplicado por 255 
% para colocar fundo preto na imagem para aparecer a frequencia da mesma.
figure, imshow(abs(ImgFourier/max(abs(ImgFourier(:))))*255), title('Imagem no dominio da frequencia'); 

% Resultado final ja com o filtro e a transformada aplicando o inverso da transformada em seu centro usando ifftshift e ifft2.
Resultado = real(ifft2(ifftshift(ImgFourier))); 
figure, imshow(uint8(Resultado)), title('Imagem com filtro aplicado');