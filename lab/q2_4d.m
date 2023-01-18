clc
clear
x1 = [1 1 1 1 1 0 0 0 0 0];
h1 = [1 -1 3 0 1];
h2 = [0 2 5 4 -1];
w = conv(x1,h1);
y1 = conv(w,h2);
h = conv(h1,h2);
y2 = conv(x1,h);
an1 = y1;
an2 = y2;
subplot(2,1,1);
stem(1:18,an1);
ylabel('value');
xlabel('index');
title('(x[n] * h1[n]) * h2[n]');
subplot(2,1,2);
stem(1:18,an2);
ylabel('value');
xlabel('index');
title('x[n] * (h1[n] * h2[n])');