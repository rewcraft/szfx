function s=Lagrange(x0,y0,x)
n=length(x0);
y=0;
for j=0:(n-1)
    t=1;
    for i=0:(n-1)
        if i~=j
            t=t*(x-x0(i+1))/(x0(j+1)-x0(i+1));
        end
    end
    y=y+t*y0(j+1);
end
s=y;
end