function y0=Newtonian_interpolated(x,y,x0)
y0=ones(1,length(x0));
for k=1:length(x0)
    table=Newtonian_mean_difference_table(x,y);
    y0(k)=y(1);
    for m=2:length(x)
        product=1;
        for n=2:m
            product=product.*(x0(k)-x(n-1));
        end
        y0(k)=y0(k)+table(m,m+1).*product;
    end
end