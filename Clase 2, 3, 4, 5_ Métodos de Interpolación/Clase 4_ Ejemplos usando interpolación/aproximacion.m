clearvars;
x = (1:0.5:100)';

y = 1./x;

figure(1)
plot(x,y, '.b')
xlabel("x");
ylabel("y")

xt = 50.3; % encontrar el yt para este xt por la aproximacion por polinomios de lagrange

L_k = zeros(size(x));

L=1;

for k=1 :size(x,1)
    for i=1:size(x,1)
        if x(i) ~= x(k)
            L_t = (xt - x(i))/(x(k)-x(i));
            L = L*L_t ;
        end
    end
    L_k(k) = L ; 
    L=1 ; 
end

yt= 0;
for i=1:size(y,1)
    yt = y(i) * L_k(i) + yt;
end

diff = (1/xt - yt);

figure(2);
plot(x,L_k,'-b');


