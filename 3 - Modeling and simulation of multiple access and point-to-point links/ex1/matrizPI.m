function [ f ] = matrizPI(prob, sigma, Nusers )
%
% Matriz com a Probabilidade PI para cada estado i (N) referente à matriz de
%transição de estados  

% Matriz de Transicao dos Estados
mP = matrizTransicaoEstados(prob,sigma,Nusers);

% N*N matriz com todos elementos iguais a 1
E=ones(Nusers);

% Matriz de identidade N por N com 1's na diagonal principal e zeros no resto da matriz
I=eye(Nusers);

% Matriz probabilidade PI, Limited State Probability
mPI = (ones(1,Nusers))*((mP+E+I)^(-1));

f = mPI;

end

