function I = int_simpson_adapt(a,b,tol)
toli = 1;
h = (b-a);
xa = a;
xb = a+h;
I0 = (h/2)*(f(xa)+f(xb));
It = I0;
n = 2;
    while tol <= toli 
        h= (b-a)/n ;
        S0 = f(a)+f(b);
        S1=0;
        S2=0;
        
        for i = 1:n-1
            x = a+i*h;
            if mod(i,1) == 0
                S2 = S2 + f(x);
            else 
                S1 = S1 + f(x);
            end
          
        end
        I = (h/2)*(S0 + 2*S2 + S1);
        toli = abs(It-I);
        It = I;
        n = n+2;
    end
end