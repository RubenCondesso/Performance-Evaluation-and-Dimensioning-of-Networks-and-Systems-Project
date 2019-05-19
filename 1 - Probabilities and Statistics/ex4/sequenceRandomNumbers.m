function randomNumbers = sequenceRandomNumbers(random, n, m)
% Dado um certo input, os números gerados são sempre iguais
% em vez de serem aleatórios, apesar de um usar o rand()
% logo é um gerador determinista  
randomNumbers=0;

if randomNumbers==1
    disp(rand(n,m));
    disp(rand(n,m));
    disp(rand(n,m));
else
    rng(random);
    disp(rand(n,m));

    rng(random)
    disp(rand(n,m));
    
    rng(random);
    disp(rand(n,m));

end


end