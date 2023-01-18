clc
clear
x1 = [1 1 1 1 1 0 0 0 0 0];
h1 = [1 -1 3 0 1];
h2 = [0 2 5 4 -1];
an1 = conv(x1,h1) + conv(x1,h2);
an2 = conv(x1,h1 + h2);
subplot(2,1,1);
stem(1:14,an1);
ylabel('value');
xlabel('index');
title('conv(x1,h1) + conv(x1,h2)');
subplot(2,1,2);
stem(1:14,an2);
ylabel('value');
xlabel('index');
title('conv(x1,h1 + h2)');