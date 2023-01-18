clc
clear
%the number of bands
N = 4;
%get the origin signal
[x1, fs1] = audioread('C_01_01.wav');
[x2, fs2] = audioread('C_01_02.wav');
%the lower bound of the frequency
fl = 200;
%the higher bound of the frequency
fh = 7000;
%enum cut-off frequencies of the LPF
fc1 = 20;
fc2 = 50;
fc3 = 100;
fc4 = 400;
x1 = x1';
x2 = x2';
%get the new signals
y11 = get_wave(x1, fs1, N, fl, fh, fc1);
y12 = get_wave(x1, fs1, N, fl, fh, fc2);
y13 = get_wave(x1, fs1, N, fl, fh, fc3);
y14 = get_wave(x1, fs1, N, fl, fh, fc4);

y21 = get_wave(x2, fs2, N, fl, fh, fc1);
y22 = get_wave(x2, fs2, N, fl, fh, fc2);
y23 = get_wave(x2, fs2, N, fl, fh, fc3);
y24 = get_wave(x2, fs2, N, fl, fh, fc4);

%time scale for the new signals
t1 = (0:1/fs1:length(x1)/fs1 - 1/fs1);
t2 = (0:1/fs2:length(x2)/fs2 - 1/fs2);

% plot new signals in time filed
figure(2)
subplot(411)
plot(t1,y11),title('fc = 20Hz'),xlabel('t(s)'),ylabel('amplitude')
subplot(412)
plot(t1,y12),title('fc = 50Hz'),xlabel('t(s)'),ylabel('amplitude')
subplot(413)
plot(t1,y13),title('fc = 100Hz'),xlabel('t(s)'),ylabel('amplitude')
subplot(414)
plot(t1,y14),title('fc = 400Hz'),xlabel('t(s)'),ylabel('amplitude')

figure(3)
subplot(411)
plot(t2,y21),title('fc = 20Hz'),xlabel('t(s)'),ylabel('amplitude')
subplot(412)
plot(t2,y22),title('fc = 50Hz'),xlabel('t(s)'),ylabel('amplitude')
subplot(413)
plot(t2,y23),title('fc = 100Hz'),xlabel('t(s)'),ylabel('amplitude')
subplot(414)
plot(t2,y24),title('fc = 400Hz'),xlabel('t(s)'),ylabel('amplitude')

%define the x-axis fot the fourier transform of the new signals
freq1 = linspace(-fs1/2,fs1/2-1,length(x1));
freq2 = linspace(-fs2/2,fs2/2-1,length(x2));

%plot the fourier transform
figure(4)
subplot(411)
plot(freq1,fftshift(abs(fft(y11./(length(y11)))))),title('fc = 20Hz'),xlabel('frequency(Hz)'),ylabel('fft')
subplot(412)
plot(freq1,fftshift(abs(fft(y12./(length(y12)))))),title('fc = 50Hz'),xlabel('frequency(Hz)'),ylabel('fft')
subplot(413)
plot(freq1,fftshift(abs(fft(y13./(length(y13)))))),title('fc = 100Hz'),xlabel('frequency(Hz)'),ylabel('fft')
subplot(414)
plot(freq1,fftshift(abs(fft(y14./(length(y14)))))),title('fc = 400Hz'),xlabel('frequency(Hz)'),ylabel('fft')

figure(5)
subplot(411)
plot(freq2,fftshift(abs(fft(y21./(length(y21)))))),title('fc = 20Hz'),xlabel('frequency(Hz)'),ylabel('fft')
subplot(412)
plot(freq2,fftshift(abs(fft(y22./(length(y22)))))),title('fc = 50Hz'),xlabel('frequency(Hz)'),ylabel('fft')
subplot(413)
plot(freq2,fftshift(abs(fft(y23./(length(y23)))))),title('fc = 100Hz'),xlabel('frequency(Hz)'),ylabel('fft')
subplot(414)
plot(freq2,fftshift(abs(fft(y24./(length(y24)))))),title('fc = 400Hz'),xlabel('frequency(Hz)'),ylabel('fft')

