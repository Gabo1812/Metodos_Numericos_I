%Para archivos txt

filename = "electric_potential.txt";
A = importdata(filename,' ',9);
% lo que hace este codigo, el ' ' es el delimitador y el 9 me dice que empiezo en la fila 9
x = A.data(:,1);
y = A.data(:,2);
V = A.data(:,3);
clear A; % para limpiar A y no usar mucha memoria

[X,Y] = meshgrid(x,y); % La grilla crea una matricula
Z = griddata(x,y,V,X,Y); % Es una matriz

figure(1);
h=surf(X,Y,Z, 'FaceAlpha', 0.5 ); %