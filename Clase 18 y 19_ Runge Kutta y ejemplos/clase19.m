%Clase 18/6/2024 
%Modelo de electron en campo magnetico uniforme
% Un sistema con un espejo magnetico 
clearvars;

paso = 8e-3;
x = (-0.05:paso:0.05);
y = (-0.05:paso:0.05);
z = (-0.05:paso:0.05);
[X,Y,Z] = meshgrid(x,y,z);
B0 = 4; %magnintud en Teslas
%Bx = zeros(size(X));
Bx = -B0.*(tanh(200*(Z-0.02)) - tanh(200*(Z+0.02)) +2).*(tanh(200*(X-0.02)) + tanh(200*(X+0.02)) +2);
%By = zeros(size(Y));
By = -B0.*(tanh(200*(Z-0.02)) - tanh(200*(Z+0.02)) +2).*(tanh(200*(Y-0.02)) + tanh(200*(Y+0.02)) +2);
%Bz = zeros(size(Z));
Bz = B0*(tanh(200*(Z-0.02)) - tanh(200*(Z+0.02)) + 2.5).*ones(size(Z));


figure(1);
quiver3(X,Y,Z,Bx,By,Bz)
xlabel('X')
ylabel('Y')
zlabel('Z')



%Constantes a utilizar:
e = 1.60217662e-19; %C
m = 9.10938356e-27; %Kg
epsilon_0 = 8.8541878128e-12; %C^2/(N*m^2)

%Posición inicial
r0 = [0,0,0];
%Velocidad inicial
E = 70; %campo
k = E*e;
n=-1;
q = n*e;
V = sqrt((2*k)/m);
V0 = V*[1,1,0.1]/sqrt(2+(0.1)^2);
N = 1e6;
v = zeros(N,3);
t = zeros(N,1);
r = zeros(N,3);
h = 1e-11;
v(1,:) = V0;
r(1,:) = r0; 

for i=1:N-1
    B = [-B0.*(tanh(200*(r(i,3)-0.02)) - tanh(200*(r(i,3)+0.02)) +2).*(tanh(200*(r(i,1)-0.02)) + tanh(200*(r(i,1)+0.02)) +2),...
         -B0.*(tanh(200*(r(i,3)-0.02)) - tanh(200*(r(i,3)+0.02)) +2).*(tanh(200*(r(i,2)-0.02)) + tanh(200*(r(i,2)+0.02)) +2),...
          B0*(tanh(200*(r(i,3)-0.02)) - tanh(200*(r(i,3)+0.02)) + 2.5)];
    k1 = h*(q/m)*cross(v(i,:),B);
    k2 = h*(q/m)*cross(v(i,:)+k1/2,B);
    k3 = h*(q/m)*cross(v(i,:)+k2/2,B);
    k4 = h*(q/m)*cross(v(i,:)+k3,B);
    v(i+1,:) = v(i,:)+(1/6)*(k1+2*k2+2*k3+k4);
    
    k1 = h*v(i+1,:);
    k2 = h*v(i+1,:);
    k3 = h*v(i+1,:);
    k4 = h*v(i+1,:);
    r(i+1,:) = r(i,:)+(1/6)*(k1+2*k2+2*k3+k4);
    t(i) = i*h;
end

figure(2);
clf(2);
plot3(r0(1),r0(2),r0(3),'o','Color','g','MarkerFaceColor','k');
hold on;
plot3(r(:,1),r(:,2),r(:,3),'-','Color','k');
hold off;
grid on;
xlabel('x(m)');
ylabel('y(m)');
zlabel('z(m)');
text(0,0,0,'\leftarrow t = 0');
text(r(end,1),r(end,2),r(end,3),['\leftarrow t = ',num2str(t(end-1))]);


