%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade de Brasilia                         %
% Departamento de Ciencia da Computacao            %
% Introducao ao Processamento de Imagens - Turma A %
% Professor Bruno Luiggi Macchiavello Espinoza     %
% Projeto Final - Imagem Cartoon                   %
% Lucas Mariano Carvalho - 16/0133661              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ImgBordas] = DetectaBordas(ImagemEntrada)
  % DetectaBordas(): Fazer a deteccao de bordas de uma imagem de entrada e as 
  % devidas operacoes para a aplicacao dessas bordas em um filtro do tipo cartoon.
  % ImagemEntrada: Imagem de entrada do tipo RGB.
  % ImgBordas: Imagem final de saida com as bordas detectadas utilizando o algoritimo de canny e
  % feita as devidas operacoes para o realce do cortono para efeito cartoon.

  % Para processar as bordas, eh mais facil trabalhar em niveis de cinza, devido a definicao 
  % de borda que eh a mudança de nivel de cinza quando ocorre alguma descontinuidade na intensidade.
  ImagemNiveisDeCinza = rgb2gray(ImagemEntrada);

  % Eh aplicado um filtro de mediana para eliminar ruidos do tipo salt and pepper 
  % presente na imagem. Por ser pequeno (7x7), nao prejudica as bordas da imagem.
  FiltroMediana = medfilt2(ImagemNiveisDeCinza, [7 7], 'symmetric');
  %figure, imshow(FiltroMediana), title('Imagem Filtro Mediana');
  
  % A principio, foi utilizado a deteccao de bordas de Canny fazendo testes empiricos.
  ImgBordas = edge(FiltroMediana, 'canny');
  %figure, imshow(ImgBordas), title('Imagem Deteccao de Bordas Soh Canny');
  
  % Eh aplicada a dilatacao para engrossar um pouco as bordas. O square foi 
  % escolhido por ser o S.E. que deixa as bordas mais naturais.
  DilataBorda = imdilate(ImgBordas, strel('square', 2));
  %figure, imshow(DilataBorda), title('Imagem Bordas Dilatadas');

  % Por fim aplica-se a funcao, bwareaopen que apaga certas bordas com a area menor que
  % 400 pixels, com o intuito de nao deixar a imagem tao saturada de bordas.
  ImgBordas = bwareaopen(DilataBorda, 400);
  %figure, imshow(ImgBordas), title('Imagem Deteccao de Bordas Final');
end