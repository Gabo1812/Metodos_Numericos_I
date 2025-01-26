%Clase del 9/4/24
%Derivación numerica 
% Haciendo aprox de Taylor
%Usando los polinomios de Lagrange
clearvars;
h=1;
x = (1:h:10)';
y = log(x);

%hacerla funcion

dy = zeros(size(x));
dy(1)=(1/2*h)*(-3*y(1)+4*y(2)-y(3));

for i=2:size(x,1)-1
    dy(i) = (1/(2*h))*(-y(i-1)+y(i+1));
end

dy(end) = (1/(2*h))*(y(end-2)-4*y(end-1)+3*y(end));

%aca termina


yy = 1./x;

figure(1)
plot(x,y, 'ob');
hold on;
plot(x,dy, ' or');
plot(x,yy, ' og');
hold off;

%ahora aprox de 5 puntos



