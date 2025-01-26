%clase del 21/5/24
N = 1000;
R = 0.010; % radio en metros
d = 0.0005; %diametro en metros
t = 2*pi()*rand(N,1);
tp = 2*pi()*rand(N,1);
%Coordenadas 
e_r = @(t) [cos(t),sin(t),0];

e_rp = @(tp) [cos(tp),sin(tp),0];

e_tp = @(tp) [-sin(tp),cos(tp),0];

k = [0,0,1];

f  = @(t,tp) ( dot(cross(e_tp(tp),e_r(t)), k) );

a = zeros(N,1);
for i =1:N
    a(i) = f(t(i),tp(i));
end
%mapeamos el producto punto
figure (1)
plot(a,'or');
  
%%%%%%%%%%%%%%%%%%%%

%mapeamos r
r = (R-d)*rand(N,1);
figure (2);
plot(r, 'og')

x = r.*cos(t);
y = r.*sin(t);
%Ahora buscamos normalizar de alguna el r
xx = (R-d)*rand(N,1);
yy = (R-d)*rand(N,1);
%Mapeamos x y y
figure (3)
plot(x,y,'ob')
hold on;
plot(xx,yy,'oc');
hold off;



g = @(t, tp) dot(e_r(t),e_rp(tp));

b = zeros(N,1);
for i =1:N
    b(i) = g(t(i),tp(i));
end
%mapeamos el producto punto
figure (4)
plot(b,'ok');
























