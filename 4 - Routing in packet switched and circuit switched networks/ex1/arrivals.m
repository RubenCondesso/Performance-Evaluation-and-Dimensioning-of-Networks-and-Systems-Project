%This routine processes the generation of new packets at flows

function arrivals(thisFlow)

global Time;
global EventList;
global Flows;
global Queues;
global LinkCapacities;

thisMeanInterarrival=Flows{thisFlow,1}; %Reads mean inter-arrival of this flow
thisMeanPacketLength=Flows{thisFlow,2}; %Reads mean packet lenght of this flow
thisRoute=Flows{thisFlow,3}; %Reads route of this flow

EventList(end+1,:)=[Time+(-thisMeanInterarrival*log(rand)),1,thisFlow]; %Schedules next arrival at this flow

thisLength=-thisMeanPacketLength*log(rand); %Generates the length of this packet

firstLink=thisRoute(1); %Determines first link in flow route

if isempty(Queues{firstLink}) %If first link is empty
    firstLinkCapacity=LinkCapacities(firstLink); %Determines the capacity of first link
    EventList(end+1,:)=[Time+thisLength/firstLinkCapacity,2,firstLink]; %Schedules departure of this packet at first link
end

thisPacket=[thisFlow Time thisLength]; %Builds this packet with flow number, arrival time and length

Queues{firstLink}(end+1,:)=thisPacket; %Stores this packet in queue of first link

        
    
    