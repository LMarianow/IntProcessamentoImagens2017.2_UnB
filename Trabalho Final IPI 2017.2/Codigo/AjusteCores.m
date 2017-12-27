%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade de Brasilia                         %
% Departamento de Ciencia da Computacao            %
% Introducao ao Processamento de Imagens - Turma A %
% Professor Bruno Luiggi Macchiavello Espinoza     %
% Projeto Final - Imagem Cartoon                   %
% Lucas Mariano Carvalho - 16/0133661              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ImgCores] = AjusteCores(ImagemEntrada)
  % AjusteCores(): Fazer o ajuste de cores de uma imagem para ficar com o aspecto de cartoon.
  % ImagemEntrada: Imagem de entrada do tipo RGB.
  % ImgCores: Imagem final de saida aplicada filtro bilateral juntamente 
  % com a quantizacao de cores para ficar com aspecto cartoon.

  % Ajustando a imagem e separando cada componente RGB da imagem para filtragem separadamente.
  ImagemEntrada = double(ImagemEntrada)/255;
  R = ImagemEntrada(:,:,1);
  G = ImagemEntrada(:,:,2);
  B = ImagemEntrada(:,:,3);

  % Fazendo a filtragem bi-lateral em cada componente RGB.
  ImgFiltroBilateral(:,:,1) = FiltroBilateral(R);
  ImgFiltroBilateral(:,:,2) = FiltroBilateral(G);
  ImgFiltroBilateral(:,:,3) = FiltroBilateral(B);

  % Multiplicar a imagem resultante por 255 para que os niveis de cinza nao fiquem no intervalo [0-1].
  ImgFiltroBilateral = ImgFiltroBilateral*255;
  %figure, imshow(uint8(ImgFiltroBilateral)), title('Imagem Filtrada Bilateral');

  % Processo de quantizacao da imagem do filtro bilateral, sendo 16 niveis de cor para cada canal.
  ImgCores = uint8((floor(double(ImgFiltroBilateral)/16))*16);
  %figure, imshow(ImgCores), title('Imagem Final Ajuste de Cores');
end
    






    
