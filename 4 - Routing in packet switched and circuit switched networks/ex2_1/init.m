%This function initializes the data structures

function init

global Time;
global EventList;
global Queues;
global Flows;
global FlowStats;
global numLinks;
global numFlows;
global Topology;


numLinks=max(max(Topology)); %Number of links

numFlows=size(Flows,1); %Number of flows

%Initializes the simulation clock
Time=0;

%Initializes queues
for i=1:numLinks
    Queues{i}=zeros(0,3);
end

%Initializes the statistical counter of each flow
FlowStats=zeros(numFlows,2);

%Schedules first arrival of each flow
for i=1:numFlows
    thisMeanInterarrival=Flows{i,1};
    EventList(i,:)=[-thisMeanInterarrival*log(rand),1,i];
end
    
    
    
    
    
    