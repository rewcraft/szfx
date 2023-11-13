function y=lagrange(x0,y0,x)   %x0,y0为初始坐标，x为需要插值的点，返回的y为插值结果
n=length(x0);m=length(x);
for i=1:m
    z=x(i);
    s=0;
    for j=1:n
        p=1;
        for k=1:n
            if k~=j
                p=p*((z-x0(j))/(x0(k)-x0(j)));
            end
        end
        s=p*y0(k)+s;
    end
    y(i)=s;
end