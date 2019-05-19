%Simulator of a packet switched point-to-point link, with 2 scheduling
%mechanisms (fifo and strict priority), and 2 source types (both with
%Poisson arrivals but one with exponentially distributed packet sizes and
%the other with fixed packet sizes). It estimates the average packet delay,
%and the throughput of each flow.

function ppl1

clear all;

global Time;
global endTime;

parameters; %Definition of input parameters

init; %Initialization of data structures

%Main program
while Time < endTime
    [nextEvent]=timing; %Next event
    nextFlow=nextEvent(2); %Flow of next event
    nextEventType=nextEvent(3); %Type of next event
    if nextEventType==1 %If next event is an arrival
        arrivals(nextFlow); %Call arrivals routine
    else %If next event is a departure
        departures; %Call departures routine
    end
end

report; %Computes the performance metrics and writes the simulation results
    
    
    
    
    
    
    
    
    
    