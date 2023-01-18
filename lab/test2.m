clc
clear
%1
x(1) = 1;
h(1) = 1;
for i = 2:81
    x(i) = 0.9*x(i-1);
    h(i) = 0.5*h(i-1);
end
figure(1)
subplot(211)
stem(0:80,x),title('x'),xlabel('n'),ylabel('value')
subplot(212)
stem(0:80,h),title('h'),xlabel('n'),ylabel('value')
%2
clc
clear
x(1) = 1;
h(1) = 1;
for i = 2:80
    x(i) = 0.9*x(i-1);
    h(i) = 0.5*h(i-1);
end
figure(1)
subplot(211)
stem(0:79,x),title('x'),xlabel('n'),ylabel('value')
subplot(212)
stem(0:79,h),title('h'),xlabel('n'),ylabel('value')
y1 = conv(x, h);
figure(2)
stem(0:158,y1),title('x[n] * h[n]'),xlabel('n'),ylabel('value')
%3
clc
clear
x(1) = 1;
h(1) = 1;
for i = 2:8
    x(i) = 0.9*x(i-1);
    h(i) = 0.5*h(i-1);
end
fftx1 = fft(x);
f = @()fft(x);
t1 = timeit(f)

for i = 6:16
    x(i) = 0.9*x(i-1);
    h(i) = 0.5*h(i-1);
end
fftx2 = fft(x);
f = @()fft(x);
t2 = timeit(f)

for i = 17:32
    x(i) = 0.9*x(i-1);
    h(i) = 0.5*h(i-1);
end
fftx3 = fft(x);
f = @()fft(x);
t3 = timeit(f)

for i = 33:64
    x(i) = 0.9*x(i-1);
    h(i) = 0.5*h(i-1);
end
fftx4 = fft(x);
f = @()fft(x);
t4 = timeit(f)

for i = 65:128
    x(i) = 0.9*x(i-1);
    h(i) = 0.5*h(i-1);
end
fftx5 = fft(x);
f = @()fft(x);
t5 = timeit(f)

for i = 129:256
    x(i) = 0.9*x(i-1);
    h(i) = 0.5*h(i-1);
end
fftx6 = fft(x);
f = @()fft(x);
t6 = timeit(f)


figure(3)
subplot(611)
stem(0:7,fftx1),title('N=8')
subplot(612)
stem(0:15,fftx2),title('N=16')
subplot(613)
stem(0:31,fftx3),title('N=32')
subplot(614)
stem(0:63,fftx4),title('N=64')
subplot(615)
stem(0:127,fftx5),title('N=128')
subplot(616)
stem(0:255,fftx6),title('N=256')

figure(4)
subplot(611)
stem(0:7,imag(fftx1)),title('N=8')
subplot(612)
stem(0:15,imag(fftx2)),title('N=16')
subplot(613)
stem(0:31,imag(fftx3)),title('N=32')
subplot(614)
stem(0:63,imag(fftx4)),title('N=64')
subplot(615)
stem(0:127,imag(fftx5)),title('N=128')
subplot(616)
stem(0:255,imag(fftx6)),title('N=256')
%4
clc
clear
x(1) = 1;
h(1) = 1;
for i = 2:80
    x(i) = 0.9*x(i-1);
    h(i) = 0.5*h(i-1);
end
fftx = fft(x);
conx = conv(x,h);
con = 1/80*ifft(fftx)
%5
figure(5)
subplot(211)
stem(0:79,conx(1:80))

subplot(212)
stem(0:79,con(1:80))