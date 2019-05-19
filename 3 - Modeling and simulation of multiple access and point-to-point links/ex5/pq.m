% This routine determines the next packet to be transmitted using a strict
% priority scheduling algorithm, transfers this packet from its queue to the
% transmission link, and schedules its departure time. It the priority
% level of all flows is equal to 1 it emulates fifo scheduling.

function pq

global Queues;
global numPacketsInQueues;
global TxLink;
global LinkState;
global LinkCapacity;
global EventList;
global Time;
global numQueues;
global currentQueue;
global Flows;
global Credits;


thisQueue=0;

if(currentQueue > numQueues)
    currentQueue=1; %verfica se já foi dada uma volta completa
end   

firstQueue=currentQueue; %garante que o ciclo não fica num loop infinito

noPackets=0;

while(1)
    
    if isempty(Queues{currentQueue})
        %nao faz nada pq o ponteiro e actualizado no fim
    else
        
        pacote = Queues{currentQueue}(1,:);
        if (Credits(currentQueue)>= pacote(3))
            Credits(currentQueue)= Credits(currentQueue) - pacote(3);
            break;
        else
            
            Credits(currentQueue)= Credits(currentQueue)+ Flows{currentQueue}(5); %actualizar o conter de creditos
         
        end
    end
    
    currentQueue = currentQueue + 1; %actualizar para proxima fila

    if(currentQueue > numQueues) %averigua se é preciso voltar ao início - Round Robin
        currentQueue = 1;
    
    end
    if(firstQueue == currentQueue) %averigua se já foi dada uma volta completa
       
        noPackets = 1;  %nao há pacotes a enviar, o scheduler não envia nada.
        break;
    end
end
thisQueue=currentQueue; %queue que a ser enviada
currentQueue=currentQueue+1; %actualiza a currentQueue;
   
if(noPackets==0) %apenas envia se houver um pacote por enviar

    %Transfers selected packet to transmission link
    thisPacket=Queues{thisQueue}(1,:);%Reads packet to be transmitted
    Queues{thisQueue}(1,:)=[]; %Removes selected packet from this queue
    numPacketsInQueues(thisQueue)=numPacketsInQueues(thisQueue)-1; %Decrements number of packets in this queue
    TxLink=thisPacket; %Stores this packet at the transmission link
    LinkState=1; %Set state of link to busy

    %Schedules departure of this packet
    thisLength=thisPacket(3); %Length of this packet
    nextDepartureTime=Time+thisLength/LinkCapacity; %Time of next departure
    nextEventType=2; %Next event type is departure
    EventList(end+1,:)=[nextDepartureTime 0 nextEventType]; %Places departure event in event list
end

end
    