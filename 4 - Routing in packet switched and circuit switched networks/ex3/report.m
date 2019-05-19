%This function estimates the performance metrics of interest

function array = report

global FlowStats;
global numFlows;

array=[];
%Calculates the blocking probabilities
for i=1:numFlows
   % disp('Blocking probability of flow');disp(i);disp(' = ');
    % disp(FlowStats(i,2)/FlowStats(i,1));
    array(i)=(FlowStats(i,2)/FlowStats(i,1));
    
end