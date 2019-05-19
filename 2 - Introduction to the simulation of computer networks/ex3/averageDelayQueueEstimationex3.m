function [ f ] = averageDelayQueueEstimationex3(n)

MeanInterarrival=2;
MeanService=1;
Time=0;

lambda=1/MeanInterarrival; %valor de lambda
u=1/MeanService; %valor de miu

%pedidos processados com sucessão, que passaram no servidor
NumQueueCompleted=0;

%Estado do servidor:0-vazio;1-cheio
ServerStatus=0;

%número de clientes na queue
NumInQueue=0;

AcumDelay=0;
QueueArrivalTime=[];

%Valor teórico do atraso médio na queue
Wq=(lambda)/(u * (u-lambda));

%Valor teórico para o número médio de clientes no sistema
Ls=lambda/u;

%Valor teórico para o númoro médio de clientes na queue
Lq=(lambda^2)/((u-lambda)*u);

%ocorrências no servidor: (1) chegadas; (2) partidas
EventList=[(-(MeanInterarrival)*log(rand)) Inf];

tempoWarmUp = n; % Periodo para o aquecimento

AvgClientNumber=0;
 
AreaClients=0; %Valor para o numero de clientes na queue, L(t)
AreaServerStatus=0; %valor para a area da utilizacao do servidor, valores entre 0 e 1, B(t)
TimePreviousEvent=0; % tempo do evento anterior
TimeStart=0;

m=tempoWarmUp;
while NumQueueCompleted < m*10 % tamanho da observação 
 
 %minimo do vetor  
 [Time,NextEventType]=min(EventList);
 
 if (NumQueueCompleted >= tempoWarmUp) % tempo de warm up
     
        if (NumQueueCompleted == tempoWarmUp)
            TimeStart = Time;
        end
        
        %Area acumulada ate ao instante do evento anterior ate ao instante
        %atual
        AreaServerStatus=AreaServerStatus+ServerStatus*(Time-TimePreviousEvent);
        
        AreaClients=AreaClients+NumInQueue*(Time-TimePreviousEvent);
 end
 if NextEventType==1 %temos uma chegada
     
    EventList(1)=Time+(-(MeanInterarrival)*log(rand));
 
     if ServerStatus==1 %servidor está cheio, logo tem de ir pra a fila
        QueueArrivalTime(NumInQueue+1)=Time;
        NumInQueue=NumInQueue+1;

     else %entra para o servidor sendo que não está cheio
        NumQueueCompleted=NumQueueCompleted+1;
        ServerStatus=1;
        EventList(2)=Time+(-(MeanService)*log(rand)); %corresponde ao tempo de saída do próximo cliente
     end
    
 else %temos uma partida
     
     if NumInQueue==0 %a queue está vazia
         ServerStatus=0;
         EventList(2)=Inf;
     
     else %servidor encontra-se cheio, é necessário retirar o cliente do mesmo
         
         AcumDelay=AcumDelay+Time-QueueArrivalTime(1);
         NumQueueCompleted=NumQueueCompleted+1;
         QueueArrivalTime(1)=[]; %elimina o primeiro tempo
         NumInQueue=NumInQueue-1;
         EventList(2)=Time+(-(MeanService)*log(rand)); 
         
     end
    
 end
     TimePreviousEvent=Time;
end

AvgDelay=AcumDelay/(NumQueueCompleted-tempoWarmUp);
AvgClientNumber=AreaClients/(Time-TimeStart);
ServerUtilization=AreaServerStatus/(Time-TimeStart);

f=[AvgDelay, AvgClientNumber,Lq, ServerUtilization, Ls];

end
