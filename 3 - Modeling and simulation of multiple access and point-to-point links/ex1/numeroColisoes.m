function f = numeroColisoes(users)
%

vector_Users=users; % Vector de utilizadores

contador_esperaUsers = 0;

tamanho=size(users);

i=1; % Variavel auxiliar
while i<tamanho(2) && contador_esperaUsers<2
    
    if vector_Users(i)==2 % utilizador está no estado de espera para enviar pacote, aumenta o número de utilizadores à espera

        contador_esperaUsers = contador_esperaUsers + 1;
    end
    i=i+1;
end
    
f = contador_esperaUsers; %número de utilizadores à espera para enviarem respetivos pacotes
end

