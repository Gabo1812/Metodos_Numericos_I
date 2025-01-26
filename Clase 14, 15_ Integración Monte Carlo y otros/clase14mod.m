%nueva rutina montecarlo
clearvars;
clc;

R = 0.010; % radio en metros
d = 0.0005; %diametro en metros

u_0 = (4*pi)*1e-7;% H / m
k = [0,0,1];
%Coordenadas 
e_r = @(t) [cos(t),sin(t),0];

e_rp = @(tp) [cos(tp),sin(tp),0];

e_tp = @(tp) [-sin(tp),cos(tp),0];

dot(e_rp(pi/4),e_tp(pi/4)); % para hacer producto punto
cross(e_rp(pi/4),e_tp(pi/4)); % Para hacer producto cruz

f = @(r,t,tp) r* ((r* dot( cross(e_tp(tp),e_r(t)), k)) + R) / (r^2 + R^2 - 2*R*r * dot(e_r(t),e_rp(tp)))^(3/2);

V = (R-d)*(2*pi)^2;
N = 1e7;

Fi = zeros(N,1);
fi = 0;
for i = 1:N
    x = (R-d)*rand(1);
    y = (R-d)*rand(1);
    t = 2*pi*rand(1);
    tp = 2*pi*rand(1);
    if sqrt(x^2 + y^2)<= (R-d)
        r = sqrt(x^2 + y^2);
    end
    fi = fi + f(r,t,tp);
    Fi(i) = f(r,t,tp);
end

sf = (1/N)*fi;
I = 4*V*sf; % multiplicado por 4 porque del for solo tenemos un cuarto

L = (u_0 * R)/(4*pi) * I/1e-6; %en microH


%L_simulado = 0.149 microH
%L_Medido = 0.164 microH







