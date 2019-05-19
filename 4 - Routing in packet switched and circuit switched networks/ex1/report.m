%This routine calculates and displays the average packet delay of each
%flow

function array = report

global FlowStats;

array=[];
for i=1:size(FlowStats,1)
    %disp('Average delay in flow');
    %disp(i);
    %disp(' = ');
    %disp(FlowStats(i,2)/FlowStats(i,1));
    array(i)=(FlowStats(i,2)/FlowStats(i,1));
    
end