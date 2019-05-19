function [ f ] = ex1( n )

%Simula��o da m�dia do atraso m�dio na queue, fazendo n simula��es

auxiliar=averageDelayQueue;

%Valor te�rico
valor_teorico=auxiliar(2);

%Vetor com as simula��es geradas
vector_Delay=[];
for i=1:n
    auxiliar=averageDelayQueue;
    vector_Delay(i)=auxiliar(1);
end

media=mean(vector_Delay);
variancia=var(vector_Delay);

disp('Vetor de simula��es');
disp(vector_Delay);

disp('Media Vector Atrasos');
disp(media);

disp('Variancia Vector Atrasos');
disp(variancia);

disp('Valor Te�rico');
disp(valor_teorico);
end

