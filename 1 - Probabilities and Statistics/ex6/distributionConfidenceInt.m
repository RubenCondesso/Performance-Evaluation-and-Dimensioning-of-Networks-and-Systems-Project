function [ t ] = distributionConfidenceInt()
%
%  Para o vector inicial dado, são gerados dois intervaos de confiança
%  para a distribuição de Student's e Normal
%  A média dos dois intervalos de confiança, para um certo alfa de
%  cobertura, deve ser igual à média do vector inicial
%  É expectável que o intervalo da distribuição Normal seja mais amplo

observations = [7.3, 6.1, 3.8, 8.4, 6.9, 7.1, 5.3, 8.2, 4.9, 5.8];

total =0;
media = 0;
tamanho =size(observations);
for i=1:tamanho(2)
    total = total + observations(i);
end

media = total/tamanho(2);
disp('Media:');
disp(media);

variancia=0;
total=0;
for i=1:tamanho(2)
    total = total + (observations(i)-media)^2;
end

variancia=total/9;
disp('Variancia');
disp(variancia);

%Alfa=0.05 (1-0.95)
%Temos a=1-alfa/2=1-(0.05/2)=0.975
%Tabela Distribuição Normal para 0.975 -> 1.960

intN=sqrt(variancia/10)*1.960;
intDistribuicaoNormal=[media-intN,media+intN];
disp('Distribuição Normal');
disp(intDistribuicaoNormal);

%Tabela Distribuição Student’s para 0.975 -> 2.262
intS=sqrt(variancia/10)*2.262;
disp('Distribuição Student’s');

t=[media-intS,media+intS];

%Ambos os intervalos apresentam o valor 6.38 como média
%Esse valor representa a média do intervalo observations
end

