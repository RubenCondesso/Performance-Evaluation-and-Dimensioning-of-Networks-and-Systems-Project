%This function initializes the data structures

function init

global Time;
global Flows;
global FlowStats;
global LinksAvailability;
global Capacities;
global numFlows;
global numLinks;
global Topology;
global EventList;

numLinks=max(max(Topology)); %Number of links

numFlows=size(Flows,1); %Number of flows

Time=0; %Initializes the clock

%Initializes the statistical counter of each flow
FlowStats=zeros(numFlows,2);

%Schedules the first arrival of each flow
for i=1:numFlows
    thisMeanInterarrival=1/Flows{i,1};
    EventList(i,:)=[-thisMeanInterarrival*log(rand),1,i]; 
end

%Initializes link availability
for i=1:numLinks
    LinksAvailability(i)=Capacities(i); 
end
    
    
    
    
    
    
    
    