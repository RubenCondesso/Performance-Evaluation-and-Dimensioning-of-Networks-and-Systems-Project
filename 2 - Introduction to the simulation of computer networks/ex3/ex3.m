function [ f ] = ex3( rep, gamma, n)
%
%

quantil=1.2816; % quantis para 90% de intervalo de confiança, para distribuicao Normal
 
vector_utilizacaoServidor=[]; % vector com os valores da utilizacao do servidor

vector_clientesNaQueue=[]; % vector com os valores do numero de clientes presentes na queue

server_state=1; % atividade num instante referente ao servidor
client_state=1; 

contador=1;
erroRelativo=gamma/(1-gamma); %erro relativo maximo da estimativa calculada

vector_auxiliar=[];

while server_state == 1 && client_state ==1 %estão ambos ativos
    
    vector_auxiliar= averageDelayQueueEstimationex3(n);
    
    vector_utilizacaoServidor(contador)=vector_auxiliar(2); 
    vector_clientesNaQueue(contador)=vector_auxiliar(4);
    
    variancia_utilizacaoServidor=var(vector_utilizacaoServidor); % valor da variancia dos valores para a utilizacao do servidor
    media_utilizacaoServidor=mean(vector_utilizacaoServidor); % valor da media dos valores para a utilizacao do servidor
    
    variancia_numeroClientes=var(vector_clientesNaQueue); % valor da variancia para o numero de clientes na queue
    media_numeroClientes=mean(vector_clientesNaQueue); % valor da media para o numero de clientes na queue
    
    if contador < rep %não contar com as observaçoes iniciais, descartá-las
        contador = contador +1;
        continue

    elseif server_state==1
        k = quantil*(sqrt((variancia_utilizacaoServidor^2)/contador));
        
        %ja existem replicas  geradas suficientes, mudança na variavel de estado
        if(k /media_utilizacaoServidor)<= erroRelativo
            server_state=0;
        else
            contador=contador+1;
            continue
        end
    
    elseif client_state==1
        k=quantil*(sqrt((variancia_numeroClientes^2)/contador));
        
        %ja existem replicas  geradas suficientes, mudança na variavel de estado
        if(k /media_numeroClientes)<= erroRelativo
            client_state=0;
        else
            contador=contador+1;
            continue
        end
    
    end

end


disp('Valor teórico para o número médio de clientes na queue');
disp(vector_auxiliar(3));

disp('Valor teórico para a utilizacao do servidor');
disp(vector_auxiliar(5));

disp('Valor prático para o número médio de clientes na queue');
disp(media_numeroClientes);

disp('Valor prático para a media do valor da utilizacao do servidor');
disp(media_utilizacaoServidor);

disp('Variancia para o número médio de clientes na queue');
disp(variancia_numeroClientes);

disp('Variancia para o valor pratico calculado de utilizacao do servidor');
disp(variancia_utilizacaoServidor);

end

