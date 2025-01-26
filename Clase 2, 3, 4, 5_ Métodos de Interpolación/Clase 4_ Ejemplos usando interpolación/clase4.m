
clearvars;
filename ='absortion_of_pure_water_300_to_800_nm_s';
A = readmatrix(filename);
lambda = A(4:end,1);
k = A(4:end,2);
figure(1);
plot(lambda,k, ' ob ');
xlabel('lambda(nm)');
ylabel('k(1/cm)');

lambdat = (300:4:800)';

kk = zeros((size(lambdat)));
epsilon = 1e-4;

for i=1:size(lambdat,1)
    kk(i) = Neuville_interpolation(lambda,k,lambdat(i),epsilon);
end


figure(2);
plot(lambdat,kk, ' or ');
xlabel('lambda(nm)');
ylabel('k(1/cm)');


%nueva figura 
% hay que revisar porque explota la wea a un polinomio


figure(3)
plot(lambda,k, 'og');
hold on;
plot(lambdat,kk, 'or');
xlabel('lambda(nm)');
ylabel('k(1/cm)');
hold off;

