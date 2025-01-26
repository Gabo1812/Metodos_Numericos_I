% Int doble por Monte Carlo 
clearvars;
a=0;
b=1;
c= 0;
d = 1;
N = 1e5; %numeros de valores a probar
V = (b-a)*(d-c);%área de integración
f = @(x,y) x.^2 + y.^2; % función a integrar
x = rand(N,1);
y = rand(N,1);
Fi = zeros(N,1);
fi = 0;
for i=1:N
    x = (b-a)*rand(1)+a;
    y = (d-c)*rand(1)+c;
    fi = fi + f(x,y);
    Fi(i) = f(x,y);
end
sf = (1/N)*fi;
Int = V*sf;
F = @(x,y) (y*x^3)/3 +(x*y^3)/3;
Iexacta = F(b,d)-F(a,c);