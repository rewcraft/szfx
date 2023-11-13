function p = Lag(x, y)
p = 0;
n = length(x);
syms t
for i = 1 : n
    s = 1;
    for k = [1:i-1, i+1:n]       
        s = s * (t - x(k)) / (x(i) - x(k));        
    end
    p = p + s * y(i);
end
p = expand(p);
end