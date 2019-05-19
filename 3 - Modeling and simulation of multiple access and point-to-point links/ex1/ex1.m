function [ f] = ex1( prob, sigma, Nusers, Nslots )
%
%   

resultado_pratico=slottedAlohaSimulation(prob,sigma,Nusers,Nslots);
resultado_teorico=theoreticalThroughput(prob,sigma,Nusers);

disp('Theoretical throughput value');
disp(resultado_teorico);

disp('Resultado obtido atrav�s da simula��o');
disp(resultado_pratico);

end

