function [ populationRate ] = poissonArrivals( nOutputs,lambda )
%
% Gera-se para um certo n, processos de chegada de Poisson
% � expect�vel que o rate da popula��o gerada seja aproximadamente igual ao
% valor de lambda dado como input

poissonPopulation(nOutputs) = 0;
tAnterior=0;
 
for i=1:nOutputs
    poissonPopulation(i)= tAnterior - (1/lambda)* log(rand);
    tAnterior = poissonPopulation(i);
  
end

%disp('Popula��o de Poisson');
%disp(poissonPopulation);

disp('Valor de lambda');
disp(lambda);

disp('Sample Rate');
populationRate = nOutputs/max(poissonPopulation);


end

