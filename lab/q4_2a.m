clc
clear
x = sym('r');
y = fourier(exp(-2*abs(x)))