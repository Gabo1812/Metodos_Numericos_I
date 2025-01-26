function II = int_doble_simpson(f,a,b,c,d,n,m)

    hx=(b-a)/n;
    hy = (d-c)/m;
    P0 = 0; % Para almacenar terminos extremos 
    P1 = 0; % Para almacenar los terminos impares
    P2 = 0; % Para almacenar los terminos pares
    %Función de integral doble comenzaria aqui 
    for i=0:n % for para integrar en x
        x = (a+i*hx);
        S0 = f(x,c) + f(x,d);
        S1=0;
        S2=0;
        for j=1:m-1 % Para integrar en y
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
II = (hx/3)*(P0+2*P2+4*P1);
end