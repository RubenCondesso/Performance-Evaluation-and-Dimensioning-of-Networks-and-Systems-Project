function [ logN ] = distribuicaoLogNormal( nTrials )
%
% É gerado um vector com o valor da média e variância, para um certo n, 
% segundo a distribuição LogNormal

vector_Exp=[];
vector_Dist=randn(1,nTrials);

media=0; %valor da media
s=0; %valor da variancia
i=1;

%soma dos valores gerados aleatóriamente do vector_Dist, fazeno antes a
%exponensial dos mesmos antes, e assim usando a fórmula dada do enunciado
%do laboratório
while (i<=nTrials)
    vector_Exp(i)= exp(vector_Dist(i));
    media = media + vector_Exp(i);
    i=i+1;
end

%disp('Vector com Distribuicao LogNormal');
%disp(vector_Exp);

media=media/nTrials;

i=1;
%variancia calculo
while (i<=nTrials)
     s = s + (vector_Exp(i)-media)^2;
     i=i+1;
end

s=s/(nTrials-1);

%vector final com media e variancia
logN=[media, s];
end

