clc;clear;
N = 1000; fs = 16000;
noise = 1-2*rand(1,N);
sig = repmat(noise, 1, 10);
[pxx, w] = pwelch(sig,[],[],512,fs);
b = fir2(3000,w/8000, sqrt(pxx/max(pxx)));
[h, wh] = freqz(b, 1, 128);
ssn = filter(b, 1, noise);
[pssn, wssn] = pwelch(ssn,[],[],512,fs);
[s1,fs1] = audioread("C_01_01.wav");
[s2,fs2] = audioread("C_01_02.wav");

figure(1);
plot(wssn,pssn);xlabel("The ssn");ylabel('fs = 16000');
[ps1, ws1] = pwelch(s1,[],[],512,fs1);
[ps2, ws2] = pwelch(s2,[],[],512,fs2);

figure(2);
subplot(211);
plot(ws1,ps1);xlabel('C_01_01.wav');ylabel('fs = 16000');
subplot(212);
plot(ws2,ps2);xlabel('C_01_02.wav');ylabel('fs = 16000');
