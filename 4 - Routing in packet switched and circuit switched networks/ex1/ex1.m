function [ f ] = ex1(N, ro)
%
%   

media_atraso=0;
aux=0;

for i=1:N
    vector_atraso=pnet();
    aux=vector_atraso(1)+vector_atraso(2);
    media_atraso=(media_atraso+aux);
end

media_atraso=media_atraso/N;
valor_teorico=kleinrockApproximation(ro);

disp('Para ro = ');
disp(ro);
disp('The average packet delay through pnet simulator: ');
disp(media_atraso);
disp('------------------------------');
disp('The average packet delay through the kleinrock approximation: ');
disp(valor_teorico);

end

