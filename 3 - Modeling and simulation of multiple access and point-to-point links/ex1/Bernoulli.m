function [f] = Bernoulli(p)
% funcao bernoulli - retorna 1 com probabilidade p
if(rand < p)
    f = 1;
else
    f= 0;
end
end

