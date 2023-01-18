N = 5;
a = [1,2*exp(-j*pi/3),exp(j*pi/4), exp(-j*pi/4),2*exp(j*pi/3)];
for n = 1:5
    sum = 0;
    for k = 1:5
        sum = a(k)*exp(i*2*pi*(k-1)/5*(n-1)) + sum;
    end
    x(n) = sum;
end
subplot(2,1,1)
stem(0:4, real(x));
xlabel('x');ylabel(' real value');

subplot(2,1,2)
stem(0:4, imag(x));
xlabel('x');ylabel(' imag value');