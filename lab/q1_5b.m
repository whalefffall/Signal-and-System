a = 1;
ynl = 0;
x1 = zeros(1, 31);
x1(1) = 1;
x2 = ones(1, 31);
y1 = diffeqn(a, x1, ynl);
y2 = diffeqn(a, x2, ynl);