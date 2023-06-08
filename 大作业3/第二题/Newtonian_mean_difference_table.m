function table=Newtonian_mean_difference_table(x,y)
table=[x',y'];
[M,N]=size(table);
for n=3:M+1
    for m=n-1:M
    table(m,n)=(table(m,n-1)-table(m-1,n-1))/(table(m,1)-table(m-n+2,1));
    end
end
end
