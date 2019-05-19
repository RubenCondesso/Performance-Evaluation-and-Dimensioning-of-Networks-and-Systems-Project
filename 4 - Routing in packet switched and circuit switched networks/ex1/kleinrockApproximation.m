function f = kleinrockApproximation(ro)
%
%   
C1=64000;      %velocidade de  ligacao do link1
C2=64000;      %velocidade de ligacao link2
Lp= 1000;      %tamanho medio de cada pacote

u= C1/Lp;
lambda= ro*u;

kleinrockAvgDellay=(1/(C1/Lp -lambda))+(1/(C2/Lp-lambda));

disp('For lambda = ');
disp(lambda);
disp('Kleinrock Average Dellay');
disp(kleinrockAvgDellay);

f=kleinrockAvgDellay;

end
