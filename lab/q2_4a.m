clc
clear
x1 = [1 1 1 1 1 0 0 0 0 0];
h1 = [1 -1 3 0 1];
h2 = [0 2 5 4 -1];
nx1 = 0:9;
nh1 = 0:4;
subplot(3,1,1);
stem(nx1, x1);
title('x1');
xlabel('x1');
ylabel('value');
subplot(3,1,2);
stem(nh1, h1);
title('h1');
xlabel('h1');
ylabel('value');
subplot(3,1,3);
stem(nh1, h2);
title('h2');
xlabel('h2');
ylabel('value');


