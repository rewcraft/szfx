function [T,U] = Adams4(t, y0, h)
T=min(t):h:max(t);
n=length(T);
U=zeros(1,n);
U(1)=y0;
if n < 4
    error('步长过小');
end
for i = 1:3
    T(i+1) = T(i)+h;
    K1 = fun(T(i), U(i));
    K2 = fun(T(i)+h/2, U(i)+K1*h/2);
    K3 = fun(T(i)+h/2, U(i)+K2*h/2);
    K4 = fun(T(i)+h, U(i)+K3*h);
    U(i+1) = U(i)+h/6*(K1+2*K2+2*K3+K4);
end
for i=4:n-1
    U(i+1)=U(i)+h/24*(55*fun(T(i),U(i))-59*fun(T(i-1),U(i-1))+37*fun(T(i-2),U(i-2))-9*fun(T(i-3),U(i-3)));
end
end