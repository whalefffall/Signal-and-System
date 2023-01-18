a = 1;
ynl = -1;
x1 = ones(1, 31);
x1(1) = 1;
x2 = 2 * x1;
y1 = diffeqn(a, x1, ynl);
y2 = diffeqn(a, x2, ynl);
stem(0: 30, 2 * y1 - y2);