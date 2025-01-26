% Integración por metodo de Monte Carlo
clearvars;
a=0;
b=1;
N = 1e5; %numeros de valores a probar
V = (b-a);
f = @(x) x^2;
x = rand(N,1);
%{
figure (1)
plot(x,'ob')
%} 
Fi = zeros(N,1);
fi = 0;
for i=1:N
    x = (b-a)*rand(1)+a;
    fi = fi + f(x);
    Fi(i) = f(x);
end
sf = (1/N)*fi;
I = V*sf;

df = 0;
for i=1:N
    df = df + (Fi(i)-sf)^2;
end
dI = (V/sqrt(N))*sqrt((1/(N-1)*df)); % el error del Metodo de Monte Carlo

F =@(x) x^3 / 3;
Iexacta = F(b)-F(a);