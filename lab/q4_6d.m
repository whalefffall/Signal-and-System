clc
clear
load ctftmod.mat;
y = dash.* cos(2 * pi * f1 * t(1:length(dash)));
yo = lsim(bf, af, y, t(1:length(dash)));
plot(t(1:length(y)),y),hold on,title('y and yo'),xlabel('t'),ylabel('magn')
plot(t(1:length(yo)),yo,'r')
legend('y','yo')