x=1.5;
y=function_y(x);
z=function_z(x);
a=x-y/z;
n=0;
while abs(a-x)>10^-5
    x=a;
    y=function_y(x);
    z=function_z(x);
    a=x-y/z;
    n=n+1;
end
disp(n)
%%
x=0;
y=function_y(x);
z=function_z(x);
a=x-y/z;
n=0;
while abs(a-x)>10^-5
    x=a;
    y=function_y(x);
    z=function_z(x);
    a=x-y/z;
    n=n+1;
end
disp(n)
%%
x=-1;
y=function_y(x);
z=function_z(x);
a=x-y/z;
n=0;
while abs(a-x)>10^-5
    x=a;
    y=function_y(x);
    z=function_z(x);
    a=x-y/z;
    n=n+1;
end
disp(n)