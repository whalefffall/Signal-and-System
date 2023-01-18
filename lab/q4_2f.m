clc
clear
N = 1000;
tau = 0.01;
t = [0:0.01:9.99];
w = -(pi/tau)+(0:N-1)*(2*pi/(N*tau));
yt = exp(-2*abs(t-5));
Y = tau*fftshift(fft(yt));
X = Y.*exp(5*i*w);
Xm = abs(X);
Xp = angle(X);
F = 4./(w.^2 + 4);
Fm = abs(F);
Fp = angle(F);
subplot(2,1,1)
semilogy(w,Xm,'b'),hold on,title('magnitude of X and accurate value '),xlabel('w'),ylabel('value')
semilogy(w,Fm,'r')
legend('abs(X)','abs(F)')
subplot(2,1,2)
plot(w,Xp,'b'),hold on,title('angle of X and accurate value'),xlabel('w'),ylabel('value')
plot(w,Fp,'r')
legend('angle(X)','angle(F)')
