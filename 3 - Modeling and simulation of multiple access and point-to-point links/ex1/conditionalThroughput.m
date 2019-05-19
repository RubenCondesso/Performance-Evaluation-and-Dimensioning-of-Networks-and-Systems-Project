function [ Si ] = conditionalThroughput( prob, i)
%
% Performance Slotted ALOHA - Conditional Throughtput S(i)  

Si = i*(prob)*((1-prob)^(i-1));

end

