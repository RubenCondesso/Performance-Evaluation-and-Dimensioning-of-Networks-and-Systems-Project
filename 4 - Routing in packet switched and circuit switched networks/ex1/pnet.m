%This is a simulator for packet switched networks with fixed routing, flows
%with Poisson arrivals and exponentially distributed lengths.

function array = pnet

clear all;

global Time;
global endTime;

parameters; %Defines of input parameters

init; %Initializes data structures

%Main program

while Time < endTime
    [nextEvent]=timing; %Advances simulation clock and returns next event
    nextEventType=nextEvent(2); %Type of next event
    nextResourceNumber=nextEvent(3); %Resource number of next event
    if nextEventType==1 %If next event is an arrival at flow
        arrivals(nextResourceNumber); %Call arrival routine at specific flow 
    elseif nextEventType==2 %If next event is a departure from a link
        departures(nextResourceNumber); %Call departure routine at specific link
    end
end

array = report; %Calculates and displays performance metrics

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    