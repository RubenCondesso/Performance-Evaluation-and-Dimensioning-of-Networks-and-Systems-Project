%This program simulates a circuit-switched network with fixed routing to
%estimate the blocking probability of each call flow

function array = cnet

clear all;

global Time;
global endTime;

parameters; %Definition of input parameters

init; %Initialization of data structures

%Main program
while Time < endTime
    [nextEvent]=timing; %Next event to be processed
    nextEventType=nextEvent(2); %Type of next event
    nextFlow=nextEvent(3); %Flow of next event
    if nextEventType==1 %Next event is an arrival
        arrivals(nextFlow);
    elseif nextEventType==2 %Next event is a departure
        departures(nextFlow);
    end
end

array = report; %Calculate performance metrics
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    