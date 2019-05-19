
%Probabilidade de calhar duas caras quando se lan�a uma moeda (justa) 5
%vezes, e repete-se o processo n vezes para chegar a um valor mais robusto
%No fim, faz-se uma compara��o entre o valor te�rico e pr�tico

p=0.5;
n=1000;
count=0;
for i=1:n
    heads=0;
    for j=1:5
        u=rand;
        if u<=p
            heads=heads+1;
        end
    end    
    if heads==2
        count=count+1;
    end
end
%Valor Pr�tico
disp('Valor Pr�tico');
disp(count/n);

disp('Valor Te�rico');
disp((nchoosek(5,2)*(0.5)^2)*(0.5)^3);
    