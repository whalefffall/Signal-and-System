clc
clear
load ctftmod.mat;
m1 = lsim(bf,af,x.*cos(2*pi*f1*t),t(1:length(x)));
plot(t,m1),title('m1'),xlabel('t'),ylabel('magn')