%calculate the power of the new signals
[p11,w11] = pwelch(y11,[],[],512,fs1);
[p12,w12] = pwelch(y12,[],[],512,fs1);
[p13,w13] = pwelch(y13,[],[],512,fs1);
[p14,w14] = pwelch(y14,[],[],512,fs1);
[p21,w21] = pwelch(y21,[],[],512,fs2);
[p22,w22] = pwelch(y22,[],[],512,fs2);
[p23,w23] = pwelch(y23,[],[],512,fs2);
[p24,w24] = pwelch(y24,[],[],512,fs2);

%plot new signals in power field
figure(6)
subplot(411)
plot(w11,p11),title('fc = 20Hz'),xlabel('frequency(Hz)'),ylabel('power(W)')
subplot(412)
plot(w12,p12),title('fc = 50Hz'),xlabel('frequency(Hz)'),ylabel('power(W)')
subplot(413)
plot(w13,p13),title('fc = 100Hz'),xlabel('frequency(Hz)'),ylabel('power(W)')
subplot(414)
plot(w14,p14),title('fc = 400Hz'),xlabel('frequency(Hz)'),ylabel('power(W)')

figure(7)
subplot(411)
plot(w21,p21),title('fc = 20Hz'),xlabel('frequency(Hz)'),ylabel('power(W)')
subplot(412)
plot(w22,p22),title('fc = 50Hz'),xlabel('frequency(Hz)'),ylabel('power(W)')
subplot(413)
plot(w23,p23),title('fc = 100Hz'),xlabel('frequency(Hz)'),ylabel('power(W)')
subplot(414)
plot(w24,p24),title('fc = 400Hz'),xlabel('frequency(Hz)'),ylabel('power(W)')

%record the new signals
audiowrite('P1_1_fc_=_20.wav',y11,fs1);
audiowrite('P1_1_fc_=_50.wav',y12,fs1);
audiowrite('P1_1_fc_=_100.wav',y13,fs1);
audiowrite('P1_1_fc_=_400.wav',y14,fs1);

audiowrite('P1_2_fc_=_20.wav',y21,fs2);
audiowrite('P1_2_fc_=_50.wav',y22,fs2);
audiowrite('P1_2_fc_=_100.wav',y23,fs2);
audiowrite('P1_2_fc_=_400.wav',y24,fs2);

%encapsulate the process with a function
function res = get_wave(in, fs, N, fl, fh, fc)
  %predefine the size of the result
  res = zeros(1,length(in));
  %calculte the physical distance of human ear corresponding to given frequencies 
  dl = log10(fl/165.4 + 1)/0.06;
  dh = log10(fh/165.4 + 1)/0.06;
  d = (dh - dl)/N;
  len = length(in)/fs;
  %define the time scale for the sine signals
  t = (0:1/fs:len - 1/fs);
  for n = 1:N
      %calculate the lower bound and the higher bound of the band-pass
      %filer
      l = 165.4*(10^(0.06*(dl + d*(n-1)))-1);
      h = 165.4*(10^(0.06*(dl + d*n))-1);
      [b, a] = butter(4, [l, h]/(fs/2));
      wave = filter(b, a, in);
      %full-wave recitification
      wave = abs(wave);
      [x, y] = butter(4, fc/(fs/2));
      %plot the certification for the filter
      if (n == 1) 
      [h1 ,f1] = freqz(b,a,512,fs);
      [h2 ,f2] = freqz(x,y,512,fs);
      figure(1)
      subplot(211)
      plot(f1,20*log10(abs(h1)),'r'),axis([0 1400 -10 2]),title(sprintf("the range of frequency of the band-pass filter is from %f Hz to %f Hz",l,h));
      xlabel('Freqency(Hz)'),ylabel('Magnitude(dB)')
      subplot(212)
      plot(f2,20*log10(abs(h2)),'r'),axis([0 1400 -10 2]),title(sprintf("the cut-off frequency of the low-pass filter is %f Hz",fc));
      xlabel('Freqency(Hz)'),ylabel('Magnitude(dB)')
      end
      env = filter(x, y, wave);
      sin_sig = sin(2 * pi * (l + (h - l)/2)* t);
      %sum up
      res = sin_sig.* env + res;
  end
  %normalization
  res = res*norm(in)/norm(res);
end


