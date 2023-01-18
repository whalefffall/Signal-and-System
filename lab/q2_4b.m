clc
clear
x1 = [1 1 1 1 1 0 0 0 0 0];
h1 = [1 -1 3 0 1];
h2 = [0 2 5 4 -1];
an1 = conv(x1,h1);
an2 = conv(h1,x1);
subplot(2,1,1);
stem(1:14,an1);
ylabel('value');
xlabel('index');
title('conv(x1,h1)');
subplot(2,1,2);
stem(1:14,an2);
ylabel('value');
xlabel('index');
title('conv(h1,x1)');