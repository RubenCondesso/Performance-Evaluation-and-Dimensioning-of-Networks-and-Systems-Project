function [ f ] = averageDelayQueueEstimationex2(n)

%Sistema MM1 com metodo de replication/deletion, com warm-up

MeanInterarrival=2;
MeanService=1;
Time=0;

lambda=1/MeanInterarrival;
u=1/MeanService;

%pedidos processados com sucess�o, que passaram no servidor
NumQueueCompleted=0;

%Estado do servidor:0-vazio;1-cheio
ServerStatus=0;

%n�mero de clientes na queue
NumInQueue=0;

AcumDelay=0;
QueueArrivalTime=[];

%Valor te�rico do atraso m�dio na queue
Wq=(lambda)/(u * (u-lambda));

%ocorr�ncias no servidor: (1) chegadas; (2) partidas
EventList=[(-(MeanInterarrival)*log(rand)) Inf];

tempoWarmUp = n; % Periodo para o aquecimento

m=tempoWarmUp*10; %tamanho da observa��o

while NumQueueCompleted < m % m >> tempoWarmUp
 
 %minimo do vetor  
 [Time,NextEventType]=min(EventList);
 
 if NextEventType==1 %temos uma chegada
     
    EventList(1)=Time+(-(MeanInterarrival)*log(rand));
 
     if ServerStatus==1 %servidor est� cheio, logo tem de ir pra a fila
        QueueArrivalTime(NumInQueue+1)=Time;
        NumInQueue=NumInQueue+1;

     else %entra para o servidor sendo que n�o est� cheio
        NumQueueCompleted=NumQueueCompleted+1;
        ServerStatus=1;
        EventList(2)=Time+(-(MeanService)*log(rand)); %corresponde ao tempo de sa�da do pr�ximo cliente
     end
    
 else %temos uma partida
     
     if NumInQueue==0 %a queue est� vazia
         ServerStatus=0;
         EventList(2)=Inf;
     
     else %servidor encontra-se cheio, � necess�rio retirar o cliente do mesmo
         
         if NumQueueCompleted > tempoWarmUp % apagar algumas observa��es iniciais da simula��o e usar apenas as restantes observa��es   
            %calculo da m�dia com essas restantes observa��es
            AcumDelay=AcumDelay+Time-QueueArrivalTime(1);
         end
             
         NumQueueCompleted=NumQueueCompleted+1;
         QueueArrivalTime(1)=[]; %elimina o primeiro tempo
         NumInQueue=NumInQueue-1;
         EventList(2)=Time+(-(MeanService)*log(rand)); 
         
     end
 end
end

AvgDelay=AcumDelay/(NumQueueCompleted-tempoWarmUp);

f=[AvgDelay, Wq];

end
