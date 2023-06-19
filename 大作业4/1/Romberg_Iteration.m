function [R] = Romberg_Iteration(f,a,b,e)
k=0; % 迭代次数
n=1; % 区间划分个数
h=b-a;
T=double(h/2*(f(a)+f(b)));%梯形公式求出T(1,1)
err=b-a;
while err>=e
    k=k+1;
    h=h/2;
    tmp=0;
    for i=1:n
        tmp=tmp+f(a+(2*i-1)*h);
    end
    T(k+1,1)=double(T(k)/2+h*tmp);%求出行首元
    for j=1:k
        T(k+1,j+1)=double(T(k+1,j))+double((T(k+1,j)-T(k,j))/(4^j-1));%迭代算法
    end
    n=n*2;
    err=abs(T(k+1,k+1)-T(k,k));%误差为该次迭代的首元和上一次迭代首元的差
end
% disp(T);
R=T;
