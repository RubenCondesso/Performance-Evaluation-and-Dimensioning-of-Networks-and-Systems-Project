function [ f ] = ex3(N)
  
media_blockFlow1=0;
media_blockFlow2=0;
media_blockFlow3=0;


for i=1:N
    vector_atraso=cnet();
        
    media_blockFlow1=media_blockFlow1+vector_atraso(1);
    media_blockFlow2=media_blockFlow2+vector_atraso(2);
    media_blockFlow3=media_blockFlow3+vector_atraso(3);
    
end

media_blockFlow1=media_blockFlow1/N;
media_blockFlow2=media_blockFlow2/N;
media_blockFlow3=media_blockFlow3/N;

disp('The blocking probability of flow1 through cnet simulator: ');
disp(media_blockFlow1);

disp('The blocking probability of flow2 through cnet simulator: ');
disp(media_blockFlow2);

disp('The blocking probability of flow3 through cnet simulator: ');
disp(media_blockFlow3);

end

