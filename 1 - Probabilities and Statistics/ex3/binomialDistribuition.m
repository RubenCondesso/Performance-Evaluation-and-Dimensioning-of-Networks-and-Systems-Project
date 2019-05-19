function [ f ] = binomialDistribuition(probabilidade,nTrials)

% Soma de n vari�veis de bernoulli aleat�rias

c=0;
for s = 1:nTrials
        c = c + bernoulliCode(probabilidade);
end
f=c;
end

