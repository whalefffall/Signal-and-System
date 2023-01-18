clc
clear
N = 1000;
tau = 0.01;
t = [0:0.01:9.99];
w = -(pi/tau)+(0:N-1)*(2*pi/(N*tau));
plot(w),title('w'),xlabel('t'),ylabel('value')