clc;clear;close all;
[x,fs] = audioread("C_01_01.wav");
N = length(x);fs = 16000;
noise = 1-2*rand(1,N);
sig = repmat(noise,1,10);
[pxx, w] = pwelch(sig,[],[],512,fs);
b = fir2(3000,w/8000,sqrt(pxx/max(pxx)));
[h,wh] = freqz(b,1,128);
ssn = filter(b,1,noise);
ssn = ssn';
y = x + ssn;
y = (y/norm(y))*norm(x);
fc1 = 100;
fc2 = 200;
fc3 = 300;
[b1, a1] = butter(2,fc1/(fs/2));
[b2, a2] = butter(2,fc2/(fs/2));
[b3, a3] = butter(2,fc3/(fs/2));
y_abs = abs(y);
y_envelop1 = filter(b1,a1,y_abs);
y_envelop2 = filter(b2,a2,y_abs);
y_envelop3 = filter(b3,a3,y_abs);
figure(1)
subplot(311)
plot(y_envelop1,'r'),xlabel('t'),
ylabel('Response')
legend('fc1 = 100')
subplot(312)
plot(y_envelop2,'g'),xlabel('t'),
ylabel('Response')
legend('fc1 = 200')
subplot(313)
plot(y_envelop3,'b'),xlabel('t'),
ylabel('Response')
legend( 'fc3 = 300')
[b4, a4] = butter(6,fc2/(fs/2));
y_envelop4 = filter(b4,a4,y_abs);
figure(2)
plot(y_envelop2,'r'),hold on,xlabel('t'),
ylabel('Response')
plot(y_envelop4,'g')
legend('order1 = 2','order2 = 6')



