function [ f ] = ex2( rep,gamma, n )
%
%   

quantil = 1.2816; % quanti para 90% de intervalo de confiança, q=0.1
vector_Delay = []; 

vector_auxiliar=[];
contador=1; % numero total de simulações necessárias

erroRelativo=gamma/(1-gamma); %erro relativo maximo da estimativa calculada

flag=0; %variavel com função de sair do ciclo quando necessario
while (flag==0)
   
    vector_auxiliar=averageDelayQueueEstimationex2(n); %vector o valor media das observações geradas mais o valor teorico
    vector_Delay(contador)= vector_auxiliar(1); % vector com os valores das medias das observaçoes geradas
      
    if contador < rep %não contar com as observaçoes iniciais, descartá-las
        contador = contador +1;
        continue;
    else
        
        media=mean(vector_Delay); % valor da media dos valores presentes no vector
        variancia=var(vector_Delay);% valor da variancia dos valores presentes no vector
    
        k=sqrt(quantil*((variancia^2)/contador));
        
        %ja existem replicas  geradas suficientes, deixa-se de verificar a condicao, ciclo stopped
        if (k/media) <= erroRelativo %presente na pag 23 do pw, terminating simulations
            
            flag=1;
            break;
        else
            contador = contador +1;
            continue;
        end  
    end
end 

valor_teorico=vector_auxiliar(2);

disp('Vector de Atrasos');
disp(vector_Delay);

disp('Valor Teórico');
disp(valor_teorico);

disp('Media Vector Atrasos');
disp(media);

disp('Variancia Vector Atrasos');
disp(variancia);

disp('Estimativa obtida');
disp(contador);

end

