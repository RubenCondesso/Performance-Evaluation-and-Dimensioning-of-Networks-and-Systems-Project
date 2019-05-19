function [ t ] = binomialDistribuitionTeorico(sucessos,nTrials,probabilidade)

%Valor Te�rico da distribui��o Binomial dado um certo input

coefficient = factorial(nTrials)/(factorial(sucessos) * factorial(nTrials - sucessos));
t = coefficient* ((probabilidade)^ sucessos ) * ((1-probabilidade)^(nTrials-sucessos));

end

