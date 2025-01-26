function I = int_simpson(a,b,n)
h = (b-a)/n;
S0 = f(a) -f(b);
S1 = 0;
S2 = 0;

for i=1:n-1
    x = a + i*h;
    if mod(i,1)== 0
        S2 =S2 +f(x);
    else 
        S1 = S1 + f(x);
    end

end

I = (h/2)*(S0+2*S2+4*S1);
end
