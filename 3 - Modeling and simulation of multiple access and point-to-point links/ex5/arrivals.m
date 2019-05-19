%This routine processes the arrivals of packets from a flow. The routine
%generates a packet, enques it and calls the packet scheduler. Packets have
%atributes flow number, arrival time and length. The routine also schedules
%the next packet arrival of this flow.
 
function arrivals(thisFlow)
 
global Time;
global EventList;
global Flows;
global Queues;
global numPacketsInQueues;
global LinkState;
 
%Generates this packet
SourceType=Flows{thisFlow}(1); %Source type of this flow
if SourceType==1 %If source type is 1 
     thisLength=-(Flows{thisFlow}(3))*log(rand()); %Packet size is exponentially distributed
else %If source type is 2 
    thisLength=Flows{thisFlow}(3); %Packet size is fixed
end
thisPacket=[thisFlow Time thisLength]; %Builds this packet
 
%Schedules next arrival of this flow
nextInterarrival=-(Flows{thisFlow}(2))*log(rand()); %Interarrival for next packet
nextArrivalTime=Time+nextInterarrival; %Time of next arrival
nextEventType=1; %Next event type is arrival
EventList(end+1,:)=[nextArrivalTime thisFlow nextEventType]; %Places arrival event in event list
 
%Enques this packet
thisPriority=Flows{thisFlow}(4);
Queues{thisPriority}(end+1,:)=thisPacket;
numPacketsInQueues(thisPriority)=numPacketsInQueues(thisPriority)+1;
 
%Calls packet scheduler if link is idle
if LinkState==0
    pq;
end

 
