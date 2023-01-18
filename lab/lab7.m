N=4;
dtfstimes = zeros(1,10);
for m =1:6
    N=N*2;
    for k=1:10
        x=(0.9).^[0:N-1];
        f=@()dtfs(x,0);
        t(k) = timeit(f);
        dtfstimes(m)=dtfstimes(m)+t(k);
    end
    dtfstimes(m)=dtfstimes(m)/length(t);
end
dtfstimes = [dtfstimes(1) dtfstimes(3:6)]
ffttimes = zeros(1,10);
N = 4;
for m =1:6
    N=N*2;
    for k=1:10
        x=(0.9).^[0:N-1];
        f=@()fft(x,0);
        t(k) = timeit(f);
        ffttimes(m)=ffttimes(m)+t(k);
    end
    ffttimes(m)=ffttimes(m)/length(t);
end
ffttimes = [ffttimes(1) ffttimes(3:6)]
%figure(1)
%loglog([8 32 64 128 256],dtfstimes,'b'),hold on,
%loglog([8 32 64 128 256],ffttimes,'r'),xlabel('logN'),ylabel('lagTIME'),title('Calculate time in log form')
%legend('dtfstimes','ffttimes')

clc;
clear
N=40;n=0:N-1;
x=(0.9).^n;h=(0.5).^n;
%f1=@()conv([x x],h);
%f40c=timeit(f1);
%y=conv([x x], h);

%figure(3)
%stem(y(1:40)),xlabel('n'),yalbel('y[n]'),title('One period of y[n],N=40')
y_fft=fft(x)/40.*(fft(h))/40;
f3=@()real(40*ifft(y_fft));
f40f=timeit(f3);
y=40*(40*ifft((fft(x)/40.*(fft(h)/40))));
figure(5)
subplot(2,1,1)
stem(y(1:40)),xlabel('h'),ylabel('y[n]'),title('One period of y[n] by DTFS, N=40')
subplot(2,1,2)
Y=conv([x x],h);
stem(Y(1:40)),xlabel('n'),ylabel('y[n]'),title('One period of y[n] by conv,N=40')
for N=1:128
    n=0:N-1;
    x=(0.9).^n;h=(0.5).^n;
    f=@()conv([x x],h);
    fc(N)=timeit(f);
    coeff=(fft(x).*(fft(h)));
    f=@()(N*ifft(coeff));
    ff(N)=timeit(f);
end

figure(7)
stem(fc,'r'),hold on,xlabel('N'),ylabel('time')
stem(ff,'b'),legend('conv method','DFTS method'),title('The time using by ocnv % DFTS method')