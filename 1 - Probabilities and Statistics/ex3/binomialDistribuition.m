function [ f ] = binomialDistribuition(probabilidade,nTrials)

% Soma de n variáveis de bernoulli aleatórias

c=0;
for s = 1:nTrials
        c = c + bernoulliCode(probabilidade);
end
f=c;
end

