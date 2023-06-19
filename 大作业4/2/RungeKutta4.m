function [x,y] = RungeKutta4(x0, xn, y0, h)
n = (xn-x0)/h;
x = zeros(n+1,1);
y = zeros(n+1,1);
x(1) = x0;
y(1) = y0;
for i = 1:n
   x(i+1) = x(i)+h;
   K1 = fun(x(i), y(i));
   K2 = fun(x(i)+h/2, y(i)+K1*h/2);
   K3 = fun(x(i)+h/2, y(i)+K2*h/2);
   K4 = fun(x(i)+h, y(i)+K3*h);
   y(i+1) = y(i)+h/6*(K1+2*K2+2*K3+K4);
end
end
