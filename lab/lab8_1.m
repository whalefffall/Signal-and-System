clc
clear
fs = 8000;
%[b, a] = butter(2,400/(fs/2));%low-pass
%[b, a] = butter(2,400/(fs/2),'high');%high-pass
%[b, a] = butter(2,[400, 1000]/(fs/2));%band-pass
%[h ,f] = freqz(b,a,512,fs);%digital filter freqency response
%plot(f,20*log10(abs(h)));%in dB scale
%axis([0 5000 -50 5]);
%xlabel('Freqency(Hz)');
%ylabel('Magnitude');
[b1, a1] = butter(2,[400, 1000]/(fs/2));%band-pass
[b2, a2] = butter(4,[400, 1000]/(fs/2));%band-pass
[b3, a3] = butter(8,[400, 1000]/(fs/2));%band-pass
[h1 ,f1] = freqz(b1,a1,512,fs);
[h2 ,f2] = freqz(b2,a2,512,fs);
[h3 ,f3] = freqz(b3,a3,512,fs);
plot(f1,20*log10(abs(h1)),'r'),hold on,axis([0 1400 -10 2]);
xlabel('Freqency(Hz)'),
ylabel('Magnitude')
plot(f2,20*log10(abs(h2)),'g'),hold on,
plot(f3,20*log10(abs(h3)),'b')
legend('Order=2','Order=4','Order=8')