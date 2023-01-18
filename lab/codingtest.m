clc
clear
%1
for i = 1:100
    x(i) = rand;
end
figure(1)
plot(x),title('x')
b1 = [1, zeros(1,49), 0.9];
a1 = 1;
b2 = [1, zeros(1,49), 0.9];
a2 = 1;
%2
h1 = impz(b1,a1);
y1 = conv(h1,x);
y2 = filter(b2,a2,x);
figure(2)
subplot(211)
stem(1:100,y1(1:100)),title('y1')
subplot(212)
stem(1:100,y2(1:100)),title('y2')
%y1 uses conv and y2 uses filter. The result shows that they are the same if only y1 is truncated.
%3
Rxx = conv(x,fliplr(x));
Ryy = conv(y1(1:100),fliplr(y1(1:100)));
figure(3)
subplot(211)
plot([-99:99],Rxx),title('Rxx')
subplot(212)
plot([-99:99],Ryy),title('Ryy')
%4
%Ryy[n] = x[n]*(delta[n] + a*delta[n-N]) * x[-n]*(delta[n] + a*delta[n+N]) = Rxx * ((1 + a^2)delta[n] + a*delta[n-N] + a*delta[n+N]);
%a = 0.9, N = 50
%Ryy = Rxx * ((1 + 0.9^2)delta[n] + 0.9*delta[n-N] + 0.9*delta[n+N]) = Rxx * (1.81*delta[n] + 0.9*delta[n-50] + 0.9*delta[n+50]);
%5
max1 = max(Ryy)
max2 = max(conv(Rxx, [0.9, zeros(1,49), 1.81, zeros(1,49) 0.9]))
%The result shows that they are not same.