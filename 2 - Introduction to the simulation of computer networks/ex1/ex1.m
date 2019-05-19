function [ f ] = ex1( n )

%Simulação da média do atraso médio na queue, fazendo n simulações

auxiliar=averageDelayQueue;

%Valor teórico
valor_teorico=auxiliar(2);

%Vetor com as simulações geradas
vector_Delay=[];
for i=1:n
    auxiliar=averageDelayQueue;
    vector_Delay(i)=auxiliar(1);
end

media=mean(vector_Delay);
variancia=var(vector_Delay);

disp('Vetor de simulações');
disp(vector_Delay);

disp('Media Vector Atrasos');
disp(media);

disp('Variancia Vector Atrasos');
disp(variancia);

disp('Valor Teórico');
disp(valor_teorico);
end

