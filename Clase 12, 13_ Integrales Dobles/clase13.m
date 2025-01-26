%clase 10/5/24
clearvars;
a = 0;
b = 2;
c = 0;
d = 2;
f = @(x,y) 5-(x.^2 + y.^2);

xx = (-2:0.01:2)';
yy = (-2:0.01:2)';
[X,Y] = meshgrid(xx,yy);
Z = f(X,Y);
figure(1);
surf(X,Y,Z, 'FaceAlpha',0.5, 'EdgeColor','none');
xlabel("X");
ylabel("Y");
zlabel("Z");
tol = 0.01;
[Iadapt,n,m] = int_doble_simpson_adapt(f,a,b,c,d,tol);
I = int_doble_simpson(f,a,b,c,d,n,m);
f=@(x,y)-(x*y^3)/3-(x^3*y)/3+5*x*y;
Iexacta = f(b,d)-f(a,c);


