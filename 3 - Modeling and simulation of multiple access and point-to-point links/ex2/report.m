%This routine calculates the performance metrics and writes the results

function [delay,throughput] = report

global Time;
global FlowStats;

vector_Delay=[];
vector_Throughput=[];

for i=1:length(FlowStats)
    disp('Average delay in flow');
    disp(i);
    disp(' = ');
    vector_Delay=[FlowStats{i}(2)/FlowStats{i}(1)];
    disp(FlowStats{i}(2)/FlowStats{i}(1));
    
    
    disp('Flow throughput (in bits/s)');
    disp(i);
    disp(' = ');
    vector_Throughput=[(FlowStats{i}(3)/Time)];
    disp(FlowStats{i}(3)/Time);
end

delay=vector_Delay;
throughput=vector_Throughput;
end