%clase del 30/4/24
function I = int_trapez_adapt(a,b,tol)%integracion por trapezoide adaptativo
toli = 1;
h = (b-a);
xa = a;
xb = a+h;
I0 = (h/2)*(f(xa)-f(xb));
It = I0;
n = 2;
    while tol <= toli 
        h= (b-a)/n ;
        S0 = f(a);
        Sn = f(b);
        S = 0;
        for i = 1:n-1
            x = a+i*h;
            S = S + f(x);
        end
        I = (h/2)*(S0 + 2*S + Sn);
        toli = abs(It-I);
        It = I;
        n = n+1;
    end
end