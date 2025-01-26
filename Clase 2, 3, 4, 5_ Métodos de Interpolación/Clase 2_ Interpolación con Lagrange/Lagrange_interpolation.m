%Interpolación clase 15/03/24



%clearvars;
%x = (1:0.5:100)'; % de 1 a 100 en aumentos de 10.
%y = 1./x; % el punto es para trabjar con vectores
%figure(1);
%plot(x,y, ' o ');
%xlabel("x");
%ylabel("y");

%xt = 50.55; % encontrar el yt para el xt.


%function Yt = Lagrange_interpolation(x,y,xt) 


Lk = zeros(size(x));
L = 1;

for k=1:size(x,1)
    for i=1:size(x,1)
        if x(i)~=x(k)
            Lt =  (xt-x(i))/ (x(k)-x(i));
            L = L*Lt;
        end
    end
    Lk(k) = L; L=1; 
end;
    
yt = 0; 
for i=1:size(y,1)
    yt = y(i)*Lk(i)+yt;
end

diff = (1/xt - yt);

%end
%figure(2);
%plot(x,Lk, ' -b ');