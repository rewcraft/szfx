function [T,U] = ODE_TIXING(t,h,x0)
T=min(t):h:max(t);
n=length(T);
T(1)=min(t);
T=T.';
U=zeros(1,n);
U(1)=x0;
for i=1:n-1
    O1=exp(T(i))*(100*cos(T(i))-sin(T(i)));
    O2=exp(T(i+1))*(100*cos(T(i+1))-sin(T(i+1)));
    Z1=-99*U(i)+O1;
    syms u
    eqn=-u+U(i)+h/2*(Z1-99*u+O2);
    U(i+1)=solve(eqn,u);
end
U=U.';
end




