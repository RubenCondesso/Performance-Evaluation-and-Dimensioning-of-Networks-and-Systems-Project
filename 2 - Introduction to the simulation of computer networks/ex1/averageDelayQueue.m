function [ f ] = averageDelayQueue()

MeanInterarrival=2;
MeanService=1;
Time=0;

%pedidos processados com sucessão, que passaram no servidor
NumQueueCompleted=0;

%Estado do servidor:0-vazio;1-cheio
ServerStatus=0;

%número de clientes na queue
NumInQueue=0;

AcumDelay=0;
QueueArrivalTime=[];

Valor_Teorico=(1/MeanInterarrival)/((1/MeanService)-(1/MeanInterarrival));

%ocorrências no servidor: (1) chegadas; (2) partidas
EventList=[(-(MeanInterarrival)*log(rand)) Inf];

while NumQueueCompleted < 1000  
 
 %minimo do vetor  
 [Time,NextEventType]=min(EventList);
 
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
end

AvgDelay=AcumDelay/NumQueueCompleted;

f=[AvgDelay, Valor_Teorico];

end

