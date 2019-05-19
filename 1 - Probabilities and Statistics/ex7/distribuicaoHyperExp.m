function [ f ] = distribuicaoHyperExp( nTrials )
%
% � gerado um vector com o valor da m�dia e vari�ncia, para um certo n, 
% segundo a distribui��o HyperExponensial


vector_Dist=zeros(nTrials+1);

media=0; %valor da media
s=0; %valor da variancia
i=1;

z=0; %variavel auxiliar

p=0.9;
mean1=0.5;
mean2=0.55;

%Para gerar uma distribui��o HyperExponensial, primeiramente � necess�rio
%fazer n experi�ncias de bernoulli, dado uma probabilidade p associada a 2
%tipos de fun��es exponensiais com m�dias diferentes
%Depois sim, dado a fun��o calhada (1 ou 2), deve-se fazer a sua
%distribui��o exponensial dada a sua m�dia e associar ao vector_Dist

while (i<=nTrials)
    z=bernoulliCode(p);
    if z < p
        vector_Dist(i)=distribuicaoExp(1/mean1); 
    else
       vector_Dist(i)=distribuicaoExp(1/mean2); 
    end
    i=i+1;
end

i=1;
%calculo da media do vector de distribuicao
while i<=nTrials
    media=media+vector_Dist(i);
    i=i+1;
end
media=media/nTrials;

i=1;
%variancia calculo
while i<=nTrials
    s = s + (vector_Dist(i)-media)^2;
    i=i+1;
end

s=s/(nTrials-1);
%vector final com media e variancia
f=[media, s];
end

