%This routine processes the departures of packets from links

function departures(thisLink)

global Time;
global EventList;
global Queues;
global Flows;
global FlowStats;
global LinkCapacities;

thisPacket=Queues{thisLink}(1,:); %Reads this packet
thisFlow=thisPacket(1); %Reads flow of this packet
thisRoute=Flows{thisFlow,3}; %Reads route of this flow

%Processes departure of this packet from this link
lastLink=thisRoute(end); %Determines the last link in the route of this flow
if thisLink==lastLink %If  departure is from last link
    thisArrivalTime=thisPacket(2); %Reads arrival time of this packet
    PacketDelay=Time-thisArrivalTime; %Calculates packet delay
    FlowStats(thisFlow,1)=FlowStats(thisFlow,1)+1; %Increments number of packets that departed from this flow
    FlowStats(thisFlow,2)=FlowStats(thisFlow,2)+PacketDelay; %Adds delay of this packet to delay of this flow
else %If departure is not from last link
    nextLink=thisRoute(find(thisRoute==thisLink)+1); %Determines next link in the route of this flow
    if isempty(Queues{nextLink}) %If next link is empty
        thisLength=thisPacket(3); %Reads length of this packet
        nextLinkCapacity=LinkCapacities(nextLink); %Reads capacity of next link
        EventList(end+1,:)=[Time+thisLength/nextLinkCapacity,2,nextLink]; %Schedules departure of this packet at next link
    end
    Queues{nextLink}(end+1,:)=thisPacket; %Stores this packet in queue of next link
end
Queues{thisLink}(1,:)=[]; %Removes this packet from this link

%Processes next packet of this link
if isempty(Queues{thisLink}) %If this link has become empty
    %Do nothing
else %if this link is not empty
    nextPacket=Queues{thisLink}(1,:); %Reads next packet of this link
    nextLength=nextPacket(3); %Reads length of next packet
    thisLinkCapacity=LinkCapacities(thisLink); %Reads capacity of this link
    EventList(end+1,:)=[Time+nextLength/thisLinkCapacity,2,thisLink]; %Schedules departure of next packet at this link
end

        
    
    