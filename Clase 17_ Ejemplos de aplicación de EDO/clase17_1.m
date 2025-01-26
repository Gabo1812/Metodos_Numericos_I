%Segundo ejemplo de la clase
clearvars;
m = 6.64e-27; %Kg
ma = 1.6605e-27;%Kg
e = 1.602e-19;%C
q = e;
B_0 = 0.1;%tesla
V1 = 1000; %V
V2 = 0; %V
d = 0.020; %metros o 2 cm
E_0 = (V1-V2)/d ; %campo entre placas
E = [E_0,0,0];
B = [0,0,B_0];
F =@(v,E,B,m) q*(E + cross(v,B));
a =@(v,E,B,m) (q/m)*(E + cross(v,B));
%%%%%%%%%%%%%%%%%%%
v0 = [0,0,0];
r0 = [0,0,0];
ti = 0;
tf = 25e-6;
N = 10000;
h = (tf-ti)/N;
mm = ma*[1,2,3,4,5,6,7];
colors = ['r', 'b', 'g', 'c', 'm']; % Lista de colores
figure(555)
hold on;
for j=1:size(mm,2)
    r = zeros(N,3);
    t = zeros(N,1);
    v = zeros(N,3);
    r(1,:) = r0;
    v(1,:) = v0;
    t(1) = ti;
    
    for i = 1:N
        t(i+1)= ti + i*h;
        if r(i,1) <= d
            B=[0,0,0];
            E = [E_0, 0,0];
        else
            B = [0,0,B_0];
            E = [E_0,0,0];
        end
        v(i+1,:) = v(i,:) + h*a(v(i,:),E,B,mm(j)); 
        r(i+1,:) = r(i,:) + h*v(i,:);
        if v(i,1)<0 && r(i,1)<=d
            break;
        end
    end
    color_index = mod(j, length(colors)) + 1; % Índice de color para esta iteración
    plot(r(:, 1), r(:, 2), '.', 'Color', colors(color_index))
end
hold off;
%%%%%%%%%%%%%%
figure(1)
plot(t,v(:,1),'.b') 
hold on;
plot(t,v(:,2),'.r')
hold off;
xlabel('tiempo [s]')
ylabel('velocidad [m/s]')
legend('vx(t)','vy(t)')
title('Velocidad vs tiempo')

figure(2)
plot(t,r(:,1),'.b') 
hold on;
plot(t,r(:,2),'.r')
hold off;
xlabel('tiempo [s]')
ylabel('distancia r [m] ')
legend('x(t) ','y(t)')
title('Posición vs tiempo')

figure(3)
plot(r(:,1),r(:,2), '.r', 'LineWidth', 1.5)
xlabel('x [m]')
ylabel('y [m]')
title('x vs y')