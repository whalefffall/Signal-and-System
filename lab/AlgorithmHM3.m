v1 = [2,3,4,5,6];
v2 = [1,4,7,10];
L=pow2(nextpow2(5+4-1));
r1 = conv(v1,v2) %brute force
x1 = fft(v1,L);
x2 = fft(v2,L);
y = x1.*x2;
r2 = ifft(y)  %by fft