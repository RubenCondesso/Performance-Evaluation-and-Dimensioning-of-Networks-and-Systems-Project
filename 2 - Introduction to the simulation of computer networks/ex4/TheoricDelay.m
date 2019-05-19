function [ f ] = TheoricDelay( lambda, miu, m )
%
% Função que devolve o valor teórico para o atraso num sistema 
% M/M/2 queue

p = lambda/(miu* m);

auxiliar=0;

for n=0:(m-1)
   auxiliar = auxiliar +((m*p)^n)/(factorial(n))+ ((m*p)^m)/((factorial(m))*(1-p));
end
pQ = ((m*p)^m)/( factorial(m)* (1-p)* auxiliar);
 
f = pQ * p / (lambda*(1-p));

end

