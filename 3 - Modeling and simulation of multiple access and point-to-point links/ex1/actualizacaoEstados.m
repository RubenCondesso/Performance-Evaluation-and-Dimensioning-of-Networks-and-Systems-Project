function f = actualizacaoEstados(prob, sigma, users)
%

vector_Users = users; 

tamanho= size(users);

for i=1:tamanho(2)
    
    if users(i)==1 % utilizador est� no estado ativo
        
        if Bernoulli(prob)==1 % utlizador tem pacote para enviar, espera para transmitir no slot seguinte com probabilidade prob
            
            vector_Users(i)=2; % utlizador passa para estado de espera
        end
        
    elseif users(i)==0 % utilizador est� no estado inativo
        
        if Bernoulli(sigma)==1 % utilizador gerou um pacote para enviar com probabilidade sigma
            
            vector_Users(i)=1; % utlizador passa para o estado ativo entao
        end
    end
end

f=vector_Users; %vector dos N utilizadores com a atualiza��o dos estados

end



