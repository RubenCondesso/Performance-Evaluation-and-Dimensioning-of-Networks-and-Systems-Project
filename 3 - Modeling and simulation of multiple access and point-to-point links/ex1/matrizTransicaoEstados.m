function [ f ] = matrizTransicaoEstados( prob, sigma, Nusers )
%
% Performance Slotted ALOHA - Matriz de Transição de Estados

% Matriz de Transicao dos Estados
matrizP= magic(Nusers); % Matriz N por N construída a partir dos inteiros 1 a n^2 com soma de
%colunas e linhas iguais

i=1;
j=1;
while i<=Nusers  % States of Markov Chain = Number of ACTIVE users
   
    if j>Nusers
        i=i+1;
        j=1;
        continue
        
    elseif j <= i-2 % apenas uma transmissão bem-sucedida é possível num intervalo de tempo
        matrizP(i,j)=0;
         
    elseif j==i-1 % exatamente uma transmissão de utilizadores Ativos e não há chegadas de mensagens de utilizadores Inativos
        matrizP(i,j)=(i-1)*(prob)*((1-prob)^(i-2))*((1-sigma)^(Nusers-(i-1)));
         
    elseif j==i % nenhuma mensagem de chegada de utilizadores Inativos e zero ou mais transmissões de utilizadores Ativos 
        % ou exatamente uma transmissão de utilizadores Ativos e exatamente uma mensagem de chegada de utilizadores Inativos
        matrizP(i,j)=((1-sigma)^(Nusers-(i-1)))*(1-(i-1)*(prob)*((1-prob)^(i-2))) + (Nusers-1)*sigma*((1-sigma)^(Nusers-(i-1)-1))*(i-1)*(prob)*((1-prob)^(i-2));
         
    elseif j>i % j-i mensagens de chegada de utilizadores Inativos e zero ou mais transmissões de utilizadores Ativos
        % ou j-i+1 mensagens de chegada de utilizadores Inativos e exatamente uma transimissão de utilizadores Ativos         
        matrizP(i,j)= nchoosek(Nusers-(i-1),(j-1)-(i-1))* (sigma^((j-1)-(i-1)))*((1-sigma)^(Nusers-(j-1)))*(1-(i-1)*(prob)*((1-prob)^(i-2))) + nchoosek(Nusers-(i-1),(j-1)-(i-1)+1)* (sigma^((j-1)-(i-1)+1))*((1-sigma)^(Nusers-(j-1)-1))*(i-1)*(prob)*((1-prob)^(i-2));
         
    end
         
    j=j+1;
end

f=matrizP;


end

