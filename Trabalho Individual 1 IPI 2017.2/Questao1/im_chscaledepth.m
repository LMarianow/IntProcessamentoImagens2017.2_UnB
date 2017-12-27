%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade de Brasilia                         %
% Departamento de Ciencia da Computacao            %
% Introducao ao Processamento de Imagens - Turma A %
% Professor Bruno Luiggi Macchiavello Espinoza     %
% Trabalho Individual 1 - Questao 1                %
% Lucas Mariano Carvalho - 16/0133661              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [brilho_tam] = im_chscaledepth(Img, Bits, Escala)
  % im_chscaledepth(): Troca o nivel de brilho de acordo com o numero de bits pedido e o tamanho da imagem de acordo com a escala recebida.
  % Img: Imagem de entrada do tipo RGB.
  % Bits: Quantidade de niveis de cor da imagem. 
  % Escala: Constante de redimensionamento da imagem.

  figure, imshow(Img), title('Imagem de Entrada Funcao');

  % Pega o tamanho em double da imgagem.
  ImgBrilho = double(Img);

  % Faz a mudancaa do nivel de brilho de acordo com o n de bits.
  ImgBrilho = uint8((floor(ImgBrilho/Bits))*Bits);
  figure, imshow(ImgBrilho), title('Imagem com mudanca de brilho');

  % Pega o tamanho da imagem e armazena numa matriz 3x3.
  [lin col cor] = size(Img); 

  % Faz as mutiplicacoes do tamanho das linhas e colunas.
  lin_n = lin*Escala; 
  col_n = col*Escala;

  % Zera a matriz e ja aloca o tamanho da nova imagem.
  Img_TrocaTam = uint8(zeros(lin_n, col_n)); 

  for i= 0:lin_n-1 
    for j= 0:col_n-1
      % Faz a transformacoes para um numero inteiro.
      int_x = floor(j/Escala); 
      int_y = floor(i/Escala); 
      for k= 1:cor
        % Faz a troca das componentes.
        Img_TrocaTam(i+1, j+1, k) = Img(int_y+1, int_x+1, k); 
      end
    end
  end
  figure, imshow(Img_TrocaTam), title('Imagem com mudanca de escala');
end