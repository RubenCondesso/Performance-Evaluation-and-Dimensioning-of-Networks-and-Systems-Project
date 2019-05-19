%This function processes the call arrivals of this flow

function arrivals(thisFlow)

global Time;
global EventList;
global Flows;
global LinksAvailability;
global FlowStats;

thisMeanInterarrival=1/Flows{thisFlow,1}; %Mean call inter-arrival time of this flow
thisMeanCallDuration=Flows{thisFlow,2}; %Mean call duration of this flow
thisCallBandwidth=Flows{thisFlow,3}; %Call bandwidth of this flow
thisFlowRoute=Flows{thisFlow,4}; %Route of this flow
thisNumLinksFlow=length(thisFlowRoute); %Number of links in the route of this flow

FlowStats(thisFlow,1)=FlowStats(thisFlow,1)+1; %Increments number of generated calls

EventList(end+1,:)=[Time+(-thisMeanInterarrival*log(rand)),1,thisFlow]; %Schedules next arrival for this flow

tempLinksAvailability=LinksAvailability; %Temporarily decreases available bandwidth at links of the flow path
for i=1:thisNumLinksFlow 
    LinkFlow=thisFlowRoute(i);
    tempLinksAvailability(LinkFlow)=LinksAvailability(LinkFlow)-thisCallBandwidth;
end

if isempty(find(tempLinksAvailability<0,1)) %If call can be accepted
    LinksAvailability=tempLinksAvailability; %Updates link availability
    EventList(end+1,:)=[Time+(-thisMeanCallDuration*log(rand)),2,thisFlow]; %Schedules departure of this call
else %If call can not be accepted
    FlowStats(thisFlow,2)=FlowStats(thisFlow,2)+1; %Increments number of blocked calls
end