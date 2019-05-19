%This routine initializes the data structures

function init

global Time;
global EventList;
global Flows;
global numFlows;
global FlowStats;
global Queues;
global numQueues;
global numPacketsInQueues;
global TxLink;
global LinkState;

%Initialization of simulation clock
Time=0;

%Number of priority levels at the link
numFlows=size(Flows,1);
numPriorities=1;
for i=1:numFlows
    if Flows{i}(4)>numPriorities
        numPriorities=Flows{i}(4);
    end
end

%Initialization of link data structures
numQueues=numPriorities; %One queue for each priority level
TxLink=[]; %Transmission link is empty
LinkState=0; %State of transmission link is idle
for i=1:numQueues
    numPacketsInQueues(i)=0; %This queue is empty
    Queues{i}=zeros(0,3); %Initialization of Queues
end

%Initialization of flow data structures
for i=1:numFlows
    FlowStats{i}=[0,0,0]; %Statistics of this flow
    nextEventType=1; %Next event type is arrival
    MeanInterarrival=Flows{i}(2); %Mean interarrival time of this flow
    nextArrivalTime=-(MeanInterarrival)*log(rand()); %Arrival time of next packet of this flow
    EventList(i,:)=[nextArrivalTime i nextEventType]; %Schedules next packet arrival for this flow
end



