function randomNumbers = sequenceRandomNumbers(random, n, m)
% Dado um certo input, os n�meros gerados s�o sempre iguais
% em vez de serem aleat�rios, apesar de um usar o rand()
% logo � um gerador determinista  
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