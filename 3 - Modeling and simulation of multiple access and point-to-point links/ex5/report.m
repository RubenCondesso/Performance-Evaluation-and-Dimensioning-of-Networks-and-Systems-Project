%This routine calculates the performance metrics and writes the results

function report

global Time;
global FlowStats;

for i=1:length(FlowStats)
    disp('Average delay in flow');
    disp(i);
    disp(' = ');
    disp(FlowStats{i}(2)/FlowStats{i}(1));
    disp('Flow throughput (in bits/s)');
    disp(i);
    disp(' = ');
    disp(FlowStats{i}(3)/Time);
end