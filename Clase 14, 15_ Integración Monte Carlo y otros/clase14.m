%clase 14. 14/5/24
clearvars;
%Limites de integración
tol = 0.01;
a = 0;
b = 2;
c = @(x) (1/2)*x.^2; % función anonima con @
d = @(x) x;
xx = (-2:0.01:2)';
yy = (-2:0.01:2)';
yc = c(xx);
yd = d(xx);

z = [-3 5];
nz = length(z);
X1 = xx*ones(1,nz);
Y1 = yc*ones(1,nz);
Z1 = ones(length(X1),1)*z;


Y2 = yd*ones(1,nz);

f = @(x,y) 5-x.^2-y.^2 ;% Función a integrar

[X,Y] = meshgrid(xx,yy);
Z = f(X,Y);
figure(1)
surf(X,Y,Z,'FaceAlpha',0.5,'EdgeColor','none')
hold on;
surf(X1,Y1,Z1,'FaceAlpha',0.5,'EdgeColor','red')
surf(X1,Y2,Z1,'FaceAlpha',0.5,'EdgeColor','blue')
hold off;
xlabel('x');
ylabel('y');
zlabel('z');

Iexact = 206/105; %calculado con maxima nada automatizado
[Int,n,m] = int_doble_simpson_adapt_mod(f,a,b,c,d,tol);

