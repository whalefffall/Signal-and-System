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
Ym = abs(Y);
Yp = angle(Y);

subplot(2,1,1)
semilogy(w,Xm,'b'),hold on,title('magnitude of X and Y'),xlabel('w'),ylabel('value')
semilogy(w,Ym,'y')
legend('abs(X)','abs(Y)')
subplot(2,1,2)
plot(w,Xp,'b'),hold on,title('angle of X and Y'),xlabel('w'),ylabel('value')
plot(w,Yp,'y')
legend('angle(X)','angle(Y)')
