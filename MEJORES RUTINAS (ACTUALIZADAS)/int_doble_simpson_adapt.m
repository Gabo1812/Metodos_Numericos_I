function [I,n,m] = int_doble_simpson_adapt(f,a,b,c,d,tol)
    toli = 1;
    It = 0;
    n = 2;
    m = 2;
    
    while tol <= toli
        P0 = 0; % Para almacenar terminos extremos 
        P1 = 0; % Para almacenar los terminos impares
        P2 = 0; % Para almacenar los terminos pares 
        for i=0:n % for para integrar en x
            hx=(b-a)/n;
            x = (a+i*hx);
            S0 = f(x,c) + f(x,d);
            S1=0;
            S2=0;
            for j=1:m-1 % Para integrar en y
                hy = (d-c)/m;
                y = (c+j*hy);
                if mod(j,2)==0
                    S2 = S2+f(x,y);
                else
                    S1 = S1+ f(x,y);
                end
                Iy = (hy/3)*(S0+2*S2+4*S1);
            end
            if (i==0)||(i==n)
                P0 = P0 + Iy;
            elseif mod(i,2) == 0
                P2 = P2+Iy;
            else 
                P1 = P1+Iy;
            end
        end
        I = (hx/3)*(P0+2*P2+4*P1);
        toli = abs(It - I);
        It = I;
        n = n+2;
        m = m+2;
    end
end