a_x = [0,3/4, zeros(1,7), -1/2,0, -1/2, zeros(1,7), 3/4];
x_20 = 20*ifft(a_x);
x = [x_20,x_20,x_20,x_20,x_20,x_20];
N = -20:99;
%stem(N,x),title('x'),xlabel('index'),ylabel('value')
a1 = 1; %input
b1 = [1 -0.8]; %output
a2 = 1; %input
b2 = [1 0.8]; %output
y1 = filter(b1,a1,x);
y2 = filter(b2,a2,x);
%subplot(2,1,1),stem(0:99,y1(21:120)),title('y1'),xlabel('index'),ylabel('value')
%subplot(2,1,2),stem(0:99,y2(21:120)),title('y2'),xlabel('index'),ylabel('value')
y1_20 = y1(21:40);
y2_20 = y2(21:40);
a_y1 = (1/20)*fft(y1_20);
a_y2 = (1/20)*fft(y2_20);
subplot(2,1,1),stem(0:19,abs(a_y1)),title('a__y1'),xlabel('index'),ylabel('value')
subplot(2,1,2),stem(0:19,abs(a_y2)),title('a__y2'),xlabel('index'),ylabel('value')
