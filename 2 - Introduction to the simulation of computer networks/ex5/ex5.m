function [ f ] = ex5( rep, n)
%
%

quantil=1.2816; % quantis para 90% de intervalo de confian�a, para distribuicao Normal

vector_Delay=[];
vector_auxiliar=[];

for i=1:rep
    
    vector_auxiliar= averageDelayQueueEstimationex5(n);
    
    vector_Delay(i)= vector_auxiliar(1); % vector com os valores das medias das observa�oes geradas
    
    media=mean(vector_Delay); % valor da media dos valores presentes no vector
    variancia=var(vector_Delay);% valor da variancia dos valores presentes no vector
    
    k=sqrt(quantil*((variancia^2)/i));
end

%Valores calculados para encontrar o intervalo de confian�a para 90% da
%m�dia do atraso da queue
limite_inferior=media-k;
limite_superior=media+k;
vector_intervaloConfianca=[limite_inferior, limite_superior];

disp('Intervalo de confian�a para a m�dia do atraso, para 90%')
disp(vector_intervaloConfianca);

disp('Media Vector Atrasos');
disp(media);

disp('Valor te�rico para o atraso m�dio na queue')
disp(vector_auxiliar(2));

end


