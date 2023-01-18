function y = diffeqn(a, x, ynl)
for n = 0 : size(x, 2) - 1
    y(n + 1) = a * ynl + x(n + 1);
    ynl = y(n + 1);
end
stem(0:size(x, 2) - 1, y)

    
    