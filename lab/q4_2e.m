clc
clear
N = 1000;
tau = 0.01;
t = [0:0.01:9.99];
w = -(pi/tau)+(0:N-1)*(2*pi/(N*tau));
yt = exp(-2*abs(t-5));
Y = tau*fftshift(fft(yt));
X = Y.*exp(5*i*w);
subplot(2,1,1)
plot(t,abs(X)),title('magnitude of X'),xlabel('t')
subplot(2,1,2)
plot(t,angle(X)),title('phase of X'),xlabel('t')

