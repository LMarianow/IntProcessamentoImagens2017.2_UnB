%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universidade de Brasília                         %
% Departamento de Ciência da Computação            %
% Introdução ao Processamento de Imagens - Turma A %
% Professor Bruno Luiggi Macchiavello Espinoza     %
% Projeto Final - Imagem Cartoon                   %
% Lucas Mariano Carvalho - 16/0133661              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ImgFiltroBilateral] = FiltroBilateral(ImagemEntrada)
% ImagemEntrada = Imagem de entrada monocromatica
% ImgFiltroBilateral = Imagem final de saida ja implementado o filtro.
  
    % Tamanho_Janela = Elemento estruturante que foi definido testando os melhores resultados obtidos.
    % Sig_Dist_Gauss = Distancia do pixel central para realizacao do desvio padrao.
    % Sig_Alcance_Gauss = Faixa de intensidade para realizacao do desvio padrao.
    Tamanho_Janela=7;
    Sig_Dist_Gauss=7;       
    Sig_Alcance_Gauss=0.1;  
    
    % Com a ajuda do comando meshgrid() estamos obtendo a distancia de cada ponto do centro uma janela JxJ.
    [X,Y] = meshgrid(-Tamanho_Janela:Tamanho_Janela,-Tamanho_Janela:Tamanho_Janela);
    % Formula para distancia gaussiana
    DistanciaGauss = exp(-(X.^2 + Y.^2)/(2*Sig_Dist_Gauss^2)); 

    % Pegando o tamanho e inicializando a imagem que ira conter a imagem de saida final do filtro.
    [linhas colunas] = size(ImagemEntrada);
    ImgFiltroBilateral = zeros(linhas,colunas);

    for i=1:linhas
        for j=1:colunas
          % Delimita os blocos dentro da imagem para cada pixel.
          Valor_min_I = max(i-Tamanho_Janela,1);
          Valor_max_I = min(i+Tamanho_Janela,linhas);
          Valor_min_J = max(j-Tamanho_Janela,1);
          Valor_max_J = min(j+Tamanho_Janela,colunas);
          % Por tentativa e erro, escolheu-se quais sao os vizinhos de cada pixel que influenciam
          % nas bordas, identificando a forma de como eles variam e ressaltando ainda mais estas.
          Elemento_Estruturante = ImagemEntrada(Valor_min_I:Valor_max_I,Valor_min_J:Valor_max_J);
          AlcanceGauss = exp(-(Elemento_Estruturante - ImagemEntrada(i,j)).^2/(2*Sig_Alcance_Gauss^2));
          % O filtro final sera uma combinacao da distancia de gauss com o alcance de gauss, filtros que ja foram calculados.
          FiltroBilateral =  AlcanceGauss.*DistanciaGauss((Valor_min_I:Valor_max_I)-i+Tamanho_Janela+1,(Valor_min_J:Valor_max_J)-j+Tamanho_Janela+1);
          ImgFiltroBilateral(i,j) = sum(FiltroBilateral.*Elemento_Estruturante)/sum(FiltroBilateral);
        end
    end
end

