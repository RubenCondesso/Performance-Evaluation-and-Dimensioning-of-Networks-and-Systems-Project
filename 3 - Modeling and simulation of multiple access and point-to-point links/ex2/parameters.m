%This is the routine where the user defines the input parameters of the
%simulator

function parameters

global LinkCapacity;
global Flows;
global endTime;

%USER DEFINED PARAMETERS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Capacity of the link, in bits/sec
LinkCapacity=64000;

%Flows is a cell array where each cell corresponds to one flow, and each
%flow is a vector with 4 elements corresponding to (1) source type, (2)
%mean interarrival time (in seconds), (3) the mean packet length (in bits),
%and (4) priority level. There are two types of sources: 1 = Poisson
%arrivals and exponentially distributed sizes; 2 = Poisson arrivals and
%fixed sizes. The levels of priority must be consecutive integers starting
%at 1, where a lower number corresponds to a higher priority.
Flows={[1,1/16,1000,1];
       [1,1/16,1000,1]};
   
%Definition of the simulation end time, function of the maximum mean
%interarrival time
endTime=1000*(1/16);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%