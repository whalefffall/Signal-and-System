clc
clear
load lineup.mat
%sound(y,8192);
N = 1000;
he = [1 zeros(1,999) 1.5];
nhe = 0:1000;
d = [1 zeros(1,4000)];
A = [1 zeros(1,N-1), 0.5];
B = 1;
her = filter(B,A,d);
nher = 0:4000;
stem(nher, her);
xlabel('index');
ylabel('value');
title('her');