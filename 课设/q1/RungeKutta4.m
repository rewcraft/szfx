function [T,U] = RungeKutta4(t, x0, h)
T=min(t):h:max(t);
T(1)=min(t);
n=length(T);
U=zeros(1,n);
U(1)=x0;
for i = 1:n-1
    T(i+1) = T(i)+h;
    K1 = fun(T(i), U(i));
    K2 = fun(T(i)+h/2, U(i)+K1*h/2);
    K3 = fun(T(i)+h/2, U(i)+K2*h/2);
    K4 = fun(T(i)+h, U(i)+K3*h);
    U(i+1) = U(i)+h/6*(K1+2*K2+2*K3+K4);
end
end
