%Clase del 16/4/24

%Metodo trapezoidal con polinomio de grado 1
%Para integración con metodo trapezoide compuesto 
clearvars;
n = 1000;
a = 1;
b = 10;
h = (b-a)/n;
x = (a:h:b)';
y = log(x);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
plot(x,y,'or');
S0 = y(1);
S = 0;
Sn= y(end);
for i=1:n-1
    xx = a+i*h ;%coordenadas donde se evalua la función
    S = S+y(i+1);
end
Inum = (h/2)*(S0+2*S+Sn);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Iend = (x(end)*log(x(end))-x(end))-(x(1)*log(x(1))-x(1));
%Si no fueran equidistantes hay que hacer una interpolación para hacerlos
%equidistantes 


n = 5;
a = 1;
b = 10;

I = int_trapezoide(a,b,n);

