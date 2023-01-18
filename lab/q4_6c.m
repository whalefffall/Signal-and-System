load ctftmod.mat;
ydash = lsim(bf, af, dash, t(1:length(dash)));
ydot = lsim(bf, af, dot, t(1:length(dot)));
subplot(2,1,1)
plot(t(1:length(dash)),dash),hold on,title('dash and ydash'),xlabel('freq'),ylabel('magn')
plot(t(1:length(ydash)),ydash,'r')
legend('dash','ydash');

subplot(2,1,2)
plot(t(1:length(dot)),dot),hold on,title('dot and ydot'),xlabel('freq'),ylabel('magn')
plot(t(1:length(ydot)),ydot,'r')
legend('dot','ydot');