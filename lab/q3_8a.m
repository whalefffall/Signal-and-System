a1 = 1; %input
b1 = [1 -0.8]; %output
a2 = 1; %input
b2 = [1 0.8]; %output
N = [0:2*pi/1024:2*pi];
y1 = freqz(b1,a1,N, 'whole');
y2 = freqz(b2,a2,N, 'whole');
figure(1)
plot(N,abs(y1)),title('y1'),xlabel('freq'),ylabel('value') 
figure(2)
plot(N,abs(y2)),title('y2'),xlabel('freq'),ylabel('value') 