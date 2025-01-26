%Area de un circulo
clearvars;
R = 1;
Theta = 2*pi();
N = 10000;
r = R^2*rand(N,1);
theta = Theta*rand(N,1);
figure (1)
plot(r,'or')

figure (2)
plot (theta, 'ob')

x = sqrt(r).*cos(theta);
y = sqrt(r).*sin(theta);
figure (3)
plot(x,y,'og')