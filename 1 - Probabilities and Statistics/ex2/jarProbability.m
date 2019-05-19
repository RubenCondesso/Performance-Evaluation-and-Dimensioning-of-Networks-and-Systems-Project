
%Dado os dados do problema, qual � a probabilidade se sair uma bola azul no
%jarro2, sendo que antes se tirou uma bola do jarro1 e se p�s no jarro2
%� comparado o valor te�rico com o valor pr�tico

jar1=[1,1,1,1,2,2]; % 1=Bola Azul 2=Bola Amarela
jar2=[1,1,1,2,2,2,2,2]; % 1=Bola Azul 2=Bola Amarela
jar_novo = [];
n=1000;
count=0;
for i=1:n
    perm_jar1=randperm(6);
    draw_jar1=perm_jar1(1:1);
    
    jar_novo= [jar2,jar1(draw_jar1)];
    
    perm_jar2=randperm(9);
    draw_jar2=perm_jar2(1:1);
    
    bola=jar_novo(draw_jar2);
 
    if bola==1
        count = count +1;
    end
end

disp('Valor Pr�tico');
disp(count/n);

disp('Valor Te�rico');
disp((3/9)*(2/6)+(4/9)*(4/6));