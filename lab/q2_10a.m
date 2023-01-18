clc
clear
load lineup.mat
%sound(y,8192);
he = [1 zeros(1,999) 1.5];
nhe = 0:1000;
stem(nhe, he);
xlabel('index');
ylabel('value');
title('he');