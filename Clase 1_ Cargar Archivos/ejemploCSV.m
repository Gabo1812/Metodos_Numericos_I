a = 25;
clearvars;
%Para archivos CSV

filename = "two_signals.csv";
A = readmatrix(filename);
n = A(:,1);
dt = 2.0e-9;
%Valor del tiempo discreto en segundos
t = n*dt;
V_C1 = A(:,2);
V_C2 = A(:,3);


%Ahora vamos a graficar, este codigo tambien interpreta LaTeX
figure(1);
plot(t,V_C1);
xlabel("Tiempo (s)");
ylabel("Voltaje (V)");


figure(2);
plot(t,V_C2);
xlabel("Tiempo (s)");
ylabel("Voltaje (V)");

% Parqa cambiar de color  se hace poniendo ' color '
figure(3)
plot(t,V_C1, 'g');
hold on;
plot(t,V_C2);
hold off;




