function [ f ] =  theoreticalThroughput( prob, sigma, Nusers )
%
% Performance Slotted ALOHA - Theoretical Throughput value

% Probabilidade estacion�ria para cada estado i (N) referente � matriz de
%transi��o de estados
PI= matrizPI(prob, sigma, Nusers);

S=0; % Mean Throughput

% Contador
i=1;
while i<=Nusers
    S = S + PI(1,i)*conditionalThroughput(prob,i);
    i=i+1;
end

f=S;

end

