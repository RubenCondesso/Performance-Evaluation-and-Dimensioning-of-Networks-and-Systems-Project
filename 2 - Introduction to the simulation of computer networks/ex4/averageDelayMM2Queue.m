function [ f ] = averageDelayMM2Queue()

MeanInterarrival=2;
MeanService=1;

lambda=1/MeanInterarrival;%valor de lambda
u=1/MeanService; %valor de lambda
Valor_Teorico=(lambda/(u-lambda));

%Estado dos servidores:0-vazio;1-cheio
ServerStatus1=0;
ServerStatus2=0;

Time=0;

%pedidos processados com sucessão, que passaram no servidor
NumQueueCompleted=0;

NumInQueue=0; %numero de clientes na queue
AcumDelay=0;
QueueArrivalTime=[];

%ocorrências no servidor: (1) chegadas; (2) partidas server1 (3)partidas server2
EventList=[(-(MeanInterarrival)*log(rand)) Inf Inf];

while NumQueueCompleted < 1000  
 [Time,NextEventType]=min(EventList); %minimo do vetor 
 
 if NextEventType==1  %temos uma chegada
    EventList(1)=Time+(-(MeanInterarrival)*log(rand)); 
 
     if ServerStatus1==1 && ServerStatus2==1 %ambos os servidores estão cheios, vai para a fila
        QueueArrivalTime(NumInQueue+1)=Time;
        NumInQueue=NumInQueue+1;

     elseif ServerStatus1==0 %entra no servidor 1 estando este vazio
         NumQueueCompleted=NumQueueCompleted+1;
         ServerStatus1=1;
         EventList(2)=Time+(-(MeanService)*log(rand)); %corresponde ao tempo de saída do próximo cliente no servidor 1
         
     else %entra no servidor 2 estando este vazio
         NumQueueCompleted=NumQueueCompleted+1;
         ServerStatus2=1;
         EventList(3)=Time+(-(MeanService)*log(rand)); %corresponde ao tempo de saída do próximo cliente no servidor 2
     end    
    
 elseif NextEventType==2 %corresponde a uma partida no servidor 1
     
     if NumInQueue==0  %a queue está vazia
         ServerStatus1=0;
         EventList(2)=Inf;
     
     else %calcula o atraso e coloca o cliente no servidor 
        AcumDelay=AcumDelay+Time-QueueArrivalTime(1);
        NumQueueCompleted=NumQueueCompleted+1;
        QueueArrivalTime(1)=[]; %elimina o primeiro tempo
        NumInQueue=NumInQueue-1;
        EventList(2)=Time+(-(MeanService)*log(rand));
     end

 else %temos uma partida no servidor 2
     
     if NumInQueue==0
         ServerStatus2=0;
         EventList(3)=Inf;
   
     else
        AcumDelay=AcumDelay+Time-QueueArrivalTime(1);
        NumQueueCompleted=NumQueueCompleted+1;
        QueueArrivalTime(1)=[]; %elimina o primeiro tempo
        NumInQueue=NumInQueue-1;
        EventList(3)=Time+(-(MeanService)*log(rand));
     end
 end
end

AvgDelay=AcumDelay/NumQueueCompleted;

Valor_Teorico=TheoricDelay(lambda,u,2);

f=[AvgDelay Valor_Teorico];
end



