clearvars;
n = 50;
a = 1;
b = 10;
tol = 0.001;
tic
int = int_trapezoide(a,b,n);
toc
tic
Inta = int_trapez_adapt(a,b,tol);
toc
tic
Ints = int_simpson (a,b,n);
toc
tic
Intsa = int_simpson_adapt(a,b,tol);
toc