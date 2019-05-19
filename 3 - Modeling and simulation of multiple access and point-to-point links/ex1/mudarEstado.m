function f = mudarEstado(users, estado)

vector_Users=users; 

tamanho=size(users);

for i=1:tamanho(2)
    
    if estado==1 % estado ativo
        
        if vector_Users(i)==2 % Estava a espera de enviar pacote, houve colisão neste caso porque esta no estado ativo
            
            vector_Users(i)=1; % Continua a espera de puder enviar pacote quando for possivel, fica no estado ativo
        end
        
    else % estado inativo
        
        if vector_Users(i)==2 % Estava a espera de enviar pacote
            
            vector_Users(i)=0; % Pacote enviado com sucesso
        end
    end
end

f=vector_Users;  %vector dos N utilizadores com a mudança dos estados

end

