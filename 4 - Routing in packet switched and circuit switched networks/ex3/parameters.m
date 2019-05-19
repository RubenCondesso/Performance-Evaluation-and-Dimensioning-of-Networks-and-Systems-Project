%This is the function where the user defines the simulation scenario

function parameters

global Topology;
global Capacities;
global Flows;
global endTime;

%USER DEFINED PARAMETERS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Define here the network topology. Each link is identified by a unique
%integer
Topology=[0 0 1 0;
          0 0 2 0;
          0 0 0 3;
          0 0 0 0];

%Define here the capacity of each link
Capacities=[32000 64000 64000]; %In bits/sec

%Define here the flows. Each flow has call mean duration, call arrival
%rate, call bandwidth and route
Flows={3,1,32000,[1 3];
       3,1,32000,[1 3];
       3,3,32000,[2 3];};
   
%Define here the simulation end time, function of the maximum mean
%interarrival time
endTime=1000*(0.1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



   



    
    
    
    
    
    
    
    
    
    
    
    
    