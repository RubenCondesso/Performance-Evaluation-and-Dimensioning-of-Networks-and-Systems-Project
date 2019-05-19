function [ distN ] = distribuicaoNormal( nTrials )
%
% � gerado um vector com o valor da m�dia e vari�ncia, para um certo n, 
% segundo a distribui��o normal

vector_Dist=randn(1,nTrials+1);
%disp('Vector com Distribuicao Normal');
%disp(vector_Dist);

media=0; %valor da media
s=0; %valor da variancia

i=1;
while (i<=nTrials)
    media = media + vector_Dist(i);
    i=i+1;
   
end
media=media/nTrials;

i=1;
%variancia calculo
while(i<=nTrials)
    s = s + (vector_Dist(i)-media)^2;
    i=i+1;
end

s=s/(nTrials-1);
%vector final com media e variancia
distN=[media, s];
end

