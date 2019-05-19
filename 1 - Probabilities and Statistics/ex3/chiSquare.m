function [ c ] = chiSquare(nTrials,sucessos,probabilidade)

%Usando a fórmula do teste do chi-quadrado vai-se testar se o gerador está
%correcto, entre o valor prático e teórico
 
vectorPratico(sucessos+1)=0;
for i=1:nTrials
    v=binomialDistribuition(probabilidade,sucessos);
    vectorPratico(v+1)=vectorPratico(v+1)+1;
end

total=0;
vectorTeorico(sucessos+1)=0;
for i=1:sucessos
     vectorTeorico(i)=nTrials*binomialDistribuitionTeorico(i , sucessos, probabilidade);
     total = total + ((vectorPratico(i) - vectorTeorico(i))^2)/vectorTeorico(i);
end


disp('VETOR PRATICO');
disp(vectorPratico);

disp('VETOR TEORICO');
disp(vectorTeorico);

c=total;

end

