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

%Selects highest priority queue with enqueued packets
thisQueue=0;
for i=1:numQueues
    if isempty(Queues{i})
        %do nothing
    else
        thisQueue=i;
        break;
    end
end

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
        
    
    