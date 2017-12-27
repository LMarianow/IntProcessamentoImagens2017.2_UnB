%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade de Brasilia                         %
% Departamento de Ciencia da Computacao            %
% Introducao ao Processamento de Imagens - Turma A %
% Professor Bruno Luiggi Macchiavello Espinoza     %
% Projeto Final - Imagem Cartoon                   %
% Lucas Mariano Carvalho - 16/0133661              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

clear all;
close all;
clc;

% Obtendo o diretorio das imagens.
cd ../BancoImagens/;
Diretorio = dir ('*.jpg');
NumeroImagens = length(Diretorio);

% Percorrendo o diretorio, uma imagem por vez.
for cont = 1:NumeroImagens

  % Lendo as imagens.
  ImagemEntrada = imread(Diretorio(cont).name);
  %figure, imshow(ImagemEntrada), title('Imagem de Entrada');

  % Fazendo as devidas operacoes de cores e bordas da imagem.
  ImgCores = AjusteCores(ImagemEntrada);
  ImgBordas = DetectaBordas(ImagemEntrada);

  % Combinando cores com bordas para gerar o filtro cartoon.
  [linhas, colunas] = size(ImgBordas);

  for x=1:linhas
    for y=1:colunas
      if (ImgBordas(x,y) == 1)
        ImgCores(x,y,1) = 0;
        ImgCores(x,y,2) = 0;
        ImgCores(x,y,3) = 0;
      end
    end 
  end

  % Salvando a imagem resultado.
  %figure, imshow(ImgCores), title('Imagem Cartoonizada');
  DiretorioResultado = sprintf('../Resultados/cartoon_%d.jpg', cont);  
  imwrite(ImgCores, DiretorioResultado);
end