clc
clear
N = 1000;
tau = 0.01;
t = [0:0.01:9.99];
yt = exp(-2*abs(t-5));
Y = tau*fftshift(fft(yt));
subplot(2,1,1)
plot(t,abs(Y)),title('magnitude of Y'),xlabel('t')
subplot(2,1,2)
plot(t,angle(Y)),title('phase of Y'),xlabel('t')