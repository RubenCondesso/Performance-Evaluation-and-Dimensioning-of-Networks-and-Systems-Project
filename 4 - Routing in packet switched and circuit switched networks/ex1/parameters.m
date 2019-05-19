%This is the function where the user defines the simulation scenario

function parameters

global LinkCapacities;
global Flows;
global endTime;
global Topology

%USER DEFINED PARAMETERS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Define here the network topology. The number of rows (or columns) is equal
%to the number of nodes. Rows correspond to origin nodes and columns to
%destination nodes. Each link is identified by a unique integer. In the
%example below, link 1 is between node 1 and node 3, link 2 is between node
%2 and node 3 and link 3 is between node 3 and node 4.
Topology=[0 1 0;
          0 0 2;
          0 0 0];      
             
%Define here the capacity of each link
LinkCapacities=[64000 64000 64000]; %In bits/sec

%Define here the flows. Flows is a cell array that stores for each flow the
%mean inter-arrival time (in seconds), the mean packet length (in bits) and
%the route
Flows={1/3.2,1000,[1];
       1/3.2,1000,[2];};
   
%Define here the simulation end time, function of the maximum mean
%interarrival time
endTime=1000*(1/16);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    
    
    
    
    
    
    
    
    
    