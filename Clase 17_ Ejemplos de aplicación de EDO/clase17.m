%clase del 28/5/24 METODO DE TAYLOR
clearvars;
ti = 0;
tf = 1;
y0 = 1;
f = @(t,y) (2-2*t*y)/(t^2+1) ;% esto es y', primera derivada
dft = @(t,y) -((2*t*(2-2*t*y))/(t^2+1)^2)-(2*y)/(t^2+1); % derivada respecto a t
dfy = @(t,y) -((2*t)/(t^2+1));% derivada respecto a y
ddf = @(t,y)((6*t^2-2)*y-8*t)/(t^4+2*t^2+1); % dft + dfy*f simplificado
dddf = @(t,y) -(((24*t^3-24*t)*y-36*t^2+12)/(t^6+3*t^4+3*t^2+1));
ddddf = @(t,y) ((120*t^4-240*t^2+24)*y-192*t^3+192*t)/(t^8+4*t^6+6*t^4+4*t^2+1);
%obtenidas mediante maxima 
n = 50;
h = (tf -ti)/n;
t = zeros(n,1);
y = zeros(n,1);
t(1) = ti;
y(1) = y0;
for i=1:n
    t(1+i) = ti + h*i;
    y(i+1) = y(i)+h*f(t(i),y(i))+(h^2)/2;
end
yf = @(t) (2*t+1)./((t.^2)+1);
figure(1)
plot(t,y,'or');
hold on;
plot(t,yf(t),'-b');
hold off;