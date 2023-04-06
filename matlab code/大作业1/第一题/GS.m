function y=GS(A,b,M)
%%  1.初始化
[n,~]=size(A);
x=zeros(n,1);
%%  2.求D
D=diag(diag(A));
%% 3.求L
L=-tril(A,-1);
%% 4.求U
U=-triu(A,1);
%% 5.求B
B=(D-L)\U;
%% 6.进行迭代
f=(D-L)\b;
y=B*x+f;n=1;
while norm(y-x)>=1.0e-10 && n<M
    x=y;
    y=B*x+f;
    n=n+1;
end