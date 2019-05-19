function [ f ] =  theoreticalThroughput( prob, sigma, Nusers )
%
% Performance Slotted ALOHA - Theoretical Throughput value

% Probabilidade estacionária para cada estado i (N) referente à matriz de
%transição de estados
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

