function ThroughPut = slottedAlohaSimulation(prob, sigma, Nusers, Nslots)
%Estados existentes: 0 - inativo ; 1 - ativo ; 2 - espera

vector_Users = zeros(1,Nusers);

numero_sucessos = 0;

for i=1:Nslots
     
    vector_Users=actualizacaoEstados(prob, sigma, vector_Users); % atualizacao de estados, gera-se os pacotes a enviar para as probabilidades dadas para cada utilizador
    
    if numeroColisoes(vector_Users)>1 % Existiram colisoes no envio de pacotes
        
        vector_Users=mudarEstado(vector_Users,1); % Utilizadores que sofreram de colisoes ficam no estado ativo para puderem enviar depois
    
    elseif numeroColisoes(vector_Users)==1 
        
        vector_Users=mudarEstado(vector_Users,0); % Utiliadores que conseguiram depois enviar pacote passam para estado inativo
        numero_sucessos=numero_sucessos+1;
    end
    
end
ThroughPut = numero_sucessos/Nslots;
end


