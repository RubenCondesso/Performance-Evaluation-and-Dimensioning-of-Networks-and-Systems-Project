function [ f ] = experiments( type)
%
% Dado um tipo de distribuição, entre as três possíveis, é estimado a cobertura 
% para os vários n's, dado 500 simulações

c5=0;
c10=0;
c20=0;
c40=0;

%para uma cobertura de 90% do intervalo de confiança para os vários n's
vector_quantis=[2.132,1.833,1.729,1.697];

%verificar que tipo de distribuição deu entrada na função
if strcmp('Normal',type)
    media=0; 
elseif strcmp('LogNormal',type)
    media=exp(1/2);
elseif strcmp('HyperExp',type)
    media=0.5050;
end    

%Para n=5,n=10;n=20;n=40, fazer as 500 experiências
for i=1:500
    if strcmp('Normal',type)
        vector5=distribuicaoNormal(5);
        vector10=distribuicaoNormal(10);
        vector20=distribuicaoNormal(20);
        vector40=distribuicaoNormal(40);
        
    elseif strcmp('LogNormal',type)
        vector5=distribuicaoLogNormal(5);
        vector10=distribuicaoLogNormal(10);
        vector20=distribuicaoLogNormal(20);
        vector40=distribuicaoLogNormal(40);
        
    elseif strcmp('HyperExp',type)
        vector5=distribuicaoHyperExp(5);
        vector10=distribuicaoHyperExp(10);
        vector20=distribuicaoHyperExp(20);
        vector40=distribuicaoHyperExp(40);
        
    end
    
    x5=sqrt(vector5(2)/5)*vector_quantis(1);
    x10=sqrt(vector5(2)/10)*vector_quantis(2);
    x20=sqrt(vector5(2)/20)*vector_quantis(3);
    x40=sqrt(vector5(2)/40)*vector_quantis(4);
      
    %verificar se está dentro do intervalo de confiança
    if (vector5(1)-x5<media && media<vector5(1)+x5)
        c5=c5+1;
    end
    if (vector10(1)-x10<media && media<vector10(1)+x10)
        c10=c10+1; 
    end
    if (vector20(1)-x20<media && media<vector20(1)+x20)
        c20=c20+1;
    end
    if (vector40(1)-x40<media && media<vector40(1)+x40)
        c40=c40+1;   
    end
end


disp('Vector final com intervalos de confiança para n amostras');
disp('     N=5;      N=10;        N=20;     N=40');

f=[c5/500,c10/500,c20/500,c40/500];

disp(f);
end


