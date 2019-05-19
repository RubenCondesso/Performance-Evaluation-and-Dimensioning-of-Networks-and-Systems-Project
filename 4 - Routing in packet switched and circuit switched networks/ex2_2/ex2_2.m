function [ f ] = ex2_2(N)

media_atrasoTotal=0;
media_atrasoFlow1=0;
media_atrasoFlow2=0;
media_atrasoFlow3=0;
media_atrasoFlow4=0;
media_atrasoFlow5=0;
media_atrasoFlow6=0;

lambda1=215;
lambda2=64;
lambda3=128;
lambda4=171.5;
lambda5=171.5;
lambda6=43.4;

lambdaTotal=lambda1+lambda2+lambda3+lambda4+lambda5+lambda6;

auxTotal=0;
for i=1:N
    vector_atraso=pnet();
        
    media_atrasoFlow1=media_atrasoFlow1+vector_atraso(1);
    media_atrasoFlow2=media_atrasoFlow2+vector_atraso(2);
    media_atrasoFlow3=media_atrasoFlow3+vector_atraso(3);
    media_atrasoFlow4=media_atrasoFlow4+vector_atraso(4);
    media_atrasoFlow5=media_atrasoFlow4+vector_atraso(5);
    media_atrasoFlow6=media_atrasoFlow4+vector_atraso(6);
    
end

media_atrasoFlow1=media_atrasoFlow1/N;
media_atrasoFlow2=media_atrasoFlow2/N;
media_atrasoFlow3=media_atrasoFlow3/N;
media_atrasoFlow4=media_atrasoFlow4/N;
media_atrasoFlow5=media_atrasoFlow5/N;
media_atrasoFlow6=media_atrasoFlow6/N;

media_atrasoTotal=(media_atrasoFlow1+media_atrasoFlow2+media_atrasoFlow3+media_atrasoFlow4+media_atrasoFlow5+media_atrasoFlow6)/6;

disp('The average packet delay of flow1 through pnet simulator: ');
disp(media_atrasoFlow1);

disp('The average packet delay of flow2 through pnet simulator: ');
disp(media_atrasoFlow2);

disp('The average packet delay of flow3 through pnet simulator: ');
disp(media_atrasoFlow3);

disp('The average packet delay of flow4 through pnet simulator: ');
disp(media_atrasoFlow4);

disp('The average packet delay of flow5 through pnet simulator: ');
disp(media_atrasoFlow5);

disp('The average packet delay of flow6 through pnet simulator: ');
disp(media_atrasoFlow6);

disp('The average packet delay of the network through pnet simulator: ');
disp(media_atrasoTotal);

end

