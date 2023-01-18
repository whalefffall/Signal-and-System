clc
clear
load ctftmod.mat;
m1 = lsim(bf,af,x.*cos(2*pi*f1*t),t(1:length(x)));
m2 = lsim(bf,af,x.*sin(2*pi*f1*t),t(1:length(x)));
m3 = lsim(bf,af,x.*sin(2*pi*f2*t),t(1:length(x)));

subplot(3,1,1)
plot(t,m1),title('m1'),xlabel('t'),ylabel('magn')

subplot(3,1,2)
plot(t,m2),title('m2'),xlabel('t'),ylabel('magn')

subplot(3,1,3)
plot(t,m3),title('m3'),xlabel('t'),ylabel('magn')
