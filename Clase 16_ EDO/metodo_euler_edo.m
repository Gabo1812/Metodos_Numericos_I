%Ecuaciones diferencial clase 16 
%Metodo de Euler
%Definimos la función 
f = @(t,y) y-t^2 +1; % forma y' = y-t^2
N = 100;
a = 0; % rango inferior
h = 2; % rango superior
y = zeros(N+1,1);
t = zeros(N+1,1);
t0 = 0;% para este caso 
t(1) = t0;
y(1) = 1/2; % del problema
%y(1) = y(t0);
for i= 1:N
    ti = a+i*h;
    t(i+1) = ti;
    y(i+1) = y(i)+h*f(ti,y(i));
end
y_exact = @(t) (t+1)^2 - (1/2)*exp(t);
b = zeros(N+1,1);
for i =1:N
    b(i) = y_exact(t(i));
end

figure (1)
plot(t,y,'ob');
title('Calculada por Euler')

figure (2)
plot(t,b,'-r')
title('Exacta')
