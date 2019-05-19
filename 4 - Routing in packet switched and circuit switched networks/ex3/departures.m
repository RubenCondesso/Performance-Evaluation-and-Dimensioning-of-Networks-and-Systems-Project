%This function processes the call departures of this flow

function departures(thisFlow)

global Flows;
global LinksAvailability;

thisCallBandwidth=Flows{thisFlow,3}; %Call bandwidth of this flow
thisFlowRoute=Flows{thisFlow,4}; %Route of this flow
thisNumLinksFlow=length(thisFlowRoute); %Number of links in the path of this flow

for i=1:thisNumLinksFlow %Updates link availability
    LinkFlow=thisFlowRoute(i);
    LinksAvailability(LinkFlow)=LinksAvailability(LinkFlow)+thisCallBandwidth;
end