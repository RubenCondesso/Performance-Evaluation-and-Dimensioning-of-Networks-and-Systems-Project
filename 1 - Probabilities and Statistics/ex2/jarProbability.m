
%Dado os dados do problema, qual é a probabilidade se sair uma bola azul no
%jarro2, sendo que antes se tirou uma bola do jarro1 e se pôs no jarro2
%É comparado o valor teórico com o valor prático

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

disp('Valor Prático');
disp(count/n);

disp('Valor Teórico');
disp((3/9)*(2/6)+(4/9)*(4/6));