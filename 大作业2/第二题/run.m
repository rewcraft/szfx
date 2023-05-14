lambda=1.3652300134140969;
x=3/2;
n=0;
while abs(x-lambda)>10^-6
    x=k1(x);
    n=n+1;
end
disp(n);
%%
lambda=1.3652300134140969;
x=3/2;
n=0;
while abs(x-lambda)>10^-6
    x=k2(x);
    n=n+1;
end
disp(n);
%%
lambda=1.3652300134140969;
x=3/2;
n=0;
while abs(x-lambda)>10^-6
    x=k3(x);
    n=n+1;
    if(n>1000000) 
        break;
    end
end
disp(n);
%%
lambda=1.3652300134140969;
x=3/2;
n=0;
while abs(x-lambda)>10^-6
    x=k4(x);
    n=n+1;
end
disp(n);
%%
lambda=1.3652300134140969;
x=3/2;
n=0;
while abs(x-lambda)>10^-6
    x=k5(x);
    n=n+1;
end
disp(n);
%%
lambda=1.3652300134140969;
x=-4;
n=0;
while abs(x-lambda)>10^-6
    x=k5(x);
    n=n+1;
end
disp(n);